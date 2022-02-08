//
//  ConverterViewController.swift
//  CurrencyCalc
//
//  Created by Михаил Бобров on 29.01.2022.
//

import UIKit
import SnapKit

class ConverterViewController: UIViewController {
    
    // MARK: UI Elements
    
    private var firstValuteTF: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.layer.cornerRadius = 7.5
        textField.layer.borderWidth = 2.0
        textField.clipsToBounds = true
        textField.layer.borderColor = UIColor(red: 184/255, green: 92/255, blue: 56/255, alpha: 1.0).cgColor
        textField.textAlignment = .center
        textField.placeholder = "Введите значение "
        textField.font = UIFont(name: "Rockwell", size: 15)
        return textField
    }()
    
    private var secondValuteTF: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .right
        textField.borderStyle = .line
        textField.placeholder = "Введите значение"
        textField.font = UIFont(name: "Rockwell", size: 15)
        return textField
    }()
    
    private var backgroudImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "exchange")
        return imageView
    }()
    
    private var chooseFirstValuteButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private var chooseSecondValuteButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private var firstValuteFlagImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var secondValuteFlagImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var firstValuteLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private var secondValuteLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpBackgroundImageView()
        setUpFirstTextField()
        setUpSecondTextField()
    }
    
    
    // MARK: UI Configuration methods
    
    private func setUpBackgroundImageView() {
        view.addSubview(backgroudImageView)
        backgroudImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalTo(150)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(35)
        }
    }
    
    private func setUpFirstTextField() {
        view.addSubview(firstValuteTF)
        firstValuteTF.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(25)
            make.top.equalTo(backgroudImageView.snp.bottom).inset(-80)
            make.width.equalTo(180)
            make.height.equalTo(40)
            
        }
    }
    
    private func setUpSecondTextField() {
        view.addSubview(secondValuteTF)
        secondValuteTF.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(25)
            make.top.equalTo(backgroudImageView.snp.bottom).inset(-80)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
    }
    
}
