//
//  AppScreen.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese on 3/1/24.
//

import SwiftUI

enum AppScreen: Codable, Hashable, Identifiable, CaseIterable {
    case home
//    case leaderboard
    case profile

    var id: AppScreen { self }
}

extension AppScreen {
    @ViewBuilder
    var label: some View {
        switch self {
        case .home: Label("Home", systemImage: "house")
//        case .leaderboard: Label("Leaderboard", systemImage: "bag")
        case .profile: Label("Profile", systemImage: "person")
        }
    }

    @ViewBuilder
    var destination: some View {
        switch self {

        case .home: HomeView()
//        case .leaderboard: LeaderboardView()
        case .profile: ProfileView()
        }
    }
}
