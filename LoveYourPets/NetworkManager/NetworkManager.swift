//
//  NetworkManager.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import Foundation

protocol NetworkManager {
    func request<T: Codable>(repository: APIRepository, completion: ((Result<T, LystError>) -> Void)?)
}

class NetworkManagerImpl : NetworkManager {
    func request<T: Codable>(repository: APIRepository, completion: ((Result<T, LystError>) -> Void)?) {
        
        var urlRequest = URLRequest(url: repository.baseURL.appendingPathComponent(repository.path),
                                    cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                    timeoutInterval: Constants.timeout)
        urlRequest.httpMethod = repository.httpMethod.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do{
            try repository.encoding.encode(urlRequest: &urlRequest, with: repository.parameters ?? Parameters())
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
                    completion?(Result.success(responseModel))
                }
                catch {
                    completion?(Result.failure(LystError("Decoding failed")))
                }
            }
        }.resume()
    }
}
