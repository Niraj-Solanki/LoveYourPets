//
//  DogModel.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import Foundation

struct DogModel : Codable, Hashable, AnimalModel {

    var itemId: String?
    let weight : Weight?
    let height : Height?
    let id : Int?
    var name : String?
    let bred_for : String?
    let breed_group : String?
    let life_span : String?
    let temperament : String?
    let origin : String?
    var imageRefId : String?
    let image : PetImage?

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

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        weight = try values.decodeIfPresent(Weight.self, forKey: .weight)
        height = try values.decodeIfPresent(Height.self, forKey: .height)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        bred_for = try values.decodeIfPresent(String.self, forKey: .bred_for)
        breed_group = try values.decodeIfPresent(String.self, forKey: .breed_group)
        life_span = try values.decodeIfPresent(String.self, forKey: .life_span)
        temperament = try values.decodeIfPresent(String.self, forKey: .temperament)
        origin = try values.decodeIfPresent(String.self, forKey: .origin)
        imageRefId = try values.decodeIfPresent(String.self, forKey: .imageRefId)
        image = try values.decodeIfPresent(PetImage.self, forKey: .image)
        
        itemId = "\(String(describing: id))"
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

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        url = try values.decodeIfPresent(String.self, forKey: .url)
    }

}


struct Height : Codable, Hashable {
    let imperial : String?
    let metric : String?

    enum CodingKeys: String, CodingKey {
        case imperial = "imperial"
        case metric = "metric"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        imperial = try values.decodeIfPresent(String.self, forKey: .imperial)
        metric = try values.decodeIfPresent(String.self, forKey: .metric)
    }

}


struct Weight : Codable, Hashable {
    let imperial : String?
    let metric : String?

    enum CodingKeys: String, CodingKey {
        case imperial = "imperial"
        case metric = "metric"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        imperial = try values.decodeIfPresent(String.self, forKey: .imperial)
        metric = try values.decodeIfPresent(String.self, forKey: .metric)
    }

}
