//
//  APIHandler.swift
//  ExchangeRates
//
//  Created by Светлана Романенко on 04.12.2021.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol RequestHandler {
    associatedtype RequestDataType
    func makeRequest(from data:RequestDataType) -> URLRequest?
}

protocol ResponseHandler {
    func fillModel(with data: Data, response: HTTPURLResponse) throws -> ExchangeRatesModel
}

typealias APIHandler = RequestHandler & ResponseHandler
