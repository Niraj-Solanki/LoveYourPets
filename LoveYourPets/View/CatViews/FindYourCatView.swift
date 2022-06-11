//
//  FindYourCatView.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import SwiftUI

struct FindYourCatView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: CatViewModel
    @State var searchText = ""
    
    var gridLayout = Array(repeating: GridItem(), count: 3)
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout) {
                    ForEach(viewModel.items, id: \.self) { breed in
                        
                        NavigationLink(destination: CatDetailView(viewModel: breed)) {
                            PetView(
                                imageUrl: Constants.Cat.imageUrl(for: breed.imageRefId),
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

struct FindYourCatView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FindYourCatView(viewModel: CatViewModel(networkManager: NetworkManagerImpl()))
        }
    }
}
