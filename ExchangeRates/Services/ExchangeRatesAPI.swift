//
//  ExchangeRatesAPI.swift
//  ExchangeRates
//
//  Created by Светлана Романенко on 04.12.2021.
//

import Foundation

struct ExchangeRatesAPI: APIHandler {
    
    func makeRequest(from param: [String: Any]) -> URLRequest? {
        if var url = URL(string: Constants.urlString) {
            if param.count > 0 {
                url = setQueryParams(parameters: param, url: url)
            }
            var urlRequest = URLRequest(url: url)
            setDefaultHeaders(request: &urlRequest)
            
            try? setJSONBody(request: &urlRequest)
            
            urlRequest.httpMethod = HTTPMethod.post.rawValue
            return urlRequest
        }
        return nil
    }
    
    func fillModel(with data: Data, response: HTTPURLResponse) throws -> ExchangeRatesModel {
        return try fillInTheModel(data: data, response: response)
    }
}
