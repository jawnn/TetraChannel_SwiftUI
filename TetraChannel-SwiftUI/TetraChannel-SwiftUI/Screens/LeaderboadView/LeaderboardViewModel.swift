//
//  LeaderboardViewModel.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 10/31/23.
//

import Foundation

@MainActor final class LeaderboardViewModel: ObservableObject {

    @Published var xpLeaderboard: [XpRankedPlayer] = []
    @Published var leagueLeaderboard: [LeagueRankedPlayer] = []
    @Published var isLoading: Bool = true

    let dispatchGroup = DispatchGroup()

    func dispatchRequest() {
        guard xpLeaderboard.isEmpty && leagueLeaderboard.isEmpty else {
            return
        }

        dispatchGroup.enter()
        self.getLeagueLeaderboard()

        dispatchGroup.enter()
        self.getXpLeaderboard()

        dispatchGroup.notify(queue: .main) {
            self.isLoading = false
        }
    }

    func getXpLeaderboard() {
        Task {
            do {
                self.xpLeaderboard = try await NetworkManager.shared.getXpLeaderboard()
                self.dispatchGroup.leave()
            } catch {
                print(error)
            }
        }

    }

    func getLeagueLeaderboard() {
        Task {
            do {
                self.leagueLeaderboard = try await NetworkManager.shared.getLeagueLeaderboard()
                self.dispatchGroup.leave()
            } catch {
                print(error)
            }
        }

    }
}
