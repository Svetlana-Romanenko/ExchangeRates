//
//  ResponseHandler+Extension.swift
//  ExchangeRates
//
//  Created by Светлана Романенко on 05.12.2021.
//

import Foundation

struct ServiceError: Error,Codable {
    let httpStatus: Int
    let message: String
}

extension ResponseHandler {
    func fillInTheModel(data: Data, response: HTTPURLResponse) throws -> ExchangeRatesModel {
        var downloadData: String? = ""
        var messageTitle: String? = ""
        var productState: Int? = 0
        var message: String? = ""
        var rid: String? = ""
        var ratesDate: String? = ""
        var code: Int? = 0
        var rates: [Rate] = []
    
        do {
            let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
            let ratesResult = result?.filter { dictionary in
                dictionary.key == ExchangeRatesModel.CodingKeys.rates.stringValue
            }
            if let ratesArray = ratesResult?.first?.value as? NSArray {
                for elements in ratesArray {
                    if let element = elements as? [String: AnyObject] {
                        let name = element[Rate.CodingKeys.name.stringValue]
                        let basic = element[Rate.CodingKeys.basic.stringValue]
                        let buy = element[Rate.CodingKeys.buy.stringValue]
                        let currMnemFrom = element[Rate.CodingKeys.currMnemFrom.stringValue]
                        let currMnemTo = element[Rate.CodingKeys.currMnemTo.stringValue]
                        let deltaBuy = element[Rate.CodingKeys.deltaBuy.stringValue]
                        let deltaSale = element[Rate.CodingKeys.deltaSale.stringValue]
                        let from = element[Rate.CodingKeys.from.stringValue]
                        let sale = element[Rate.CodingKeys.sale.stringValue]
                        let to = element[Rate.CodingKeys.to.stringValue]
                        let tp = element[Rate.CodingKeys.tp.stringValue]
                        
                        let rate = Rate(basic: basic as? Int,
                                        buy: buy as? String,
                                        currMnemFrom: currMnemFrom as? String,
                                        currMnemTo: currMnemTo as? String,
                                        deltaBuy: deltaBuy as? String,
                                        deltaSale: deltaSale as? String,
                                        from: from as? Int,
                                        name: name as? String,
                                        sale: sale as? String,
                                        to: to as? Int,
                                        tp: tp as? Int)
                        
                        rates.append(rate)
                    }
                }
            }
            
            downloadData = result?[ExchangeRatesModel.CodingKeys.downloadDate.stringValue] as? String
            messageTitle = result?[ExchangeRatesModel.CodingKeys.messageTitle.stringValue] as? String
            productState = result?[ExchangeRatesModel.CodingKeys.productState.stringValue] as? Int
            message = result?[ExchangeRatesModel.CodingKeys.message.stringValue] as? String
            rid = result?[ExchangeRatesModel.CodingKeys.rid.stringValue] as? String
            ratesDate = result?[ExchangeRatesModel.CodingKeys.ratesDate.stringValue] as? String
            code = result?[ExchangeRatesModel.CodingKeys.code.stringValue] as? Int
            
            return ExchangeRatesModel(downloadDate: downloadData,
                                      messageTitle: messageTitle,
                                      productState: productState,
                                      message: message,
                                      rid: rid,
                                      ratesDate: ratesDate,
                                      code: code,
                                      rates: rates)
        } catch {
            throw ServiceError(httpStatus: response.statusCode, message: error.localizedDescription)
        }
    }
}
