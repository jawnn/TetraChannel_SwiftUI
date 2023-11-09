//
//  ContentView.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 10/27/23.
//

import SwiftUI

struct TetraChannelTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem({ Label("Home", systemImage: "house") })

            LeaderboardView()
                .tabItem({ Label("Leaderboard", systemImage: "bag") })

            ProfileView()
                .tabItem({ Label("Profile", systemImage: "person")})
        }
        .task {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TetraChannelTabView()
    }
}
