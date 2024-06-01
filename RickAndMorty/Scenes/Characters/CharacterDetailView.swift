//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Irinka Datoshvili on 31.05.24.
//

import SwiftUI

struct CharacterDetailView: View {
    // MARK: - Properties
    
    var character: Character
    @StateObject private var viewModel = CharacterDetailViewModel()
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 10) {
            characterImage(image: character.image)
            details
            List {
                ForEach(viewModel.episodes) { episode in
                    NavigationLink(destination: EpisodeDetailView(episode: episode)) {
                        episodeCellInfo(episode: episode.episode, name: episode.name)
                    }
                    .padding(5)
                    .listRowBackground(Color("CellBackground"))
                }
            }
            .background(.cellBackground)
            .customListStyle()
        }
        .background(.customBackground)
        .padding(.horizontal, 20)
        .padding(.top)
        .onAppear {
            viewModel.fetchEpisodes(for: character)
        }
        .background(.customBackground)
    }
    
    // MARK: - Details View
    
    var details: some View {
        VStack(spacing: 10) {
            Text(character.name)
                .font(.title2)
                .foregroundColor(.white)
            VStack(alignment: .leading, spacing: 5) {
                CharacterDetailRow(label: "Gender", value: character.gender)
                CharacterDetailRow(label: "Status", value: character.status)
                CharacterDetailRow(label: "Species", value: character.species)
                CharacterDetailRow(label: "Origin", value: character.origin.name)
            }
            .padding(.horizontal, 0)
            .padding(.vertical, 10)
            .cornerRadius(10)
        }
        .padding(.horizontal, 20)
    }
    
    // MARK: - Helper Views
    
    func episodeCellInfo(episode: String, name: String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(name)
            Text(episode)
                .foregroundStyle(.secondary)
                .font(.system(size: 12))
        }
    }
    
    func characterImage(image: String) -> some View {
        AsyncImage(url: URL(string: image)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)
                .clipShape(Circle())
        } placeholder: {
            ProgressView()
                .frame(width: 180, height: 180)
        }
        .padding(.top, 20)
        .padding(.bottom, 10)
    }
}
