//
//  NetworkManager.swift
//  CurrencyCalc
//
//  Created by Михаил Бобров on 29.01.2022.
//

import Foundation

class NetworkValuteManager {
    
    static func fetchValute(completion: @escaping (_ valutesJSON: [Valute]) -> Void) {
        let urlString = "https://www.cbr-xml-daily.ru/daily_json.js"
            guard let url = URL(string: urlString) else {return}
            let session = URLSession.shared
            let task = session.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let valutes = self.parseJSON(withData: data){
                        completion(valutes)
                    }
                    if let error = error {
                        print(error)
                    }
                }
            }
            task.resume()
        }
        
        static func parseJSON(withData data: Data) -> [Valute]? {
            var valutes = [Valute]()
            let decoder = JSONDecoder()
            
            do{
                let valuteData = try decoder.decode(ValuteData.self, from: data)
                let valute = valuteData.valute.values
                for v in valute {
                    if let valute = Valute(charCode: v.charCode, nominal: v.nominal, name: v.name, value: v.value) {
                        valutes.append(valute)
                    }
                }
                return valutes
            }catch let error as NSError {
                print(error.localizedDescription)
            }
            return nil
        }
}

