//
//  AnimalRepository.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import Foundation

protocol AnimalRepository {
    func fetchBreed<T: Codable>(by name: String, completion: @escaping((Result<[T], LystError>) -> Void))
    func fetchBreed<T: Codable>(page: Int, completion: @escaping((Result<[T], LystError>) -> Void))
}
