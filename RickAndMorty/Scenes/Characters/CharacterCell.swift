//
//  CharacterCell.swift
//  RickAndMorty
//
//  Created by Irinka Datoshvili on 31.05.24.
//

import SwiftUI

struct CharacterCell: View {
    // MARK: - Properties
    
    var character: Character
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .cornerRadius(12)
            } placeholder: {
                ProgressView()
                    .frame(width: 80, height: 80)
            }
            .padding(.top, 10)
            
            characterDetails(character: character)
        }
        .frame(width: 120, height: 170)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(10)
        
    }
    
    // MARK: - Helper Methods
    
    func characterDetails(character: Character) -> some View {
        VStack(spacing: 4) {
            Text(character.name)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(maxHeight: 40)
                .shadow(color: .gray, radius: 1)
            
            VStack {
                Text(character.species)
                Text(character.status)
            }
            .foregroundStyle(.secondary)
            .foregroundColor(.gray)
            .font(.system(size: 12))
            .padding(.bottom, 8)
        }
        .padding(.horizontal, 10)
    }
}
