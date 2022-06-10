//
//  FindYourDogView.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import SwiftUI

struct FindYourDogView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: DogViewModel
    @State var searchText = ""
    
    var gridLayout = Array(repeating: GridItem(), count: 3)
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout) {
                    ForEach(viewModel.items, id: \.self) { breed in
                        
                        NavigationLink(destination: DogDetailView(viewModel: breed)) {
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
            .navigationTitle(viewModel.title)
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
        .searchable(text: $searchText, prompt: viewModel.prompt)
        .font(AppFont.common(size: 14))
        .onChange(of: searchText) { searchText in
            viewModel.searchBreeds(by: searchText)
        }
        
    }
}

struct FindYourPetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FindYourDogView(viewModel: DogViewModel(networkManager: NetworkManagerImpl()))
        }
    }
}
