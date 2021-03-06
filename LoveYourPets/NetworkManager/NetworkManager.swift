//
//  NetworkManager.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import Foundation

protocol NetworkManager {
    func request<T: Codable>(endPoint: EndPoint, completion: ((Result<T, LystError>) -> Void)?)
}

class NetworkManagerImpl : NetworkManager {
    func request<T: Codable>(endPoint: EndPoint, completion: ((Result<T, LystError>) -> Void)?) {
        
        var urlRequest = URLRequest(url: endPoint.baseURL.appendingPathComponent(endPoint.path),
                                    cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                    timeoutInterval: Constants.timeout)
        urlRequest.httpMethod = endPoint.httpMethod.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do{
            try endPoint.encoding.encode(urlRequest: &urlRequest, with: endPoint.parameters ?? Parameters())
        }
        catch{
            completion?(Result.failure(LystError("Encoding failed")))
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.global().async {
                
                guard error == nil else {
                    completion?(Result.failure(LystError(error?.localizedDescription ?? "")))
                    return
                }
                
                guard let jsonData = data else { return }
                
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(T.self, from: jsonData)
                    
                    guaranteeMainThreed {
                        completion?(Result.success(responseModel))
                    }
                }
                catch {
                    completion?(Result.failure(LystError("Decoding failed")))
                }
            }
        }.resume()
    }
}

func guaranteeMainThreed(_ work : @escaping() -> Void) {
     if Thread.isMainThread {
         work()
     }
     else {
         DispatchQueue.main.async(execute: work)
     }
 }
