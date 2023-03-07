//
//  NetworkData.swift
//  MasterCook
//
//  Created by leogoba on 01.03.2023.
//

import Foundation

struct NetworkData: Decodable {
    let results: [Recipes]
}

struct Recipes: Decodable {
    let id: Int
    let title: String
    let image: String
    let imageType: String
}
