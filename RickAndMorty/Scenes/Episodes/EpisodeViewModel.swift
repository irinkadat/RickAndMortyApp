//
//  EpisodeViewModel.swift
//  RickAndMorty
//
//  Created by Irinka Datoshvili on 31.05.24.
//

import Foundation
import Networking

class EpisodeViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var episodes: [Episode] = []
    private let networkService = NetworkService()
    
    init() {
        fetchEpisodes()
    }
    
    // MARK: - Fetch Episodes
    
    func fetchEpisodes() {
        networkService.getData(urlString: "https://rickandmortyapi.com/api/episode") { (result: Result<EpisodeResponse, Error>) in
            switch result {
            case .success(let response):
                self.episodes = response.results
            case .failure(let error):
                print("Failed to fetch episodes: \(error)")
            }
        }
    }
}

