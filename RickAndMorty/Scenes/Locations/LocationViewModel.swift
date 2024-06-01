//
//  LocationViewModel.swift
//  RickAndMorty
//
//  Created by Irinka Datoshvili on 31.05.24.
//

import SwiftUI
import Networking

class LocationViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var locations: [Location] = []
    private let networkService = NetworkService()
    
    init() {
        fetchLocations()
    }
    
    // MARK: - Methods
    
    func fetchLocations() {
        networkService.getData(urlString: "https://rickandmortyapi.com/api/location") { (result: Result<LocationResponse, Error>) in
            switch result {
            case .success(let locations):
                self.locations = locations.results
            case .failure(let error):
                print("Failed to fetch locations: \(error)")
            }
        }
    }
}


