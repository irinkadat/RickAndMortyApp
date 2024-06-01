//
//  EpisodeDetailViewModel.swift
//  RickAndMorty
//
//  Created by Irinka Datoshvili on 31.05.24.
//

import Foundation
import Networking

class EpisodeDetailViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var characters: [Character] = []
    private let networkService = NetworkService()
    
    // MARK: - Methods
    
    func fetchCharacters(for episode: Episode) {
        characters = []
        let group = DispatchGroup()
        
        for url in episode.characters {
            group.enter()
            networkService.getData(urlString: url) { (result: Result<Character, Error>) in
                switch result {
                case .success(let character):
                    self.characters.append(character)
                case .failure(let error):
                    print("Failed to fetch character: \(error)")
                }
                
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            self.objectWillChange.send()
        }
    }
}
