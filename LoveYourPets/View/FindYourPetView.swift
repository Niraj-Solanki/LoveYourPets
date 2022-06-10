//
//  FindYourPetView.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import SwiftUI

struct FindYourPetView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: PetViewModel
    @State var searchText = ""
    
    var gridLayout = Array(repeating: GridItem(), count: 3)
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout) {
                    ForEach(viewModel.items, id: \.self) { breed in
                        
                        NavigationLink(destination: PetDetailView(viewModel: breed)) {
                            PetView(
                                imageUrl: "\(Constants.Dog.imageURL)\(breed.imageRefId ?? "").jpg",
                                breedName: breed.name ?? "")
                        }
                        .onAppear {
                            viewModel.loadMoreContentIfNeeded(currentItem: breed)
                        }
                    }
                }
                
            }
            .navigationTitle("Know your dog")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Image("home")
                    .resizable()
                    .frame(width: 24, height: 24, alignment: .center)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
            }
        }
        .searchable(text: $searchText, prompt: "🐶 Bhow Bhow (find me 🐾)")
        .font(AppFont.common(size: 14))
        .onChange(of: searchText) { searchText in
            viewModel.searchBreeds(by: searchText)
        }
        
    }
}



struct FindYourPetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FindYourPetView(viewModel: PetViewModel(networkManager: NetworkManagerImpl()))
        }
    }
}
