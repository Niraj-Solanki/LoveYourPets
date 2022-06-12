//
//  CatDetailViewUnitTest.swift
//  LoveYourPetsTests
//
//  Created by Niraj Solanki on 12/06/22.
//

import XCTest

class CatDetailViewUnitTest: XCTestCase {

    func testViewModel() throws {
        
        //When
        let catRepositoryMock = CatRepositoryMock()
        var catModel: CatModel?
        
        catRepositoryMock.fetchBreed(page: 0) { (result: Result<[CatModel], LystError>) in
            switch result {
            case .success(let petModels):
                catModel = petModels.first
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        
        let exp = expectation(description: "Test after 5 seconds")
        let _ = XCTWaiter.wait(for: [exp], timeout: 1.0)
        
        //Then
        XCTAssertNotNil(catModel)
        
    }

}
