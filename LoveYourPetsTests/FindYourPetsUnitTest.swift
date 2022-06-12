//
//  FindYourPetsUnitTest.swift
//  LoveYourPetsTests
//
//  Created by Niraj Solanki on 12/06/22.
//


import XCTest

class FindYourPetsUnitTest: XCTestCase {

    func testViewModelForDog() throws {
        
        //When
        let viewModel = FindYourPetViewModel<DogModel>(repository: DogRepositoryMock(), animalType: .dog)
        
        // Breeds Item Count
        XCTAssertEqual(viewModel.items.count, 20)
        
        // Title
        XCTAssertEqual(viewModel.title, "Find Your Dog 🐶")
        
        // SearchPromp
        XCTAssertEqual(viewModel.prompt, "Bhow Bhow (decoded: find me 🐾)")
        
        // SearchPromp
        XCTAssertEqual(viewModel.imageUrl(""), "https://cdn2.thedogapi.com/images/.jpg")
        
        //When
        viewModel.searchBreeds(by: "hus")
        let exp = expectation(description: "Test after 5 seconds")
        let _ = XCTWaiter.wait(for: [exp], timeout: 1.0)
        
        XCTAssertEqual(viewModel.items.count, 2)
        
    }
    
    func testViewModelForCat() throws {
        
        //When
        let viewModel = FindYourPetViewModel<CatModel>(repository: CatRepositoryMock(), animalType: .cat)
        
        // Breeds Item Count
        XCTAssertEqual(viewModel.items.count, 20)
        
        // Title
        XCTAssertEqual(viewModel.title, "Find Your Cat 🐱")
        
        // SearchPromp
        XCTAssertEqual(viewModel.prompt, "Meaw Meaw (decoded: find me 🐾)")
        
        // SearchPromp
        XCTAssertEqual(viewModel.imageUrl(""), "https://cdn2.thecatapi.com/images/.jpg")
        
        //When
        viewModel.searchBreeds(by: "pe")
        let exp = expectation(description: "Test after 5 seconds")
        let _ = XCTWaiter.wait(for: [exp], timeout: 1.0)
        
        XCTAssertEqual(viewModel.items.count, 4)
        
    }
    
}
