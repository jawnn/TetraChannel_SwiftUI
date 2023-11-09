//
//  MetaData.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 10/27/23.
//

import Foundation

struct MetaData<T: Codable>: Codable {
    let success: Bool
    let error: String?
    let cache: CacheStub?
    let data: T
}

struct CacheStub: Codable {
    let status: String
    let cachedAt: Int
    let cachedUntil: Int

    private enum CodingKeys: String, CodingKey {
        case status
        case cachedAt = "cached_at"
        case cachedUntil = "cached_until"
    }
}
