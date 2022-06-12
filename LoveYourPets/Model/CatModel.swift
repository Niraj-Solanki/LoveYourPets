//
//  CatModel.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import Foundation
struct CatModel : Codable, Hashable, AnimalModel {
    
    let weight : Weight?
    let id : String?
    let cfa_url : String?
    let vetstreet_url : String?
    let vcahospitals_url : String?
    let temperament : String?
    let origin : String?
    let country_codes : String?
    let country_code : String?
    let description : String?
    let life_span : String?
    let indoor : Int?
    let lap : Int?
    let alt_names : String?
    let adaptability : Int?
    let affection_level : Int?
    let child_friendly : Int?
    let dog_friendly : Int?
    let energy_level : Int?
    let grooming : Int?
    let health_issues : Int?
    let intelligence : Int?
    let shedding_level : Int?
    let social_needs : Int?
    let stranger_friendly : Int?
    let vocalisation : Int?
    let experimental : Int?
    let hairless : Int?
    let natural : Int?
    let rare : Int?
    let rex : Int?
    let suppressed_tail : Int?
    let short_legs : Int?
    let wikipedia_url : String?
    let hypoallergenic : Int?
    let image : PetImage?
    
    //Override Properties
    var name : String?
    var imageRefId : String?
    
    //Custom Property
    var itemId: String? { return id }
    
    enum CodingKeys: String, CodingKey {
        
        case weight = "weight"
        case id = "id"
        case name = "name"
        case cfa_url = "cfa_url"
        case vetstreet_url = "vetstreet_url"
        case vcahospitals_url = "vcahospitals_url"
        case temperament = "temperament"
        case origin = "origin"
        case country_codes = "country_codes"
        case country_code = "country_code"
        case description = "description"
        case life_span = "life_span"
        case indoor = "indoor"
        case lap = "lap"
        case alt_names = "alt_names"
        case adaptability = "adaptability"
        case affection_level = "affection_level"
        case child_friendly = "child_friendly"
        case dog_friendly = "dog_friendly"
        case energy_level = "energy_level"
        case grooming = "grooming"
        case health_issues = "health_issues"
        case intelligence = "intelligence"
        case shedding_level = "shedding_level"
        case social_needs = "social_needs"
        case stranger_friendly = "stranger_friendly"
        case vocalisation = "vocalisation"
        case experimental = "experimental"
        case hairless = "hairless"
        case natural = "natural"
        case rare = "rare"
        case rex = "rex"
        case suppressed_tail = "suppressed_tail"
        case short_legs = "short_legs"
        case wikipedia_url = "wikipedia_url"
        case hypoallergenic = "hypoallergenic"
        case imageRefId = "reference_image_id"
        case image = "image"
    }
}
