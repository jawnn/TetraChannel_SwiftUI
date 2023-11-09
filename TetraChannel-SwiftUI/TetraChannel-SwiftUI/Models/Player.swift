//
//  Player.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 10/31/23.
//

import Foundation

protocol PlayerInfo: Identifiable {
    var id: String { get set }
    var username: String { get set }
    var role: String { get set }
    var xp: Float { get set }
    var supporter: Bool? { get set }
    var verified: Bool { get set }
    var country: String? { get set }
}

struct ProfileResponse: Codable {
    let profile: Profile

    private enum CodingKeys: String, CodingKey {
        case profile = "user"
    }
}

struct Profile: Codable, PlayerInfo {
    var id: String
    var username: String
    var role: String
    var xp: Float
    var supporter: Bool?
    var verified: Bool
    var country: String?

    let accountCreationDate: String?
    let gamesPlayed: Int
    let gamesWon: Int
    let gameTime: Float

    let bio: String?
    let badges: [Badge]
    let friendCount: Int

    let leagueStats: League

    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case accountCreationDate = "ts"
        case gamesPlayed = "gamesplayed"
        case gamesWon = "gameswon"
        case gameTime = "gametime"
        case friendCount = "friend_count"
        case leagueStats = "league"
        case username, role, xp, supporter, verified, country, bio, badges

    }
}

struct Badge: Codable {
    let id: String
    let label: String
    let group: String?
    let publishDate: String?

    private enum CodingKeys: String, CodingKey {
        case publishDate = "ts"
        case id, label, group
    }
}

