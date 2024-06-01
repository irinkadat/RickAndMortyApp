//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Irinka Datoshvili on 31.05.24.
//

import Foundation
import Networking

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    private let networkService = NetworkService()
    private let baseURL = "https://rickandmortyapi.com/api"
    
    init() {
        fetchCharacters()
    }
    
    func fetchCharacters() {
        networkService.getData(urlString: "\(baseURL)/character") { (result: Result<CharacterResponse, Error>) in
            switch result {
            case .success(let response):
                self.characters = response.results
            case .failure(let error):
                print("Failed to fetch characters: \(error)")
            }
        }
    }
}

