//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Irinka Datoshvili on 31.05.24.
//

import SwiftUI

struct CharactersView: View {
    // MARK: - Properties
    
    @StateObject private var viewModel = CharacterViewModel()
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 20) {
                    ForEach(viewModel.characters) { character in
                        NavigationLink(destination: CharacterDetailView(character: character)) {
                            CharacterCell(character: character)
                        }
                    }
                }
                .padding(.top, 20)
                .background(Color.black)
            }
            .padding(.horizontal, 10)
            .background(Color.black)
            .navigationTitle("Characters")
        }
        .background(Color.black)
        .foregroundColor(.white)
    }
}

#Preview {
    CharactersView()
}
