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
        Text(newsArticle.data.username ?? "null")
            .fontWeight(.semibold)
            .foregroundColor(Color.brandInverse)
        +
        Text(newsArticle.generateHeadline())
            .font(.subheadline)
        +
        Text("\n\(newsArticle.publishDate.timeElapsedSince())")
            .font(.caption)
            .foregroundColor(.secondary)
    }
}

struct NewsListCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsListCell(newsArticle: MockData.newsfeed.first!)
    }
}
