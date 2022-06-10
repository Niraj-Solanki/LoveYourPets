//
//  CatDetailView.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct CatDetailView: View {
    var viewModel: CatModel?
    var body: some View {
        VStack {
//            Image("\(Constants.Dog.imageURL)\(viewModel?.imageRefId ?? "").jpg")
            GeometryReader { geo in
            WebImage(url: URL(string: "\(Constants.Cat.imageURL)\(viewModel?.imageRefId ?? "").jpg"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: geo.size.width, height: 300)
            }
            .cornerRadius(40)
            .edgesIgnoringSafeArea(.top)

        }
    }
}

struct CatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DogDetailView(viewModel: nil)
    }
}
