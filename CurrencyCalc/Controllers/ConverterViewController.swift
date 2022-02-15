//
//  ConverterViewController.swift
//  CurrencyCalc
//
//  Created by Михаил Бобров on 29.01.2022.
//

import UIKit
import SnapKit

enum ChangeValuteButtonCondition {
    case fristValute, secondValute, none
}

enum Contraints {
    case leading
    case trailing
}

class ConverterViewController: UIViewController {
    
    // MARK: - Properties
    
    var firstValute: Valute?
    var secondValute: Valute?
    private var condition: ChangeValuteButtonCondition = .none
    private lazy var converterView = ConverterView()

    
    override func loadView() {
        self.view = converterView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurateVew()
        updateUI()
    }
    
    // MARK: UI Configuration methods
    
    private func configurateVew() {
        converterView.chooseFirstValuteButton.addTarget(self, action: #selector(chooseValute), for: .touchUpInside)
        converterView.chooseSecondValuteButton.addTarget(self, action: #selector(chooseValute), for: .touchUpInside)
        converterView.switchValutes.addTarget(self, action: #selector(swichButtonTapped), for: .touchUpInside)
        converterView.firstValuteTF.delegate = self
        converterView.secondValuteTF.delegate = self
    }
//
    private func updateUI() {
        if let firstValute = firstValute {
            converterView.firstValuteLabel.text = firstValute.charCode
            converterView.firstValuteFlagImage.image = UIImage(named: firstValute.charCode!)
        }
        if let secondValute = secondValute {
            converterView.secondValuteLabel.text = secondValute.charCode
            converterView.secondValuteFlagImage.image = UIImage(named: secondValute.charCode!)
        }
    }
    
    // MARK: - Button actions
    
    @objc private func swichButtonTapped() {
        swap(&firstValute, &secondValute)
        swap(&converterView.firstValuteTF.text, &converterView.secondValuteTF.text)
        updateUI()
    }
    
    @objc private func chooseValute(sender: UIButton) {
        let valutesTableViewController = ValutesTableViewController()
        valutesTableViewController.delegate = self
        
        if sender.tag == 0 {
            condition = .fristValute
            print(1)
            valutesTableViewController.choosenValute = firstValute
        } else {
            condition = .secondValute
            print(2)
            valutesTableViewController.choosenValute = secondValute
        }
        navigationController?.pushViewController(valutesTableViewController, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

// MARK: - The delegate method witch catch data and make data flow

extension ConverterViewController: SelectValuteTypeDelegate {
    func selectValuteType(didSelect valuteType: Valute) {
        if condition == .fristValute {
            self.firstValute = valuteType
        } else {
            self.secondValute = valuteType
        }
        updateUI()
    }
}

// MARK: - UITextFieldDelegate

extension ConverterViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text,
                let firstValute = firstValute,
                let secondValute = secondValute else { return }

        if converterView.firstValuteTF == textField {
            converterView.secondValuteTF.text = String(format: "%.2f", DataManager.shared.calculateValueFromFirstToSecond(text: text, from: firstValute, to: secondValute))
        }
        if converterView.secondValuteTF == textField {
            converterView.firstValuteTF.text = String(format: "%.2f", DataManager.shared.calculateValueFromSecondToFirst(text: text, from: secondValute, to: firstValute))
        }
    }
    
}
