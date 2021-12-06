//
//  ExchangeRatesModel.swift
//  ExchangeRates
//
//  Created by Светлана Романенко on 04.12.2021.
//

import Foundation

struct ExchangeRatesModel: Codable {
    let downloadDate: String?
    let messageTitle: String?
    let productState: Int?
    let message: String?
    let rid: String?
    let ratesDate: String?
    let code: Int?
    let rates: [Rate]?
    
    enum CodingKeys: CodingKey {
        case downloadDate
        case messageTitle
        case productState
        case message
        case rid
        case ratesDate
        case rates
        case code
    }
}

struct Rate: Codable {
    let basic: Int?
    let buy: String?
    let currMnemFrom: String?
    let currMnemTo: String?
    let deltaBuy: String?
    let deltaSale: String?
    let from: Int?
    let name: String?
    let sale: String?
    let to: Int?
    let tp: Int?
    
    enum CodingKeys: CodingKey {
        case basic
        case buy
        case currMnemFrom
        case currMnemTo
        case deltaBuy
        case deltaSale
        case from
        case name
        case sale
        case to
        case tp
    }
}
