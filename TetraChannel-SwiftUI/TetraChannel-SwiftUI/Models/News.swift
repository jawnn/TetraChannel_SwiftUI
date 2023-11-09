//
//  News.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 10/30/23.
//

import Foundation

enum GameType: String {
    case fortyLine = "40l"
    case blitz = "blitz"
}

enum NewsArticleType: String {
    case badge = "badge"
    case leaderboard = "leaderboard"
    case personalBest = "personalbest"
}

struct NewsResponse: Codable {
    let news: [NewsArticle]
}

struct NewsArticle: Codable, Identifiable {
    let id: String
    let type: String
    let stream: String
    let publishDate: String
    let data: NewsData

    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case publishDate = "ts"
        case type, stream, data
    }

    func generateHeadline() -> String {
        guard let articleType = NewsArticleType(rawValue: type),
              let username = data.username else {
            return ""
        }

        switch articleType {
        case .personalBest:
            if let gameType = data.gameType, let result = data.result {
                switch GameType(rawValue: gameType) {
                case .fortyLine:
                    return " got a new personal best in \(gameType.uppercased()) with a time of \(result.raceTime())"
                case .blitz:
                    return " got a new personal best in \(gameType.uppercased()) with a score of \(result.formatted())"
                default:
                    return ""
                }
            }
        case .leaderboard:
            if let gameType = data.gameType, let rank = data.rank, let result = data.result {
                switch GameType(rawValue: gameType) {
                case .fortyLine:
                    return " earned #\(rank) in \(gameType.uppercased()) with a time of \(result.raceTime())"
                case .blitz:
                    return " earned #\(rank) in \(gameType.uppercased()) with a score of \(result.formatted())"
                default:
                    return ""
                }
            }
        case .badge:
            if let badgeTitle = data.label {
                return "\(username) earned the \(badgeTitle) badge."
            }

        }

        return ""
    }
}

struct NewsData: Codable {
    let username: String?
    let gameType: String?
    let rank: Int?
    let result: Float?
    let replayId: String?
    let type: String?
    let label: String?

    private enum CodingKeys: String, CodingKey {
        case username, rank, result, type, label
        case gameType = "gametype"
        case replayId = "replayid"
    }
}
