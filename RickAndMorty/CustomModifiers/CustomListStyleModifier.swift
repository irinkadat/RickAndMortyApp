//
//  CustomListStyleModifier.swift
//  RickAndMorty
//
//  Created by Irinka Datoshvili on 31.05.24.
//

import SwiftUI

struct CustomListStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        RoundedRectangle(cornerRadius: 12)
            .stroke(Color.white, lineWidth: 0.5) 
            .overlay(
                content
                    .listStyle(PlainListStyle())
                    .cornerRadius(12)
                    .foregroundColor(.white)
            )
    }
}

extension View {
    func customListStyle() -> some View {
        self.modifier(CustomListStyleModifier())
    }
}

