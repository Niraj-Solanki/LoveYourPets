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
    @State private var showWikiPage = false
    
    var body: some View {
        
        GeometryReader { geo in
            ScrollView {
                VStack {
                    
                    Group {
                        Text(viewModel?.description ?? "Description")
                        
                        WebImage(url: URL(string: Constants.Cat.imageUrl(for: viewModel?.imageRefId)))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geo.size.width - 30, height: geo.size.height * 0.3, alignment: .center)
                            .cornerRadius(25)
                    }
                    .padding()
                    .clipped()
                    
                    HStack(alignment: .top, spacing: 0) {
                        Group {
                            VStack(spacing: 10) {
                                Text("Lifespan")
                                    .font(AppFont.common(size: 15, weight: .semibold))
                                Text("\(viewModel?.life_span ?? "") Years")
                            }
                            
                            VStack(spacing: 10) {
                                Text("Energy Level")
                                    .font(AppFont.common(size: 15, weight: .semibold))
                                Text("\(viewModel?.energy_level ?? 0)")
                            }
                        }
                        .font(AppFont.common(size: 14))
                        .frame(width: geo.size.width * 0.5, alignment: .center)
                    }
                    
                    HStack {
                        Text("Temprament")
                            .font(AppFont.common(size: 15, weight: .semibold))
                            .frame(width: geo.size.width * 0.3, alignment: .top)
                        
                        Text(viewModel?.temperament ?? "")
                            .frame(width: geo.size.width * 0.6, alignment: .center)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    
                    Button {
                        showWikiPage.toggle()
                    } label: {
                        Text("Check my Wikipedia 🐾")
                    }
                    .padding()
                    .sheet(isPresented: $showWikiPage) {
                        WebView(url: URL(string: viewModel?.wikipedia_url ?? "")!)
                    }
                    
                }
                .shadow(color: .gray, radius: 5, x: 1, y: 1)
                .navigationTitle(viewModel?.name ?? "")
                .font(AppFont.common(size: 15))
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
}

struct CatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CatDetailView(viewModel: nil)
    }
}
