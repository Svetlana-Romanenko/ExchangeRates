//
//  Constants.swift
//  ExchangeRates
//
//  Created by Светлана Романенко on 04.12.2021.
//

import Foundation

struct Constants {
    static let urlString = "https://alpha.as50464.net:29870/moby-pre-44/core?r=BEYkZbmV&d=563B4852-6D4B-49D6-A86E-B273DD520FD2&t=ExchangeRates&v=44"
    
    static let headersDictionary = ["User-Agent": "Test GeekBrains iOS 3.0.0.182 (iPhone 11; iOS 14.4.1; Scale/2.00; Private)",
                                    "Content-Type": "application/json",
                                    "Accept": "application/json"]
    
    static let jsonBody = ["uid": "563B4852-6D4B-49D6-A86E-B273DD520FD2",
                           "type": "ExchangeRates",
                           "rid": "BEYkZbmV"]
}
