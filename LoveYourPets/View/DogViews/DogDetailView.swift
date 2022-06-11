//
//  DogDetailView.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct DogDetailView: View {
    var viewModel: DogModel?
    var body: some View {
        VStack {
            GeometryReader { geo in
                //                WebImage(url: URL(string: Constants.Dog.imageUrl(for: viewModel?.imageRefId)))
                WebImage(url: URL(string: "https://cdn2.thecatapi.com/images/SMuZx-bFM.jpg"))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: 300)
            }
            .cornerRadius(40)
            .edgesIgnoringSafeArea(.top)
            
            Text(viewModel.debugDescription)
                .padding()
                .shadow(color: .gray, radius: 5, x: 1, y: 1)
            
            
        }
    }
}

struct DogDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DogDetailView(viewModel: nil)
    }
}
