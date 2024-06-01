//
//  Character.swift
//  RickAndMorty
//
//  Created by Irinka Datoshvili on 31.05.24.
//

import Foundation

struct Character: Identifiable, Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let image: String
    let episode: [String]
}

struct Origin: Decodable {
    let name: String
}

struct CharacterResponse: Decodable {
    let results: [Character]
}

