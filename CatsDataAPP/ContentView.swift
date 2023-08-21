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
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(viewModel.allcats, id: \.self) { cat in
                      VStack{
                                Text(cat.name)
                            } .font(.headline)
                                .foregroundColor(.blue)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10))
            }
            .navigationTitle("CAT's Data Base")
            .onAppear{
                viewModel.getCats()
            }
        }
    }




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
