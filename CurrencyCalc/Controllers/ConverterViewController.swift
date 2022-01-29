//
//  ConverterViewController.swift
//  CurrencyCalc
//
//  Created by Михаил Бобров on 29.01.2022.
//

import UIKit
import SnapKit

class ConverterViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Проверка"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    private func setupView(){
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    
    

}
