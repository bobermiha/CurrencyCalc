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
        return textField
    }()
    
    private var secondFaluteTF: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    private var backgroudImageView: UIImageView = {
        let imageView = UIImageView()
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    
    // MARK: UI Configuration methods
    
    
    

}
