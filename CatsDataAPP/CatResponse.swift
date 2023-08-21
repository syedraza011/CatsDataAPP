//
//  CatResponse.swift
//  CatsDataAPP
//
//  Created by Syed Raza on 8/21/23.
//

import Foundation
struct Cats: Decodable, Hashable {
    let id: Int
    let breed: String
    let address: String
    let name: String
    let url: String
    
}
