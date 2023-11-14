    //
    //  NewsListCell.swift
    //  TetraChannel-SwiftUI
    //
    //  Created by Roberto Manese III on 11/8/23.
    //

import SwiftUI

struct NewsListCell: View {
    var newsArticle: NewsArticle

    var body: some View {

        switch newsArticle.articleType {
        case .badge:
            Text(newsArticle.data.username ?? "null")
                .fontWeight(.semibold)
                .foregroundColor(Color.brandInverse)
            +
            Text(" earned the ")
            +
            Text(newsArticle.badgeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color.brandInverse)
            +
            Text("\n" + newsArticle.timeElapsed)
                .font(.caption)
                .foregroundColor(.secondary)
        case .leaderboard:
            switch newsArticle.gameType {
            case .fortyLine:
                Text(newsArticle.data.username ?? "null")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.brandInverse)
                +
                Text(" earned #")
                +
                Text("\(newsArticle.numberRank)")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.brandInverse)
                +
                Text(" in \(newsArticle.gameType.rawValue) with a time of ")
                +
                Text(newsArticle.result.raceTime())
                    .fontWeight(.semibold)
                    .foregroundColor(Color.brandInverse)
                +
                Text("\n" + newsArticle.timeElapsed)
                    .font(.caption)
                    .foregroundColor(.secondary)

            case .blitz:
                Text(newsArticle.data.username ?? "null")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.brandInverse)
                +
                Text(" earned #")
                +
                Text("\(newsArticle.numberRank)")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.brandInverse)
                +
                Text(" in \(newsArticle.gameType.rawValue) with a time of ")
                +
                Text(newsArticle.result.formatted())
                    .fontWeight(.semibold)
                    .foregroundColor(Color.brandInverse)
                +
                Text("\n" + newsArticle.timeElapsed)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        case .personalBest:
            switch newsArticle.gameType {
            case .fortyLine:
                Text(newsArticle.data.username ?? "null")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.brandInverse)
                +
                Text(" got a new personal best in \(newsArticle.gameType.name) with a time of ")
                +
                Text(newsArticle.result.raceTime())
                    .fontWeight(.semibold)
                    .foregroundColor(Color.brandInverse)
                +
                Text("\n" + newsArticle.timeElapsed)
                    .font(.caption)
                    .foregroundColor(.secondary)

            case .blitz:
                Text(newsArticle.data.username ?? "null")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.brandInverse)
                +
                Text(" got a new personal best in \(newsArticle.gameType.name) with a score of ")
                +
                Text(newsArticle.result.formatted())
                    .fontWeight(.semibold)
                    .foregroundColor(Color.brandInverse)
                +
                Text("\n" + newsArticle.timeElapsed)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        case .rankUp:
            Text(newsArticle.data.username ?? "null")
                .fontWeight(.semibold)
                .foregroundColor(Color.brandInverse)
            +
            Text(" achieved a rank of ")
            +
            Text(newsArticle.letterRank.capitalized)
                .fontWeight(.semibold)
                .foregroundColor(Color.brandInverse)
            +
            Text("\n" + newsArticle.timeElapsed)
                .font(.caption)
                .foregroundColor(.secondary)
        case .none:
            Text("")
        }
    }
}

struct NewsListCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsListCell(newsArticle: MockData.newsfeed.first!)
    }
}
