//
//  DogViewModel.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import Foundation

class FindYourDogViewModel: ObservableObject {
    @Published var items: [DogModel] = []
    @Published var breedList: [DogModel] = [] {
        didSet {
            items = breedList
        }
    }
    
    private var currentPage = 0
    private var searchtext  = ""
    var searchTimer: Timer?
    
    var networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        fetchBreeds()
    }
    
    var title: String {
        return "Find Your Dog"
    }
    
    var prompt: String {
        return "🐶 Bhow Bhow (find me 🐾)"
    }
    
    func loadMoreContentIfNeeded(currentItem item: DogModel) {
        guard searchtext.isEmpty else { return }
        
        let thresholdIndex = items.index(items.endIndex, offsetBy: -5)
        if items.firstIndex(where: { $0.id == item.id }) == thresholdIndex {
            currentPage += 1
            fetchBreeds()
        }
    }
    
    func searchBreeds(by name: String) {
        searchtext = name
        searchTimer?.invalidate()
        
        if name.isEmpty {
            items.removeAll()
            items = breedList
        } else {
            searchTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (timer) in
                //do Something crazy
                self.fetchBreed(by: self.searchtext)
            })
        }
    }
    
    private func fetchBreed(by name: String) {
        let breedSearchAPI = DogRepository.search(breed: name)
        networkManager.request(repository: breedSearchAPI) { [weak self] (result: Result<[DogModel], LystError>) in
            switch result {
            case .success(let dogModels):
                DispatchQueue.main.async {
                    self?.items = dogModels
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchBreeds() {
        print("Page: \(currentPage)")
        let breedsAPI = DogRepository.breeds(page: currentPage)
        networkManager.request(repository: breedsAPI) { [weak self] (result: Result<[DogModel], LystError>) in
            switch result {
            case .success(let dogModels):
                DispatchQueue.main.async {
                    self?.breedList.append(contentsOf: dogModels)
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
