//
//  NetworkManager.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 10/27/23.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}

final class NetworkManager {

    static let shared = NetworkManager()

    static let baseURL = "https://ch.tetr.io/api/"
    private let serverInfoURL = baseURL + "general/stats"
    private let newsfeedURL = baseURL + "news/"
    private let xpLeaderboardURL = baseURL + "users/lists/xp?limit=50"
    private let leagueLeaderboardURL = baseURL + "users/lists/league?limit=50"
    private let profileURL = baseURL + "users/"

    func getServerInfo() async throws -> ServerInfo {
        guard let url = URL(string: serverInfoURL) else {
            throw APError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        do {
            return try JSONDecoder().decode(MetaData<ServerInfo>.self, from: data).data
        } catch {
            throw APError.invalidData
        }

    }

    func getNewsfeed() async throws -> [NewsArticle] {
        guard let url = URL(string: newsfeedURL + "global") else {
            throw URLError(.badURL)
        }

        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        do {
            return try JSONDecoder().decode(MetaData<NewsResponse>.self, from: data).data.news
        } catch {
            print(error)
            throw error
        }
    }

    func getPlayerNewsfeed(with userId: String) async throws -> [NewsArticle] {
        guard let url = URL(string: newsfeedURL + "user_\(userId)" + "?limit=3") else {
            throw URLError(.badURL)
        }

        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        do {
            return try JSONDecoder().decode(MetaData<NewsResponse>.self, from: data).data.news
        } catch {
            print(error)
            throw error
        }
    }

    func getXpLeaderboard() async throws -> [XpRankedPlayer] {
        guard let url = URL(string: xpLeaderboardURL) else {
            throw URLError(.badURL)
        }

        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        do {
            return try JSONDecoder().decode(MetaData<LeaderboardResponse<XpRankedPlayer>>.self, from: data).data.leaderboard
        } catch {
            print(error)
            throw error
        }

    }

    func getLeagueLeaderboard() async throws -> [LeagueRankedPlayer] {
        guard let url = URL(string: leagueLeaderboardURL) else {
            throw URLError(.badURL)
        }

        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        do {
            return try JSONDecoder().decode(MetaData<LeaderboardResponse<LeagueRankedPlayer>>.self, from: data).data.leaderboard
        } catch {
            print(error)
            throw error
        }

    }

    func getProfile(with username: String) async throws -> Profile {
        guard let url = URL(string: profileURL + username) else {
            throw URLError(.badURL)
        }

        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        do {
            return try JSONDecoder().decode(MetaData<ProfileResponse>.self, from: data).data.profile
        } catch {
            print(error)
            throw error
        }
    }

    func getRecords(with username: String) async throws -> RecordLog {
        guard let url = URL(string: profileURL + username + "/records") else {
            throw URLError(.badURL)
        }

        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        do {
            return try JSONDecoder().decode(MetaData<RecordResponse>.self, from: data).data.records
        } catch {
            print(error)
            throw error
        }
    }

}
