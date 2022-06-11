//
//  CatDetailView.swift
//  LoveYourPets
//
//  Created by Niraj Solanki on 11/06/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct CatDetailView: View {
    var viewModel: CatViewModel
    @State private var showWikiPage = false
    
    var body: some View {
        
        GeometryReader { geo in
            ScrollView {
                VStack {
                    
                    Group {
                        Text(viewModel.description)
                        
                        WebImage(url: viewModel.imageUrl)
                            .placeholder(Image("pets"))
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
                                Text(viewModel.lifespan)
                            }
                            
                            VStack(spacing: 10) {
                                Text("Energy Level")
                                    .font(AppFont.common(size: 15, weight: .semibold))
                                Text(viewModel.enerygLevel)
                            }
                        }
                        .font(AppFont.common(size: 14))
                        .frame(width: geo.size.width * 0.5, alignment: .center)
                    }
                    
                    HStack {
                        Text("Temprament")
                            .font(AppFont.common(size: 15, weight: .semibold))
                            .frame(width: geo.size.width * 0.3, alignment: .top)
                        
                        Text(viewModel.temprament)
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
                        WebView(url: viewModel.wikipediaUrl)
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
                .shadow(color: .gray, radius: 5, x: 1, y: 1)
                .font(AppFont.common(size: 15))
            }
        }
        
    }
}

