//
//  HomeViewModel.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 10/27/23.
//

import SwiftUI

@MainActor final class HomeViewModel: ObservableObject {

    @Published var serverInfo = MockData.serverInfo
    @Published var newsfeed = MockData.newsfeed
    @Published var isLoading: Bool = true

    let dispatchGroup = DispatchGroup()

    func dispatchRequest() {
        guard serverInfo.gamesPlayed == MockData.serverInfo.gamesPlayed else {
            return
        }

        dispatchGroup.enter()
        self.getServerInfo()
        dispatchGroup.enter()
        self.getNewsfeed()

        dispatchGroup.notify(queue: .main) {
            self.isLoading = false
        }
    }

    func getServerInfo() {
        Task {
            do {
                serverInfo = try await NetworkManager.shared.getServerInfo()
                dispatchGroup.leave()
            } catch {
                if let apError = error as? APError {
                    throw apError
                }
                isLoading = false
            }
        }
    }

    func getNewsfeed() {
        Task {
            do {
                newsfeed = try await NetworkManager.shared.getNewsfeed()
                dispatchGroup.leave()
            } catch {
                if let apError = error as? APError {
                    throw apError
                }
                isLoading = false
            }
        }
    }
}
