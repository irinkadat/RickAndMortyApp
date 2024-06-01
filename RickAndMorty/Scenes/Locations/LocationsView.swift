//
//  LocationsView.swift
//  RickAndMorty
//
//  Created by Irinka Datoshvili on 31.05.24.
//

import SwiftUI

struct LocationsView: View {
    // MARK: - Properties
    
    @StateObject private var viewModel = LocationViewModel()
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            List(viewModel.locations) { location in
                Text(location.name)
                    .listRowBackground(Color("CellBackground"))
                    .padding(10)
                    .foregroundColor(.white)
            }
            .customListStyle()
            .padding(.horizontal)
            .padding(.top)
            .navigationTitle("Locations")
            .background(Color("CustomBackground"))
        }
        .background(Color("CustomBackground"))
        .accentColor(.white)
        .onAppear {
            viewModel.fetchLocations()
        }
        .background(Color("CustomBackground"))
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}


