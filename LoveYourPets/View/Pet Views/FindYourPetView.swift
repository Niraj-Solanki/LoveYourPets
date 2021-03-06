//
//  FindYourDogView.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import SwiftUI

struct FindYourPetView<T: AnimalModel>: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: FindYourPetViewModel<T>
    @State var searchText = ""
    
    var gridLayout = Array(repeating: GridItem(), count: 3)
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout) {
                    ForEach(viewModel.items, id: \.self) { breed in
                        
                        NavigationLink(destination: AnimalView(animalModel: breed)) {
                            PetView(
                                imageUrl: viewModel.imageUrl(breed.imageRefId),
                                breedName: breed.name)
                        }
                        .onAppear {
                            viewModel.loadMoreContentIfNeeded(currentItem: breed)
                        }
                    }
                }
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text(viewModel.title).font(AppFont.common(size: 18, weight: .bold))
                    }
                }
            }
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
            FindYourPetView(viewModel: FindYourPetViewModel<CatModel>(repository: CatRepository(), animalType: .cat))
        }
    }
}
