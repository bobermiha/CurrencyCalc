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
    
    // MARK: UI Elements
    private let frameSize:CGFloat = 45.0
    
    private lazy var backgroudImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "exchange")
        return imageView
    }()
    
    private lazy var firstValuteTF: UITextField = {
        let textField = UITextField()
        return configurateTextField(config: textField)
    }()
    
    private lazy var secondValuteTF: UITextField = {
        let textField = UITextField()
        return configurateTextField(config: textField)
    }()
    
    private lazy var chooseFirstValuteButton: UIButton = {
        let button = UIButton()
        button.tag = 0
        return configurateChooseButtons(config: button)
    }()
    
    private lazy var chooseSecondValuteButton: UIButton = {
        let button = UIButton()
        button.tag = 1
        return configurateChooseButtons(config: button)
    }()
    
    private lazy var switchValutes: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "exchange-2"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor.mainColor
        button.addTarget(self, action: #selector(swichButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var firstValuteFlagImage: UIImageView = {
        let imageView = UIImageView()
        return configurateFlagImageView(config: imageView)
    }()
    
    private lazy var secondValuteFlagImage: UIImageView = {
        let imageView = UIImageView()
        return configurateFlagImageView(config: imageView)
    }()
    
    private lazy var firstValuteLabel: UILabel = {
        let label = UILabel()
        return configurateLabel(config: label)
    }()
    
    private lazy var secondValuteLabel: UILabel = {
        let label = UILabel()
        return configurateLabel(config: label)
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        firstValuteFlagImage.layer.cornerRadius = frameSize / 2.0
        secondValuteFlagImage.layer.cornerRadius = frameSize / 2.0
        switchValutes.layer.cornerRadius = frameSize / 2.0
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpBackgroundImageView()
        setUpTextField(textField: firstValuteTF, imageView: backgroudImageView, constraint: .leading)
        setUpTextField(textField: secondValuteTF, imageView: backgroudImageView, constraint: .trailing)
        setUpFlagImageView(flagImageView: firstValuteFlagImage, textField: firstValuteTF)
        setUpFlagImageView(flagImageView: secondValuteFlagImage, textField: secondValuteTF)
        setUpValuteLabel(label: firstValuteLabel, flagImageView: firstValuteFlagImage)
        setUpValuteLabel(label: secondValuteLabel, flagImageView: secondValuteFlagImage)
        setUpChooseButton(button: chooseFirstValuteButton, textField: firstValuteTF, flagImageView: firstValuteFlagImage)
        setUpChooseButton(button: chooseSecondValuteButton, textField: secondValuteTF, flagImageView: secondValuteFlagImage)
        setUpSwitchValutesButton()
    }
    
    // MARK: UI Configuration methods
    
    private func updateUI() {
        if let firstValute = firstValute {
            firstValuteLabel.text = firstValute.charCode
            firstValuteFlagImage.image = UIImage(named: firstValute.charCode!)
        }
        if let secondValute = secondValute {
            secondValuteLabel.text = secondValute.charCode
            secondValuteFlagImage.image = UIImage(named: secondValute.charCode!)
        }
    }
    
    private func configurateTextField(config textField: UITextField) -> UITextField {
        textField.borderStyle = .none
        textField.delegate = self
        textField.layer.cornerRadius = 7.5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.mainColor.cgColor
        textField.placeholder = "Введите значение"
        textField.font = UIFont(name: "Apple SD Ghotic Neo", size: 15)
        textField.textAlignment = .right
        return textField
    }
    
    private func configurateChooseButtons(config button: UIButton) -> UIButton {
        button.backgroundColor = UIColor.mainColor
        button.tintColor = .white
        button.setTitle("Выберите валюту", for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(chooseValute), for: .touchUpInside)
        return button
    }
    
    private func configurateFlagImageView(config imageView: UIImageView) -> UIImageView {
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 1.5
        imageView.tintColor = .black
        imageView.layer.borderColor = UIColor.mainColor.cgColor
        imageView.clipsToBounds = true
        return imageView
    }
    
    private func configurateLabel(config label:UILabel) -> UILabel {
        label.text = "???"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }
    
    private func setUpBackgroundImageView() {
        view.addSubview(backgroudImageView)
        backgroudImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.width.equalTo(150)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(35)
        }
    }
    
    private func setUpTextField(textField: UITextField, imageView: UIImageView, constraint: Contraints) {
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            switch constraint {
            case .trailing:
                make.trailing.equalToSuperview().inset(20)
            case .leading:
                make.leading.equalToSuperview().inset(20)
            }
            make.top.equalTo(imageView.snp.bottom).inset(-80)
            make.width.equalTo(160)
            make.height.equalTo(40)
        }
    }
    
    private func setUpFlagImageView(flagImageView: UIImageView, textField: UITextField) {
        view.addSubview(flagImageView)
        flagImageView.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).inset(-20)
            make.left.equalTo(textField.snp.left)
            make.height.width.equalTo(frameSize)
        }
    }
    
    private func setUpValuteLabel(label: UILabel, flagImageView: UIImageView) {
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(flagImageView)
            make.left.equalTo(flagImageView.snp.right).inset(-25)
            make.height.equalTo(frameSize)
            make.width.equalTo(75)
        }
    }
    
    private func setUpChooseButton(button: UIButton, textField: UITextField, flagImageView: UIImageView){
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.width.equalTo(textField)
            make.height.equalTo(frameSize)
            make.top.equalTo(flagImageView.snp.bottom).inset(-20)
            make.left.equalTo(textField)
        }
    }
    
    private func setUpSwitchValutesButton(){
        view.addSubview(switchValutes)
        switchValutes.snp.makeConstraints { make in
            make.height.equalTo(frameSize)
            make.width.equalTo(frameSize)
            make.centerX.equalToSuperview()
            make.top.equalTo(chooseFirstValuteButton.snp.bottom).inset(-15)
        }
    }
    
    // MARK: - Button actions
    
    @objc private func swichButtonTapped() {
        swap(&firstValute, &secondValute)
        swap(&firstValuteTF.text, &secondValuteTF.text)
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
        
        if firstValuteTF == textField {
            secondValuteTF.text = String(format: "%.2f", DataManager.shared.calculateValueFromFirstToSecond(text: text, from: firstValute, to: secondValute))
        }
        if secondValuteTF == textField {
            firstValuteTF.text = String(format: "%.2f", DataManager.shared.calculateValueFromSecondToFirst(text: text, from: secondValute, to: firstValute))
        }
    }
    
}
