//
//  FindYourPetViewSnaphotTest.swift
//  LoveYourPetsTests
//
//  Created by Niraj Solanki on 12/06/22.
//

import SnapshotTesting
import XCTest
import SwiftUI

class FindYourPetViewSnaphotTest: XCTestCase {


    func testViewWithDogBreedBy() throws {
        
        let viewModel = FindYourPetViewModel<DogModel>(repository: DogRepositoryMock(), animalType: .dog)
        let contentView = FindYourPetView(viewModel: viewModel)
        contentView.viewModel.searchBreeds(by: "hus")
        
        let exp = expectation(description: "Test after 5 seconds")
        let _ = XCTWaiter.wait(for: [exp], timeout: 1.0)
        assertSnapshot(matching: contentView, as: .image)
        
    }

    
    func testViewWithDogBreeds() throws {
        
        let viewModel = FindYourPetViewModel<DogModel>(repository: DogRepositoryMock(), animalType: .dog)
        let contentView = FindYourPetView(viewModel: viewModel)
        assertSnapshot(matching: contentView, as: .image)

    }
    
    func testViewWithCatBreedBy() throws {
        
        let viewModel = FindYourPetViewModel<CatModel>(repository: CatRepositoryMock(), animalType: .dog)
        let contentView = FindYourPetView(viewModel: viewModel)
        contentView.viewModel.searchBreeds(by: "pe")
        
        let exp = expectation(description: "Test after 5 seconds")
        let _ = XCTWaiter.wait(for: [exp], timeout: 1.0)
        assertSnapshot(matching: contentView, as: .image)
        
    }

    
    func testViewWithCatBreeds() throws {
        
        let viewModel = FindYourPetViewModel<CatModel>(repository: CatRepositoryMock(), animalType: .dog)
        let contentView = FindYourPetView(viewModel: viewModel)
        assertSnapshot(matching: contentView, as: .image)

    }

}
