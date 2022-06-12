//
//  CatDetailViewSnapshotTest.swift
//  LoveYourPetsTests
//
//  Created by Niraj Solanki on 12/06/22.
//


import SnapshotTesting
import XCTest


class CatDetailViewSnapshotTest: XCTestCase {

    func testCatDetailView() throws {
        
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
        let _ = XCTWaiter.wait(for: [exp], timeout: 2.0)
        
        guard let catModel = catModel else { return }
        
        let catDetailView = CatDetailView(viewModel: .init(model: catModel))
            .frame(width: 320, height: 680, alignment: .center)
        assertSnapshot(matching: catDetailView, as: .image)
    }
    
    func testCatDetailViewRTL() throws {
        
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
        let _ = XCTWaiter.wait(for: [exp], timeout: 2.0)
        
        guard let catModel = catModel else { return }
        
        let catDetailView = CatDetailView(viewModel: .init(model: catModel))
            .frame(width: 320, height: 680, alignment: .center)
            .environment(\.layoutDirection, .rightToLeft)
        assertSnapshot(matching: catDetailView, as: .image)
    }
    
    
}
