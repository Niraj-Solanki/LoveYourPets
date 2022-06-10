//
//  LystError.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import Foundation

typealias LystErrorHandler = (LystError?) -> Void

struct LystError: Error {
    var localizedDescription: String
    init(_ localizedDescription: String) {
        self.localizedDescription = localizedDescription
    }
}
