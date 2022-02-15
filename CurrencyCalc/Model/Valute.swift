//
//  Valute.swift
//  CurrencyCalc
//
//  Created by Михаил Бобров on 29.01.2022.
//

import Foundation

struct Valute: Codable, Equatable {
    let charCode: String?
    let nominal: Int?
    let name: String?
    let value: Double?
    let previous: Double?
    let id: String?
    
    var realValue: Double {
        guard let value = value else { return 1.0}
        switch nominal {
        case 1:
            return value / 1
        case 100:
            return value / 100
        case 10:
            return value / 10
        default: return value / 1
        }
    }
    
    
    
    var flagIcon: String {
        switch charCode {
        case "AUD": return "🇦🇺"
        case "AZN": return "🇦🇿"
        case "GBP": return "🇬🇧"
        case "AMD": return "🇦🇲"
        case "BYN": return "🇧🇾"
        case "BGN": return "🇧🇬"
        case "BRL": return "🇧🇷"
        case "HUF": return "🇭🇺"
        case "HKD": return "🇭🇰"
        case "DKK": return "🇩🇰"
        case "USD": return "🇺🇸"
        case "EUR": return "🇪🇺"
        case "INR": return "🇮🇳"
        case "KZT": return "🇰🇿"
        case "CAD": return "🇨🇦"
        case "KGS": return "🇰🇬"
        case "CNY": return "🇨🇳"
        case "MDL": return "🇲🇩"
        case "NOK": return "🇳🇴"
        case "PLN": return "🇵🇱"
        case "RON": return "🇷🇴"
        case "XDR": return "CДР"
        case "SGD": return "🇸🇬"
        case "TJS": return "🇹🇯"
        case "TRY": return "🇹🇷"
        case "TMT": return "🇹🇲"
        case "UZS": return "🇺🇿"
        case "UAH": return "🇺🇦"
        case "CZK": return "🇨🇿"
        case "SEK": return "🇸🇪"
        case "CHF": return "🇨🇭"
        case "ZAR": return "🇿🇦"
        case "KRW": return "🇰🇷"
        case "JPY": return "🇯🇵"
        case "RUB": return "🇷🇺"
        default: return ""
        }
    }
    
    static func ==(lhs: Valute, rhs: Valute) -> Bool {
        return lhs.id == rhs.id
    }
    
    enum CodingKeys: String, CodingKey {
        case charCode = "CharCode"
        case nominal = "Nominal"
        case name = "Name"
        case value = "Value"
        case id = "ID"
        case previous = "Previous"
    }
}
