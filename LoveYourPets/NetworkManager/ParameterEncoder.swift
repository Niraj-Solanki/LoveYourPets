//
//  ParameterEncoder.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import Foundation
protocol RequestEncoder {
    func encode(urlRequest: inout URLRequest , with parameters: Parameters) throws
}

struct URLParameterEncoder : RequestEncoder {
    public func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        
        guard let url = urlRequest.url else { throw LystError("Invalid Url")}
        
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false),
           !parameters.isEmpty {
            
            var queryItemsArr = [URLQueryItem]()
            
            // from each key-value pairs in params dictionary-> convert it into array of URLQueryItem
            for (parameterKey, parameterValue) in parameters {
                // Create query Item
                let queryItem = URLQueryItem(name: parameterKey, value: "\(parameterValue)")
                queryItemsArr.append(queryItem)
            }
            
            // Set query items
            urlComponents.queryItems = queryItemsArr
            urlRequest.url = urlComponents.url
        }
    }
}
