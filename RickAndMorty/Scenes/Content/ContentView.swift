//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Irinka Datoshvili on 31.05.24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Body
    
    var body: some View {
        TabView {
            CharactersView()
                .tabItem {
                    Label("Characters", systemImage: "person.2")
                }
            EpisodesView()
                .tabItem {
                    Label("Episodes", systemImage: "play.rectangle.on.rectangle")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            LocationsView()
                .tabItem {
                    Label("Locations", systemImage: "location.circle")
                }
        }
        .background(.customBackground)
        .foregroundColor(.white)
        .onAppear {
            setupAppearance()
        }
    }
    
    // MARK: - Methods
    
    /// Set up the appearance of the TabBar and NavigationBar.
    func setupAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(named: "CellBackground")
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "CellBackground")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}


#Preview {
    ContentView()
}
