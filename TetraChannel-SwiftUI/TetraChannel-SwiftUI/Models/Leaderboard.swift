//
//  Leaderboard.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 10/31/23.
//

import Foundation

struct LeaderboardResponse<T: Codable>: Codable {
    let leaderboard: [T]

    private enum CodingKeys: String, CodingKey {
        case leaderboard = "users"
    }
}

struct XpRankedPlayer: Codable, Identifiable, PlayerInfo {
    var id: String
    var username: String
    var role: String
    var xp: Float
    var supporter: Bool?
    var verified: Bool
    var country: String?

    let accountCreationDate: String
    let gamesPlayed: Int
    let gamesWon: Int
    let gameTime: Float

    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case accountCreationDate = "ts"
        case gamesPlayed = "gamesplayed"
        case gamesWon = "gameswon"
        case gameTime = "gametime"
        case username, role, xp, supporter, verified, country
    }

}

struct LeagueRankedPlayer: Codable, Identifiable, PlayerInfo {
    var id: String
    var username: String
    var role: String
    var xp: Float
    var supporter: Bool?
    var verified: Bool
    var country: String?
    let league: League

    var winPercentage: Float {
        return (Float(league.gamesWon) / Float(league.gamesPlayed)) * 100
    }

    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username, role, xp, supporter, verified, country, league
    }
}

struct League: Codable {
    let gamesPlayed: Int
    let gamesWon: Int
    let rating: Float
    let glicko: Float?
    let rd: Float?
    let rank: String
    let bestRank: String?
    let apm: Float?
    let pps: Float?
    let vs: Float?
    let decaying: Bool

    let standing: Int?
    let percentile: Float?
    let localStanding: Int?

    private enum CodingKeys: String, CodingKey {
        case gamesPlayed = "gamesplayed"
        case gamesWon = "gameswon"
        case bestRank = "bestrank"
        case rating, glicko, rd, rank, apm, pps, vs, decaying
        case localStanding = "standing_local"
        case standing, percentile
    }
}
