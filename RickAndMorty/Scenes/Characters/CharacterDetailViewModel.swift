//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Irinka Datoshvili on 31.05.24.
//

import Foundation
import Networking

class CharacterDetailViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var episodes: [Episode] = []
    private let networkService = NetworkService()
    
    // MARK: - Public Methods
    
    func fetchEpisodes(for character: Character) {
        episodes = []
        let group = DispatchGroup()
        
        for url in character.episode {
            group.enter()
            networkService.getData(urlString: url) { (result: Result<Episode, Error>) in
                switch result {
                case .success(let episode):
                    self.episodes.append(episode)
                case .failure(let error):
                    print("Failed to fetch episode: \(error)")
                }
                group.leave()
            }
        }
        group.notify(queue: .main) {
            self.objectWillChange.send()
        }
    }
}
