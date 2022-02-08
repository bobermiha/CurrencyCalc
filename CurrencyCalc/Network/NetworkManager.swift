//
//  NetworkManager.swift
//  CurrencyCalc
//
//  Created by Михаил Бобров on 29.01.2022.
//

import Foundation

class NetworkManager {
    
    static func fetchValute(completion: @escaping (_ valutesJSON: [Valute]) -> Void) {
        let urlString = AppConstant.url.rawValue
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
                let jsonData = try decoder.decode(ValuteData.self, from: data)
                if let jsonItems = jsonData.valute {
                    for item in jsonItems {
                        let valute = item.value
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

