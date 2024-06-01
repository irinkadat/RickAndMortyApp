//
//  EpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Irinka Datoshvili on 31.05.24.
//

import SwiftUI

struct EpisodeDetailView: View {
    // MARK: - Properties
    
    let episode: Episode
    @StateObject private var viewModel = EpisodeDetailViewModel()
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20) {
            // MARK: Character info
            characterInfo
            
            // MARK: Characters list
            charactersList
        }
        .padding(.horizontal)
        .onAppear {
            viewModel.fetchCharacters(for: episode)
        }
        .background(.customBackground)
        .foregroundColor(.white)
    }
    
    // MARK: - Subviews
    
    var characterInfo: some View {
        VStack(alignment:.center, spacing: 20) {
            Text(episode.name)
                .fontWeight(.semibold)
                .font(.system(size: 20))
            VStack(spacing: 5) {
                CharacterDetailRow(label: "Air Date", value: episode.air_date)
                CharacterDetailRow(label: "Episode", value: episode.episode)
            }
        }
        .padding(.horizontal, 70)
        .padding()
    }
    
    var charactersList: some View {
        List {
            ForEach(viewModel.characters) { character in
                NavigationLink(destination: CharacterDetailView(character: character)) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(character.name)
                            .font(.system(size: 14))
                        Text(character.species)
                            .font(.system(size: 12))
                    }
                }
                .padding(5)
                .listRowBackground(Color("CellBackground"))
            }
        }
        .customListStyle()
    }
}
