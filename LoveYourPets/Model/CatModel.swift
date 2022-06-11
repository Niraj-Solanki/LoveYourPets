//
//  CatModel.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import Foundation
struct CatModel : Codable, Hashable, AnimalModel {
    
    var itemId: String?
    let weight : Weight?
    let id : String?
    var name : String?
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
    var imageRefId : String?
    let image : PetImage?
    
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
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        weight = try values.decodeIfPresent(Weight.self, forKey: .weight)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        cfa_url = try values.decodeIfPresent(String.self, forKey: .cfa_url)
        vetstreet_url = try values.decodeIfPresent(String.self, forKey: .vetstreet_url)
        vcahospitals_url = try values.decodeIfPresent(String.self, forKey: .vcahospitals_url)
        temperament = try values.decodeIfPresent(String.self, forKey: .temperament)
        origin = try values.decodeIfPresent(String.self, forKey: .origin)
        country_codes = try values.decodeIfPresent(String.self, forKey: .country_codes)
        country_code = try values.decodeIfPresent(String.self, forKey: .country_code)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        life_span = try values.decodeIfPresent(String.self, forKey: .life_span)
        indoor = try values.decodeIfPresent(Int.self, forKey: .indoor)
        lap = try values.decodeIfPresent(Int.self, forKey: .lap)
        alt_names = try values.decodeIfPresent(String.self, forKey: .alt_names)
        adaptability = try values.decodeIfPresent(Int.self, forKey: .adaptability)
        affection_level = try values.decodeIfPresent(Int.self, forKey: .affection_level)
        child_friendly = try values.decodeIfPresent(Int.self, forKey: .child_friendly)
        dog_friendly = try values.decodeIfPresent(Int.self, forKey: .dog_friendly)
        energy_level = try values.decodeIfPresent(Int.self, forKey: .energy_level)
        grooming = try values.decodeIfPresent(Int.self, forKey: .grooming)
        health_issues = try values.decodeIfPresent(Int.self, forKey: .health_issues)
        intelligence = try values.decodeIfPresent(Int.self, forKey: .intelligence)
        shedding_level = try values.decodeIfPresent(Int.self, forKey: .shedding_level)
        social_needs = try values.decodeIfPresent(Int.self, forKey: .social_needs)
        stranger_friendly = try values.decodeIfPresent(Int.self, forKey: .stranger_friendly)
        vocalisation = try values.decodeIfPresent(Int.self, forKey: .vocalisation)
        experimental = try values.decodeIfPresent(Int.self, forKey: .experimental)
        hairless = try values.decodeIfPresent(Int.self, forKey: .hairless)
        natural = try values.decodeIfPresent(Int.self, forKey: .natural)
        rare = try values.decodeIfPresent(Int.self, forKey: .rare)
        rex = try values.decodeIfPresent(Int.self, forKey: .rex)
        suppressed_tail = try values.decodeIfPresent(Int.self, forKey: .suppressed_tail)
        short_legs = try values.decodeIfPresent(Int.self, forKey: .short_legs)
        wikipedia_url = try values.decodeIfPresent(String.self, forKey: .wikipedia_url)
        hypoallergenic = try values.decodeIfPresent(Int.self, forKey: .hypoallergenic)
        imageRefId = try values.decodeIfPresent(String.self, forKey: .imageRefId)
        image = try values.decodeIfPresent(PetImage.self, forKey: .image)
        
        itemId = id
    }
    
}
