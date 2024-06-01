//
//  CharacterDetailRow.swift
//  RickAndMorty
//
//  Created by Irinka Datoshvili on 31.05.24.
//

import SwiftUI

struct CharacterDetailRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text("\(label):")
                .fontWeight(.semibold)
            Spacer()
            Text(value)
        }
        .font(.system(size: 14))
        .foregroundColor(.white)
    }
}
