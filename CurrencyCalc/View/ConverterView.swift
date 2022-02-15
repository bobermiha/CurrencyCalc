//
//  ConverterView.swift
//  CurrencyCalc
//
//  Created by Михаил Бобров on 15.02.2022.
//

import UIKit

class ConverterView: UIView {
    
    private let frameSize:CGFloat = 45.0
    
    private lazy var backgroudImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "exchange")
        return imageView
    }()
    
    lazy var firstValuteTF: UITextField = {
        let textField = UITextField()
        return configurateTextField(config: textField)
    }()
    
    lazy var secondValuteTF: UITextField = {
        let textField = UITextField()
        return configurateTextField(config: textField)
    }()
    
    lazy var chooseFirstValuteButton: UIButton = {
        let button = UIButton()
        button.tag = 0
        return configurateChooseButtons(config: button)
    }()
    
    lazy var chooseSecondValuteButton: UIButton = {
        let button = UIButton()
        button.tag = 1
        return configurateChooseButtons(config: button)
    }()
    
    lazy var switchValutes: UIButton = {
        let button = UIButton()
        button.setTitle("⇄", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 35)
        button.tintColor = .white
        button.layer.cornerRadius = frameSize / 2
        button.backgroundColor = mainColor
        return button
    }()
    
    lazy var firstValuteFlagImage: UIImageView = {
        let imageView = UIImageView()
        return configurateFlagImageView(config: imageView)
    }()
    
    lazy var secondValuteFlagImage: UIImageView = {
        let imageView = UIImageView()
        return configurateFlagImageView(config: imageView)
    }()
    
    lazy var firstValuteLabel: UILabel = {
        let label = UILabel()
        return configurateLabel(config: label)
    }()
    
    lazy var secondValuteLabel: UILabel = {
        let label = UILabel()
        return configurateLabel(config: label)
    }()
    
     func viewDidLayoutSubviews() {
        firstValuteFlagImage.layer.cornerRadius = frameSize / 2.0
        secondValuteFlagImage.layer.cornerRadius = frameSize / 2.0
        switchValutes.layer.cornerRadius = frameSize / 2.0
        
    }
    
    // MARK: UI Configuration methods
    private func configurateTextField(config textField: UITextField) -> UITextField {
        textField.borderStyle = .none
        textField.keyboardType = .decimalPad
        textField.layer.cornerRadius = 7.5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = mainColor.cgColor
        textField.placeholder = "Введите значение"
        textField.font = UIFont(name: "Apple SD Ghotic Neo", size: 15)
        textField.textAlignment = .center
        return textField
    }
    
    private func configurateChooseButtons(config button: UIButton) -> UIButton {
        button.backgroundColor = mainColor
        button.tintColor = .white
        button.setTitle("Выберите валюту", for: .normal)
        button.layer.cornerRadius = 15
        return button
    }
    
    private func configurateFlagImageView(config imageView: UIImageView) -> UIImageView {
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 1.5
        imageView.tintColor = .black
        imageView.layer.borderColor = mainColor.cgColor
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
        self.addSubview(backgroudImageView)
        backgroudImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.width.equalTo(150)
            make.top.equalTo(self.safeAreaLayoutGuide).inset(35)
        }
    }
    
    private func setUpTextField(textField: UITextField, imageView: UIImageView, constraint: Contraints) {
        self.addSubview(textField)
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
        self.addSubview(flagImageView)
        flagImageView.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).inset(-20)
            make.left.equalTo(textField.snp.left)
            make.height.width.equalTo(frameSize)
        }
    }
    
    private func setUpValuteLabel(label: UILabel, flagImageView: UIImageView) {
        self.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(flagImageView)
            make.left.equalTo(flagImageView.snp.right).inset(-25)
            make.height.equalTo(frameSize)
            make.width.equalTo(80)
        }
    }
    
    private func setUpChooseButton(button: UIButton, textField: UITextField, flagImageView: UIImageView){
        self.addSubview(button)
        button.snp.makeConstraints { make in
            make.width.equalTo(textField)
            make.height.equalTo(frameSize)
            make.top.equalTo(flagImageView.snp.bottom).inset(-20)
            make.left.equalTo(textField)
        }
    }
    
    private func setUpSwitchValutesButton(){
        self.addSubview(switchValutes)
        switchValutes.snp.makeConstraints { make in
            make.height.equalTo(frameSize)
            make.width.equalTo(frameSize)
            make.centerX.equalToSuperview()
            make.top.equalTo(chooseFirstValuteButton.snp.bottom).inset(-15)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        firstValuteFlagImage.layer.cornerRadius = frameSize / 2
        secondValuteFlagImage.layer.cornerRadius = frameSize / 2
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
