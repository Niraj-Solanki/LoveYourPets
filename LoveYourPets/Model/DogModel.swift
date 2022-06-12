//
//  DogModel.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import Foundation

struct DogModel : Codable, Hashable, AnimalModel {

    let weight : Weight?
    let height : Height?
    let id : Int?
    let bred_for : String?
    let breed_group : String?
    let life_span : String?
    let temperament : String?
    let origin : String?
    let image : PetImage?
    
    //Override Properties
    var name : String?
    var imageRefId : String?
    
    //Custom Property
    var itemId: String? { return "\(String(describing: id))" }

    enum CodingKeys: String, CodingKey {
        case weight = "weight"
        case height = "height"
        case id = "id"
        case name = "name"
        case bred_for = "bred_for"
        case breed_group = "breed_group"
        case life_span = "life_span"
        case temperament = "temperament"
        case origin = "origin"
        case imageRefId = "reference_image_id"
        case image = "image"
    }
}


struct PetImage : Codable, Hashable {
    let id : String?
    let width : Int?
    let height : Int?
    let url : String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case width = "width"
        case height = "height"
        case url = "url"
    }
}


struct Height : Codable, Hashable {
    let imperial : String?
    let metric : String?

    enum CodingKeys: String, CodingKey {
        case imperial = "imperial"
        case metric = "metric"
    }
}


struct Weight : Codable, Hashable {
    let imperial : String?
    let metric : String?

    enum CodingKeys: String, CodingKey {
        case imperial = "imperial"
        case metric = "metric"
    }
}
