//
//  CatViewModel.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import Foundation

struct CatViewModel {
    
    private let model: CatModel
    
    init(model: CatModel) {
        self.model = model
    }
    
    var description: String {
        return model.description ?? "No Description Available"
    }
    
    var imageUrl: URL? {
        URL(string: Constants.Cat.imageUrl(for: model.imageRefId))
    }
    
    var lifespan: String {
        guard let value = model.life_span else { return "" }
        return value.appending(" Years")
    }
    
    var enerygLevel: String {
        guard let energy = model.energy_level else { return "" }
        return "\(energy)/5"
    }
    
    var temprament: String {
        guard let tempramentValue = model.temperament
        else { return "" }
        
        return tempramentValue
    }
    
    var wikipediaUrl: URL {
        guard let wiki = model.wikipedia_url,
              let wikiUrl = URL(string: wiki)  else { return URL(string: "https:google.com")! }
        
        return wikiUrl
    }
    
    var title: String {
        model.name ?? "Unknown"
    }
    
}
