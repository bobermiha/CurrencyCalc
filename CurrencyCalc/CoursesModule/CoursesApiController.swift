//
//  CoursesApiController.swift
//  CurrencyCalc
//
//  Created by Михаил Бобров on 02.05.2022.
//

import Foundation
import Alamofire

class CoursesApiController {
    func getCurrencyCources(completion: @escaping (Swift.Result<[Valute], AFError>) -> Void) {
        AF.request(AppConstant.coursesUrl.rawValue, method: .get)
            .validate()
            .responseDecodable(of: ValuteDto.self) { response in
                switch response.result {
                case .success(let dto):
                    if let valutes = ValuteDto.makeValutes(from: dto.valute) {
                        completion(.success(valutes))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
