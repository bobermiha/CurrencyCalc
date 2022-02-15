//
//  ValuteTableViewCell.swift
//  CurrencyCalc
//
//  Created by Михаил Бобров on 15.02.2022.
//

import UIKit

class ValuteTableViewCell: UITableViewCell {
    
    static let cellID = "ValuteCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
