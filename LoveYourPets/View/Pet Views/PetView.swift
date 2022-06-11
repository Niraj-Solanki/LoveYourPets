//
//  PetView.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import SDWebImageSwiftUI
import SwiftUI

struct PetView: View {
    var imageUrl: String
    var breedName: String?
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: imageUrl))
                .placeholder(Image("dog"))
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(50)
            
            Text(breedName ?? "")
                .font(AppFont.common(size: 14))
                .foregroundColor(.black)
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
        .frame(width: 100, height: 150, alignment: .center)
    }
}

struct PetView_Previews: PreviewProvider {
    static var previews: some View {
        PetView(imageUrl: "", breedName: "Dog")
            .previewLayout(.fixed(width: 100, height: 150))
    }
}
