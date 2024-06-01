//
//  Episode.swift
//  RickAndMorty
//
//  Created by Irinka Datoshvili on 31.05.24.
//

import Foundation

struct Episode: Identifiable, Decodable, Hashable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
}

struct EpisodeResponse: Decodable {
    let results: [Episode]
}
