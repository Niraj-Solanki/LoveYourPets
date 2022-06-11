//
//  DogEndPoint.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import Foundation

enum DogEndPoint {
    case breeds(page: Int)
    case search(breed: String)
}

extension DogEndPoint: EndPoint {
    
    struct AnimalKeys {
        static let ApiKey = "x-api-key"
        static let page = "page"
        static let limit = "limit"
        static let search = "q"
    }
    
    //Set Base URL
    var baseURL: URL {
        guard let url = URL(string: Constants.Dog.baseURL) else {
            fatalError("BaseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .breeds(_):
            return "breeds"
        case .search(_):
            return "breeds/search"
        }
    }
    
    var parameters: Parameters? {
        var params: Parameters = [:]
        
        switch self {
        case .breeds(let page):
            params[AnimalKeys.page] = page
            params[AnimalKeys.limit] = Constants.Dog.limit
        case .search(let search):
            params[AnimalKeys.search] = search
        }
        
        return params
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    //Return APIs Specific Headers
    var headers: HTTPHeaders? {
        var header: HTTPHeaders = [:]
        
        switch self {
        case .breeds(_):
            print("")
        case .search(_):
            header[AnimalKeys.ApiKey] = Constants.Dog.ApiKey
        }
        return header
    }
    
    //Encode and Returns Encoded Data
    var encoding: RequestEncoder {
        return URLParameterEncoder()
    }
}
