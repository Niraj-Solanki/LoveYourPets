//
//  DogRepositoryMock.swift
//  LoveYourPetsTests
//
//  Created by Niraj Solanki on 12/06/22.
//

import UIKit

struct DogRepositoryMock: AnimalRepository {
    func fetchBreed<T>(by name: String, completion: @escaping ((Result<[T], LystError>) -> Void)) where T : Decodable, T : Encodable {
        
        guard let jsonData = Stubs.dogBreedBy.data(using: .utf8) else { return }
        
        do {
            let jsonDecoder = JSONDecoder()
            let responseModel = try jsonDecoder.decode([T].self, from: jsonData)
            
            guaranteeMainThreed {
                completion(Result.success(responseModel))
            }
            
        }
        catch {
            completion(Result.failure(LystError("Decoding failed")))
        }
    }
    
    func fetchBreed<T>(page: Int, completion: @escaping ((Result<[T], LystError>) -> Void)) where T : Decodable, T : Encodable {
        
        guard let jsonData = Stubs.dogBreeds.data(using: .utf8) else { return }
        
        do {
            let jsonDecoder = JSONDecoder()
            let responseModel = try jsonDecoder.decode([T].self, from: jsonData)
            
            guaranteeMainThreed {
                completion(Result.success(responseModel))
            }
            
        }
        catch {
            completion(Result.failure(LystError("Decoding failed")))
        }
    }
}
