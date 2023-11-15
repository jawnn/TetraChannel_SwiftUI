//
//  MockData.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 11/8/23.
//

import Foundation

struct MockData {}

// MARK: Server Info
extension MockData {
    static let serverInfo = ServerInfo(userCount: 9167124, anonCount: 7088809, totalAccounts: 13141006, totalReplays: 11710351, rankedAccounts: 48002, gamesPlayed: 521293409, gameTime: 90955662838.23929, piecesPlaced: 72921639166, keyPresses: 318369564072)
}


// MARK: Newsfeed
extension MockData {
    static let newsfeed: [NewsArticle] = [
        NewsArticle(id: "653f0f27df8c3df6ac68b51c", type: "leaderboard", stream: "global", publishDate: "2023-09-27T02:44:12.801Z", data: NewsData(username: "rtxile", gameType: "blitz", rank: Rank.int(1), result: 1919248, replayId: "mKwlctVoc", type: "leaderboard", label: "lol"))
    ]
}

// MARK: Leaderboard
extension MockData {
    static let xpPlayer1 = XpRankedPlayer(id: "1", username: "Blitz", role: "user", xp: 54353708.5, supporter: true, verified: true, country: "US", accountCreationDate: "", gamesPlayed: 100, gamesWon: 99, gameTime: 90955662838.23929)

    static let xpPlayer2 = XpRankedPlayer(id: "2", username: "Blitz2", role: "user", xp: 54351233.5, supporter: true, verified: true, country: "US", accountCreationDate: "", gamesPlayed: 199, gamesWon: 99, gameTime: 90955662838.23929)

    static let leaguePlayer1 = LeagueRankedPlayer(id: "1", username: "League", role: "user", xp: 888, supporter: true, verified: true, league: MockData.league)

    static let leaguePlayer2 = LeagueRankedPlayer(id: "2", username: "League 2", role: "user", xp: 888, supporter: true, verified: true, league: MockData.league)

    static let league = League(gamesPlayed: 100, gamesWon: 44, rating: 999, glicko: 1200, rd: 2, letterRank: "X", bestRank: "X", apm: 200, pps: 300, vs: 2, decaying: true, standing: 222, percentile: 0.004616670148318363, localStanding: 2)

    static let xpLeaderboard: [XpRankedPlayer] = [ MockData.xpPlayer1, MockData.xpPlayer2]

    static let leagueLeaderboard: [LeagueRankedPlayer] = [ MockData.leaguePlayer1, MockData.leaguePlayer2]
}

// MARK: Profile
extension MockData {
    static let profile = Profile(id: "61bd0565b25f3e0372d7cc0c", username: "tumbleweed43", role: "user", xp: 389472.34, verified: true, accountCreationDate: "2023-10-14T21:39:09.146Z", gamesPlayed: 123, gamesWon: 59, gameTime: 283723.23211, bio: "here", badges: [], friendCount: 11, leagueStats: MockData.league)
}

// MARK: Record
extension MockData {
    static let fortyLineRecordEntry = RecordEntry(record: MockData.fortyLineRecord, rank: 14)
    static let blitzRecordEntry = RecordEntry(record: MockData.blitzRecord, rank: 14)

    static let fortyLineRecord = Record(id: "001", data: RecordData(seed: 0, lines: 40, levelLines: 0, levelLinesNeeded: 1, inputs: 269, holds: 9, score: 13712, zenLevel: 0, zenProgress: 0, level: 0, combo: 0, currentComboPower: 0, tspins: 0, piecesPlaced: 0, clears: Clears(singles: 0, doubles: 2, triples: 0, quads: 9, pentas: 0, realTspins: 0, miniTspins: 0, miniTspinSingles: 0, tspinSingles: 0, miniTspinDoubles: 0, tspinDoubles: 0, tspinTriples: 0, tspinQuads: 0, tspinPentas: 0, allClear: 0), garbage: Garbage(sent: 0, received: 0, attack: 0, cleared: 0), finesse: Finesse(combo: 0, faults: 0, perfectPieces: 0), kills: 0, finalTime: 15315, gameType: "40l"), isMulti: true, replayId: "", stream: "global", publishDate: "2022-08-03T05:12:42.848Z")

    static let blitzRecord = Record(id: "002", data: RecordData(seed: 0, lines: 45, levelLines: 10, levelLinesNeeded: 13, inputs: 494, holds: 9, score: 45328, zenLevel: 0, zenProgress: 0, level: 0, combo: 0, currentComboPower: 0, tspins: 0, piecesPlaced: 0, clears: Clears(singles: 7, doubles: 1, triples: 0, quads: 9, pentas: 0, realTspins: 0, miniTspins: 0, miniTspinSingles: 0, tspinSingles: 0, miniTspinDoubles: 0, tspinDoubles: 0, tspinTriples: 0, tspinQuads: 0, tspinPentas: 0, allClear: 0), garbage: Garbage(sent: 0, received: 0, attack: 0, cleared: 0), finesse: Finesse(combo: 0, faults: 0, perfectPieces: 0), kills: 0, finalTime: 15315, gameType: "blitz"), isMulti: true, replayId: "", stream: "global", publishDate: "2022-08-03T05:12:42.848Z")
}
