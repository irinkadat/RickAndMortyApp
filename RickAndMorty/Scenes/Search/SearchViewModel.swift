//
//  SearchViewModel.swift
//  RickAndMorty
//
//  Created by Irinka Datoshvili on 31.05.24.
//

import Foundation
import Networking

class SearchViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var searchText = ""
    @Published var selectedSegment = 0
    @Published var searchResults: [SearchResult] = []
    private let networkService = NetworkService()
    
    // MARK: - Methods
    
    func performSearch() {
        searchResults = []
        
        switch selectedSegment {
        case 0:
            networkService.getData(urlString: "https://rickandmortyapi.com/api/character") { (result: Result<CharacterResponse, Error>) in
                switch result {
                case .success(let characters):
                    self.searchResults = characters.results.filter { $0.name.lowercased().contains(self.searchText.lowercased()) }
                        .map { SearchResult(name: $0.name) }
                case .failure(let error):
                    print("Failed to fetch characters: \(error)")
                }
            }
        case 1:
            networkService.getData(urlString: "https://rickandmortyapi.com/api/episode") { (result: Result<EpisodeResponse, Error>) in
                switch result {
                case .success(let episodes):
                    self.searchResults = episodes.results.filter { $0.name.lowercased().contains(self.searchText.lowercased()) }
                        .map { SearchResult(name: $0.name) }
                case .failure(let error):
                    print("Failed to fetch episodes: \(error)")
                }
            }
        case 2:
            networkService.getData(urlString: "https://rickandmortyapi.com/api/location") { (result: Result<LocationResponse, Error>) in
                switch result {
                case .success(let locations):
                    self.searchResults = locations.results.filter { $0.name.lowercased().contains(self.searchText.lowercased()) }
                        .map { SearchResult(name: $0.name) }
                case .failure(let error):
                    print("Failed to fetch locations: \(error)")
                }
            }
        default:
            break
        }
    }
    
    func clearSearch() {
        searchText = ""
        searchResults = []
    }
}
