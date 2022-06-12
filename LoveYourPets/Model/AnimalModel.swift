//
//  AnimalModel.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import Foundation
protocol AnimalModel : Codable, Hashable {
    var itemId: String? { get }
    var name: String? { get set }
    var imageRefId : String? { get set }
}

enum AnimalType {
    case dog
    case cat
    
    var searchPromp: String {
        switch self {
        case .dog:
            return "Bhow Bhow (decoded: find me 🐾)"
        case .cat:
            return "Meaw Meaw (decoded: find me 🐾)"
        }
    }
    
    var title: String {
        switch self {
        case .dog:
            return "Find Your Dog 🐶"
        case .cat:
            return "Find Your Cat 🐱"
        }
    }
}
