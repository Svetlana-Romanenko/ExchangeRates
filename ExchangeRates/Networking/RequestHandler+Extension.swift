//
//  RequestHandler+Extension.swift
//  ExchangeRates
//
//  Created by Светлана Романенко on 04.12.2021.
//

import Foundation

extension RequestHandler {
    
    func setQueryParams(parameters:[String: Any], url: URL) -> URL {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = parameters.map { element in
            URLQueryItem(name: element.key, value: String(describing: element.value) )
        }
        return components?.url ?? url
    }
    
    func setDefaultHeaders(request: inout URLRequest) {
        for (key, value) in Constants.headersDictionary {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    func setJSONBody(request: inout URLRequest) throws {
        let json = Constants.jsonBody
        let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
        request.httpBody = jsonData
    }
}
