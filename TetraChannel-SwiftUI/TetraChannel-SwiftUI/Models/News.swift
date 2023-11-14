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

    var name: String {
        switch self {
        case .fortyLine:
            return "40L"
        case .blitz:
            return "Blitz"
        }
    }
}

enum NewsArticleType: String {
    case badge = "badge"
    case leaderboard = "leaderboard"
    case personalBest = "personalbest"
    case rankUp = "rankup"
    case none = "none"
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

    var timeElapsed: String {
        return publishDate.timeElapsedSince()
    }

    var articleType: NewsArticleType {
        return NewsArticleType(rawValue: type) ?? .none
    }

    var badgeTitle: String {
        return data.label ?? "noname"
    }

    var numberRank: Int {
        guard let rank = data.rank?.value as? Int else {
            return -1
        }
        return rank
    }

    var letterRank: String {
        guard let rank = data.rank?.value as? String else {
            return "-1"
        }
        return rank
    }

    var gameType: GameType {
        guard let type = data.gameType else {
            return .fortyLine
        }
        return GameType(rawValue: type) ?? .fortyLine
    }

    var result: Float {
        return data.result ?? 0.0
    }

    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case publishDate = "ts"
        case type, stream, data
    }

}

enum Rank: Codable {
    case int(Int)
    case string(String)

    var value: Any {
        switch self {
        case .int(let value):
            return value
        case .string(let value):
            return value
        }
    }
}

struct NewsData: Codable {
    let username: String?
    let gameType: String?
    let rank: Rank?
    let result: Float?
    let replayId: String?
    let type: String?
    let label: String?

    private enum CodingKeys: String, CodingKey {
        case username, rank, result, type, label
        case gameType = "gametype"
        case replayId = "replayid"
    }

    init(username: String, gameType: String, rank: Rank, result: Float, replayId: String, type: String, label: String) {
        self.username = username
        self.gameType = gameType
        self.rank = rank
        self.result = result
        self.replayId = replayId
        self.type = type
        self.label = label
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.username = try? container.decode(String.self, forKey: .username)
        self.gameType = try? container.decode(String.self, forKey: .gameType)

        if let value = try? container.decodeIfPresent(Int.self, forKey: .rank) {
            self.rank = .int(value)
        } else if let value = try? container.decodeIfPresent(String.self, forKey: .rank) {
            self.rank = .string(value)
        } else {
            self.rank = nil
        }

        self.result = try? container.decode(Float.self, forKey: .result)
        self.replayId = try? container.decode(String.self, forKey: .replayId)
        self.type = try? container.decode(String.self, forKey: .type)
        self.label = try? container.decode(String.self, forKey: .label)
    }
}
