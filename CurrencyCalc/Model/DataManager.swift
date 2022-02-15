//
//  DataManager.swift
//  CurrencyCalc
//
//  Created by Михаил Бобров on 31.01.2022.
//

import Foundation
class DataManager {
    
    static let shared = DataManager()!
    
    private init?() {}
    
    let rubble = Valute(charCode: "RUB", nominal: 1, name: "Российский рубль", value: 1, previous: 1, id: "01")
    
    // MARK: Math methods
    
    func calculateValueFromFirstToSecond(text: String, from firstValute: Valute, to secondValute: Valute) -> Double {
        var currentCourse: Double = 0
        if let value = Double(text) {
            currentCourse = value * (firstValute.realValue / secondValute.realValue)
        }
        return currentCourse
    }
    
    func calculateValueFromSecondToFirst(text: String, from secondValute: Valute, to firstValute: Valute) -> Double {
        var currentCourse: Double = 0
        if let value = Double(text) {
            currentCourse = value * (secondValute.realValue / firstValute.realValue)
        }
        return currentCourse
    }
    
    //Продумать функцию по проверки нового значения и старого
    
}
