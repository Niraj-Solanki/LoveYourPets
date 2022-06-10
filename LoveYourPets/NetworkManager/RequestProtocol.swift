//
//  RequestProtocol.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import Foundation

public typealias HTTPHeaders = [String: String]
public typealias Parameters = [String: Any]

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete  = "DELETE"
}

protocol APIRepository {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
    var encoding: RequestEncoder {get}
}
