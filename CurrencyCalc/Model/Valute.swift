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
    }
    
//    init?(json: [String: Any]) {
//        
//        let charCode = json[CodingKeys.charCode.rawValue] as? String
//        let nominal = json[CodingKeys.nominal.rawValue] as? Int
//        let name = json[CodingKeys.name.rawValue] as? String
//        let value = json[CodingKeys.value.rawValue] as? Double
//        let id = json[CodingKeys.id.rawValue] as? String
//        
//        self.id = id
//        self.nominal = nominal
//        self.charCode = charCode
//        self.name = name
//        self.value = value
//    }
//    
//    init?(charCode: String, nominal: Int, name: String, value: Double, id: String){
//        self.charCode = charCode
//        self.nominal = nominal
//        self.name = name
//        self.value = value
//        self.id = id
//    }
//    
//    static func getDictionary(from jsonDict: Any) -> [Valute]? {
//        var valutes = [Valute]()
//        guard let jsonDict = jsonDict as? Dictionary<String, Dictionary<String, Any>> else {return nil}
//        let valuteJson = jsonDict.values
//        for value in valuteJson {
//            if let valute = Valute(json: value) {
//                valutes.append(valute)
//            }
//        }
//        return valutes
//    }
    
}
