//
//  CatResponse.swift
//  CatsDataAPP
//
//  Created by Syed Raza on 8/21/23.
//



import Foundation
struct CatsResponse: Decodable, Identifiable, Hashable {
    let id: String
    let breed: String
    let address: String
    let name: String
    let photo: String
    

}





