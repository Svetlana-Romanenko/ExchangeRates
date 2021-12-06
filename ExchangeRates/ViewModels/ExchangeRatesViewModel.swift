//
//  ExchangeRatesViewModel.swift
//  ExchangeRates
//
//  Created by Светлана Романенко on 05.12.2021.
//

import Foundation

struct ExchangeRatesViewModel {
    func getAPIData(param: [String: Any], completion: @escaping (ExchangeRatesModel?, ServiceError?) -> ()) {
        let request = ExchangeRatesAPI()
        
        let apiLoader = APILoader(apiHandler: request)
        apiLoader.loadAPIRequest(requestData: param) { (model, error) in
            if let _ = error {
                completion(nil, error)
            } else {
                completion(model, nil)
            }
        }
    }
}
