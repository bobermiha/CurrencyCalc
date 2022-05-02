//
//  ValuteDto.swift
//  CurrencyCalc
//
//  Created by Михаил Бобров on 29.01.2022.
//

import Foundation

struct ValuteDto: Codable {
    let valute: [String : Valute]?
    
    enum CodingKeys: String, CodingKey {
        case valute = "Valute"
    }
}

extension ValuteDto {
    static func makeValutes(from jsonDictionary: [String: Valute]?) -> [Valute]? {
        guard let jsonDictionary = jsonDictionary else {
            return nil
        }
        return jsonDictionary.map {$0.value}
    }
}
