//
//  PetViewSnapshotTest.swift
//  LoveYourPetsTests
//
//  Created by Niraj Solanki on 12/06/22.
//

import SnapshotTesting
import XCTest


class PetViewSnapshotTest: XCTestCase {

    func testPetViewDefault() throws {
        let petView = PetView(imageUrl: "None", breedName: "Meaw Meaw")
            .previewLayout(.fixed(width: 100, height: 150))
        assertSnapshot(matching: petView, as: .image)
    }
    
    func testPetViewWithMultilineName() throws {
        let petView = PetView(imageUrl: "None", breedName: "Hello\nMeaw")
            .previewLayout(.fixed(width: 100, height: 150))
        assertSnapshot(matching: petView, as: .image)
    }
    
    func testPetViewWithVeryLongText() throws {
        let petView = PetView(imageUrl: "None", breedName: "Hello My Name Is Meaw! Meaw Meaw")
            .previewLayout(.fixed(width: 100, height: 150))
        assertSnapshot(matching: petView, as: .image)
    }
    
}
