//
//  SearchView.swift
//  RickAndMorty
//
//  Created by Irinka Datoshvili on 31.05.24.
//

import SwiftUI

struct SearchResult: Identifiable {
    let id = UUID()
    let name: String
}

struct SearchView: View {
    // MARK: - Properties
    
    @StateObject private var viewModel = SearchViewModel()
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: Search picker
            searchPicker
                .onChange(of: viewModel.selectedSegment) {
                    viewModel.clearSearch()
                }
            
            // MARK: Search bar
            searchBar
            
            // MARK: Search results list
            List(viewModel.searchResults) { result in
                Text(result.name)
                    .listRowBackground(Color("CellBackground"))
                    .padding(10)
            }
            .listStyle(PlainListStyle())
            .background(.cellBackground)
        }
        .navigationTitle("Search")
        .background(.cellBackground)
        .foregroundColor(.white)
    }
    
    // MARK: - Subviews
    
    var searchPicker: some View {
        Picker("Search", selection: $viewModel.selectedSegment) {
            Text("Characters").tag(0)
            Text("Episodes").tag(1)
                .foregroundColor(.white)
            Text("Locations").tag(2)
        }
        .pickerStyle(SegmentedPickerStyle())
        .background(.gray)
        .cornerRadius(8)
        .padding()
    }
    
    var searchBar: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 0.5)
                .fill(Color.gray)
                .frame(height: 40)
            TextField("Search", text: $viewModel.searchText)
                .padding()
                .foregroundColor(.white)
                .onChange(of: viewModel.searchText) {
                    viewModel.performSearch()
                }
        }
        .background(.cellBackground)
        .padding()
    }
}

#Preview {
    SearchView()
}
