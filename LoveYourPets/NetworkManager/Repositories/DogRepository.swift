//
//  DogRepository.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import Foundation

struct DogRepository: AnimalRepository {
    private let networkManager = NetworkManagerImpl()
    
    func fetchBreed<T>(by name: String, completion: @escaping ((Result<[T], LystError>) -> Void)) where T : Decodable, T : Encodable {
        let breedSearch = DogEndPoint.search(breed: name)
        
        networkManager.request(endPoint: breedSearch) {
            (result: Result<[T], LystError>) in
            completion(result)
        }
    }
    
    func fetchBreed<T>(page: Int, completion: @escaping ((Result<[T], LystError>) -> Void)) where T : Decodable, T : Encodable {
        let breeds = DogEndPoint.breeds(page: page)
        
        networkManager.request(endPoint: breeds) { (result: Result<[T], LystError>) in
            completion(result)
        }
    }
}
