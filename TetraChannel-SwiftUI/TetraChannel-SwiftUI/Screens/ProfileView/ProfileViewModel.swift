//
//  ProfileViewModel.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 11/2/23.
//

import Foundation
import SwiftUI

@MainActor
final class ProfileViewModel: ObservableObject {
    @Published var isLoading: Bool = true
    @Published var newsfeed: [NewsArticle] = []
    @Published var profile: Profile = MockData.profile
    @Published var leagueStats: League = MockData.league
    @Published var blitzRecord: RecordEntry = MockData.fortyLineRecordEntry
    @Published var fortyLineRecord: RecordEntry = MockData.fortyLineRecordEntry

    var recordLog: RecordLog? = nil
    let dispatchGroup = DispatchGroup()

    func dispatchRequest() {
        guard profile.id == MockData.profile.id else {
            return
        }

        dispatchGroup.enter()
        self.getProfile()

        dispatchGroup.enter()
        self.getPlayerRecords()

        dispatchGroup.notify(queue: .global()) {
            self.requestPlayerNewsfeed()
        }
    }

    func requestPlayerNewsfeed() {
        self.dispatchGroup.enter()
        self.getPlayerNewsfeed()

        dispatchGroup.notify(queue: .main) {
            self.isLoading = false
        }
    }

    func getProfile() {
        Task {
            do {
                profile = try await NetworkManager.shared.getProfile(with: profile.username)
                leagueStats = profile.leagueStats
                self.dispatchGroup.leave()
            } catch {
                print(error)
                throw error
            }
        }
    }

    func getPlayerRecords() {
        Task {
            do {
                let recordLog = try await NetworkManager.shared.getRecords(with: profile.username)
                fortyLineRecord = recordLog.fortyLine
                blitzRecord = recordLog.blitz
                self.dispatchGroup.leave()
            } catch {
                print(error)
                throw error
            }
        }
    }

    func getPlayerNewsfeed() {
        Task {
            do {
                newsfeed = try await NetworkManager.shared.getPlayerNewsfeed(with: profile.id)
                self.dispatchGroup.leave()
            } catch {
                print(error)
                throw error
            }
        }
    }

}
