//
//  ServerInfo.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 10/27/23.
//

import Foundation

struct ServerInfo: Codable {
    let userCount: Int
    let anonCount: Int
    let totalAccounts: Int
    let totalReplays: Int
    let rankedAccounts: Int

    let gamesPlayed: Int
    let gameTime: Float
    let piecesPlaced: Int
    let keyPresses: Int

    private enum CodingKeys: String, CodingKey {
        case userCount = "usercount"
        case anonCount = "anoncount"
        case totalAccounts = "totalaccounts"
        case totalReplays = "replaycount"
        case rankedAccounts = "rankedcount"
        case gamesPlayed = "gamesplayed"
        case gameTime = "gametime"
        case piecesPlaced = "piecesplaced"
        case keyPresses = "inputs"
    }
}
