//
//  Location.swift
//  RickAndMorty
//
//  Created by Irinka Datoshvili on 31.05.24.
//

import Foundation

struct Location: Identifiable, Decodable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
}

struct LocationResponse: Decodable {
    let results: [Location]
}
