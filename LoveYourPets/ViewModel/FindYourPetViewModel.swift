//
//  DogViewModel.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import Foundation

class FindYourPetViewModel <T: AnimalModel>: ObservableObject {
    
    // MARK: Properties
    @Published var items: [T] = []
    private var breedList: [T] = [] {
        didSet {
            items = breedList
        }
    }
    
    private var currentPage = 0
    private var searchtext  = ""
    private var searchTimer: Timer?
    
    private let repository: AnimalRepository
    private let animalType: AnimalType
    
    // MARK: Initializer
    init(repository: AnimalRepository, animalType: AnimalType) {
        self.repository = repository
        self.animalType = animalType
        fetchBreeds()
    }
    
    var title: String {
        animalType.title
    }
    
    var prompt: String {
        animalType.searchPromp
    }
    
    func imageUrl(_ refId: String?) -> String {
        switch animalType {
        case .dog:
            return Constants.Dog.imageUrl(for: refId)
        case .cat:
            return Constants.Cat.imageUrl(for: refId)
        }
    }
    
    func loadMoreContentIfNeeded(currentItem item: T) {
        guard searchtext.isEmpty else { return }
        
        let thresholdIndex = items.index(items.endIndex, offsetBy: -5)
        if items.firstIndex(where: { $0.itemId == item.itemId }) == thresholdIndex {
            currentPage += 1
            fetchBreeds()
        }
    }
    
    // MARK: Search
    func searchBreeds(by name: String) {
        searchtext = name
        searchTimer?.invalidate()
        
        if name.isEmpty {
            items.removeAll()
            items = breedList
        } else {
            searchTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (timer) in
                self.fetchBreed(by: self.searchtext)
            })
        }
    }
    
}

// MARK: Repository Work
extension FindYourPetViewModel {
    
    private func fetchBreed(by name: String) {
        repository.fetchBreed(by: name) {
            [weak self] (result: Result<[T], LystError>) in
            switch result {
            case .success(let petModels):
                self?.items = petModels
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchBreeds() {
        repository.fetchBreed(page: currentPage) {
            [weak self] (result: Result<[T], LystError>) in
            switch result {
            case .success(let petModels):
                self?.breedList.append(contentsOf: petModels)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
