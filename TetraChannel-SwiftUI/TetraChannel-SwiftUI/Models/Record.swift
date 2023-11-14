//
//  Record.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 11/2/23.
//

import Foundation

struct RecordResponse: Codable {
    let records: RecordLog
    let zen: Zen
}

struct Zen: Codable {
    let level: Int
    let score: Int
}

struct RecordLog: Codable {
    let fortyLine: RecordEntry
    let blitz: RecordEntry

    private enum CodingKeys: String, CodingKey {
        case blitz
        case fortyLine = "40l"
    }
}

struct RecordEntry: Codable {
    let record: Record?
    let rank: Int?
}

struct Record: Codable {
    let id: String
    let data: RecordData
    let isMulti: Bool
    let replayId: String
    let stream: String
    let publishDate: String

    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case data = "endcontext"
        case isMulti = "ismulti"
        case replayId = "replayid"
        case publishDate = "ts"
        case stream
    }
}

struct RecordData: Codable {
    let seed: Int
    let lines: Int
    let levelLines: Int
    let levelLinesNeeded: Int
    let inputs: Int
    let holds: Int
    let score: Int
    let zenLevel: Int
    let zenProgress: Int
    let level: Int
    let combo: Int
    let currentComboPower: Int
    let tspins: Int
    let piecesPlaced: Int
    let clears: Clears
    let garbage: Garbage
    let finesse: Finesse
    let kills: Int
    let finalTime: Float
    let gameType: String



    private enum CodingKeys: String, CodingKey {
        case seed
        case lines
        case levelLines = "level_lines"
        case levelLinesNeeded = "level_lines_needed"
        case inputs
        case holds
        case score
        case zenLevel = "zenlevel"
        case zenProgress = "zenprogress"
        case level
        case combo
        case currentComboPower = "currentcombopower"
        case tspins
        case piecesPlaced = "piecesplaced"
        case clears
        case garbage
        case finesse
        case kills
        case finalTime
        case gameType = "gametype"
    }
}

struct Clears: Codable {
    let singles: Int
    let doubles: Int
    let triples: Int
    let quads: Int
    let pentas: Int?
    let realTspins: Int
    let miniTspins: Int
    let miniTspinSingles: Int
    let tspinSingles: Int
    let miniTspinDoubles: Int
    let tspinDoubles: Int
    let tspinTriples: Int
    let tspinQuads: Int
    let tspinPentas: Int?
    let allClear: Int

    private enum CodingKeys: String, CodingKey {
        case singles, doubles, triples, quads, pentas
        case realTspins = "realtspins"
        case miniTspins = "minitspins"
        case miniTspinSingles = "minitspinsingles"
        case tspinSingles = "tspinsingles"
        case miniTspinDoubles = "minitspindoubles"
        case tspinDoubles = "tspindoubles"
        case tspinTriples = "tspintriples"
        case tspinQuads = "tspinquads"
        case tspinPentas = "tspinpentas"
        case allClear = "allclear"
    }
}

struct Garbage: Codable {
    let sent: Int
    let received: Int
    let attack: Int?
    let cleared: Int
}

struct Finesse: Codable {
    let combo: Int
    let faults: Int
    let perfectPieces: Int

    private enum CodingKeys: String, CodingKey {
        case combo, faults
        case perfectPieces = "perfectpieces"
    }
}
