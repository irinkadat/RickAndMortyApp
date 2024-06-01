//
//  EpisodesView.swift
//  RickAndMorty
//
//  Created by Irinka Datoshvili on 31.05.24.
//

import SwiftUI

struct EpisodesView: View {
    // MARK: - Properties
    
    @StateObject private var viewModel = EpisodeViewModel()
    @StateObject private var characterViewModel = CharacterViewModel()
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            scrollView
                .navigationTitle("Episodes")
        }
        .background(.customBackground)
    }
    
    // MARK: - Views
    
    var scrollView: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
                ForEach(viewModel.episodes) { episode in
                    NavigationLink(destination: EpisodeDetailView(episode: episode)) {
                        episodeCell(name: episode.name, episode: episode.episode)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(20)
        }
        .background(.customBackground)
    }
    
    // MARK: - Helper Methods
    
    func episodeCell(name: String, episode:String) -> some View {
        VStack {
            VStack(spacing: 10) {
                Text(name)
                Text(episode)
                    .font(.system(size: 10))
                    .foregroundColor(.white)
                    .shadow(color: .white, radius: 1)
                
            }
            .frame(width: 100, height: 100)
            .lineLimit(4)
            .font(.system(size: 14))
            .padding(6)
            .background(Color("CellBackground"))
            .cornerRadius(10)
            
        }
        .foregroundColor(.white)
    }
}

#Preview {
    EpisodesView()
}
