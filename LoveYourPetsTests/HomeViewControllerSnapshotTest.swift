//
//  HomeViewControllerSnapshotTest.swift
//  LoveYourPetsTests
//
//  Created by Niraj Solanki on 12/06/22.
//

import XCTest
import SnapshotTesting

class HomeViewControllerSnapshotTest: XCTestCase {

    func testHomeScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(identifier: String(describing: HomeViewController.self))
        assertSnapshot(matching: homeVC.view, as: .image)
    }
}

