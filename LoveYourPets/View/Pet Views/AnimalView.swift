//
//  AnimalView.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import SwiftUI

struct AnimalView<T: AnimalModel>: View {
    var animalModel: T?
    
    var body: some View {
        if let catModel = animalModel as? CatModel {
            CatDetailView(
                viewModel: CatViewModel(model: catModel))
        }
        else {
            Text("Coming Soom!")
        }
    }
}

struct AnimalView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalView<CatModel>()
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
