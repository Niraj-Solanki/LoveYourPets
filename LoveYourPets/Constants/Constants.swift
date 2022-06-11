//
//  Constants.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import UIKit
import SwiftUI

struct Constants {
    struct Dog {
        static let baseURL = "https://api.thedogapi.com/v1"
        static let ApiKey = "85aa17c9-2882-4ab6-a55e-10e3ecada931"
        static let imagePath = "https://cdn2.thedogapi.com/images/"
        static let limit = 20
        
        static func imageUrl(for refID: String?) -> String {
            "\(Dog.imagePath)\(refID ?? "").jpg"
        }
    }
    
    struct Cat {
        static let baseURL = "https://api.thecatapi.com/v1/"
        static let ApiKey = "e86fbc79-765f-48f3-b30b-546c854e683e"
        static let imagePath = "https://cdn2.thecatapi.com/images/"
        static let limit = 20
        
        static func imageUrl(for refID: String?) -> String {
            "\(Cat.imagePath)\(refID ?? "").jpg"
        }
    }
    
    static let timeout: TimeInterval = 30.0
}

struct AppFont {
    static func common(size: CGFloat, weight: Font.Weight? = .regular) -> Font {
        return Font.custom("Euphemia UCAS", size: size).weight(weight ?? .regular)
        
    }
}
