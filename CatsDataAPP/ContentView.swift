//
//  ContentView.swift
//  CatsDataAPP
//
//  Created by Syed Raza on 08/21/2023
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = CatsViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.allCats.isEmpty {
                    ProgressView("Loading...")
                        .padding()
                } else {
                    List(viewModel.allCats, id: \.self) { cat in
                        Text("\(cat.name)")
                        Text("\(cat.breed)")
                        Text("\(cat.address)")
                        
                        if cat.photo.isEmpty{
                            ProgressView("Loading...")
                        } else {
                            AsyncImage(url: URL(string: cat.photo)) { phase in
                                switch phase {
                                case .empty:
                                    Text("Loading...")
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                case .failure(_):
                                   Image(systemName: "photo.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        
                                @unknown default:
                                    Text("Unknown state")
                                
                                }
                            }
                        }
                    }
                
                   
                }
            }
            .navigationBarTitle("Cats")
            .onAppear {
                viewModel.getCats()
            }
        }
       
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

