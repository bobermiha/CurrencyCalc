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
    private let frameSize:CGFloat = 45.0

    
    private var firstValuteTF: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.layer.cornerRadius = 7.5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 255/255, green: 169/255, blue: 49/255, alpha: 1.0).cgColor
        textField.placeholder = "Введите значение"
        textField.font = UIFont(name: "Apple SD Ghotic Neo", size: 15)
        textField.textAlignment = .right
        return textField
    }()
    
    private var secondValuteTF: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.layer.cornerRadius = 7.5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 255/255, green: 169/255, blue: 49/255, alpha: 1.0).cgColor
        textField.textAlignment = .right
        textField.placeholder = "Введите значение"
        textField.font = UIFont(name: "Apple SD Ghotic Neo", size: 15)
        return textField
    }()
    
    private var backgroudImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "exchange")
        return imageView
    }()
    
    private var chooseFirstValuteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 169/255, blue: 49/255, alpha: 1.0)
        button.tintColor = .white
        button.setTitle("Выберите валюту", for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private var chooseSecondValuteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 169/255, blue: 49/255, alpha: 1.0)
        button.tintColor = .white
        button.setTitle("Выберите валюту", for: .normal)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private var firstValuteFlagImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "1")
        imageView.layer.borderWidth = 1.5
        imageView.layer.borderColor = UIColor(red: 255/255, green: 169/255, blue: 49/255, alpha: 1.0).cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var secondValuteFlagImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor(red: 255/255, green: 169/255, blue: 49/255, alpha: 1.0).cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var firstValuteLabel: UILabel = {
        let label = UILabel()
        label.text = "RUB"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    private var secondValuteLabel: UILabel = {
        let label = UILabel()
        label.text = "RUB"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        firstValuteFlagImage.layer.cornerRadius = frameSize / 2.0
        secondValuteFlagImage.layer.cornerRadius = frameSize / 2.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        firstValuteFlagImage.layer.cornerRadius = firstValuteFlagImage.frame.height / 2
        setUpBackgroundImageView()
        setUpFirstTextField()
        setUpSecondTextField()
        setUpFirstFlagImage()
        setUpSecondFlagImage()
        setUpFirstLabel()
        setUpSecondLabel()
        setUpFirstButton()
        setUpSecondButton()
    }
    
    
    // MARK: UI Configuration methods
    
    private func setUpBackgroundImageView() {
        view.addSubview(backgroudImageView)
        backgroudImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.width.equalTo(150)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(35)
        }
    }
    
    private func setUpFirstTextField() {
        view.addSubview(firstValuteTF)
        firstValuteTF.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(25)
            make.top.equalTo(backgroudImageView.snp.bottom).inset(-80)
            make.width.equalTo(160)
            make.height.equalTo(40)
        }
    }
    
    private func setUpSecondTextField() {
        view.addSubview(secondValuteTF)
        secondValuteTF.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(25)
            make.top.equalTo(backgroudImageView.snp.bottom).inset(-80)
            make.width.equalTo(160)
            make.height.equalTo(40)
        }
    }
    
    private func setUpFirstFlagImage() {
        view.addSubview(firstValuteFlagImage)
        firstValuteFlagImage.snp.makeConstraints { make in
            make.top.equalTo(firstValuteTF.snp.bottom).inset(-20)
            make.left.equalTo(firstValuteTF.snp.left)
            make.height.width.equalTo(frameSize)
        }
    }
    
    private func setUpSecondFlagImage() {
        view.addSubview(secondValuteFlagImage)
        secondValuteFlagImage.snp.makeConstraints { make in
            make.top.equalTo(secondValuteTF.snp.bottom).inset(-20)
            make.left.equalTo(secondValuteTF.snp.left)
            make.height.width.equalTo(frameSize)
        }
    }
    
    private func setUpFirstLabel() {
        view.addSubview(firstValuteLabel)
        firstValuteLabel.snp.makeConstraints { make in
            make.top.equalTo(firstValuteFlagImage)
            make.left.equalTo(firstValuteFlagImage.snp.right).inset(-25)
            make.height.equalTo(frameSize)
            make.width.equalTo(70)
        }
    }
    
    private func setUpSecondLabel() {
        view.addSubview(secondValuteLabel)
        secondValuteLabel.snp.makeConstraints { make in
            make.top.equalTo(secondValuteFlagImage)
            make.left.equalTo(secondValuteFlagImage.snp.right).inset(-25)
            make.height.equalTo(frameSize)
            make.width.equalTo(70)
        }
    }
    
    private func setUpFirstButton() {
        view.addSubview(chooseFirstValuteButton)
        chooseFirstValuteButton.snp.makeConstraints { make in
            make.width.equalTo(firstValuteTF)
            make.height.equalTo(frameSize)
            make.top.equalTo(firstValuteFlagImage.snp.bottom).inset(-20)
            make.left.equalTo(firstValuteTF)
        }
    }
    
    private func setUpSecondButton() {
        view.addSubview(chooseSecondValuteButton)
        chooseSecondValuteButton.snp.makeConstraints { make in
            make.width.equalTo(secondValuteTF)
            make.height.equalTo(frameSize)
            make.top.equalTo(secondValuteFlagImage.snp.bottom).inset(-20)
            make.left.equalTo(secondValuteTF)
        }
    }
    
    
}
