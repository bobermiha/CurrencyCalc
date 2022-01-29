//
//  File.swift
//  CurrencyCalc
//
//  Created by Михаил Бобров on 29.01.2022.
//

import Foundation

struct ValuteData: Codable {
    let valute: [String : Valute]?
    
    enum CodingKeys: String, CodingKey {
        case valute = "Valute"
    }
}
