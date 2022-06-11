//
//  HomeViewController.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import SwiftUI
import UIKit

class HomeViewController: UIViewController {
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Actions
    @IBAction func dogAction(_ sender: UIButton) {
        let viewModel = FindYourPetViewModel<DogModel>(repository: DogRepository(), animalType: .dog)
        let contentView = FindYourPetView(viewModel: viewModel)
        
        let findPetVC = UIHostingController(rootView: contentView)
        findPetVC.modalPresentationStyle = .fullScreen
        present(findPetVC, animated: true, completion: nil)
    }
    
    @IBAction func catAction(_ sender: UIButton) {
        let viewModel = FindYourPetViewModel<CatModel>(repository: CatRepository(), animalType: .cat)
        let contentView = FindYourPetView(viewModel: viewModel)
        
        let findPetVC = UIHostingController(rootView: contentView)
        findPetVC.modalPresentationStyle = .fullScreen
        present(findPetVC, animated: true, completion: nil)
    }
    
}

