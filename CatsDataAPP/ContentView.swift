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
                        AsyncImage(url: URL(string: cat.photo))
                    }
                    .listStyle(GroupedListStyle())
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

