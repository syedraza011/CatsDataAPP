//
//  CatResponse.swift
//  CatsDataAPP
//
//  Created by Syed Raza on 8/21/23.
//

import Foundation
struct CatResponse: Decodable,Identifiable, Hashable {
    let id: Int
    let breed: String
    let address: String
    let name: String
    let photo: String
    
}





