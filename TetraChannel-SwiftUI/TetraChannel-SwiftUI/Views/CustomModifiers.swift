//
//  CustomModifiers.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 11/2/23.
//

import SwiftUI

struct BoldLargeTitle: ViewModifier {

    var color: Color?

    func body(content: Content) -> some View {
        content
            .bold()
            .font(.largeTitle)
            .foregroundColor(color == nil ? .primary : color)
    }
}

struct RankText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .foregroundColor(Color.brandInverse)
            .scaledToFit()
            .minimumScaleFactor(0.01)
            .lineLimit(1)
    }
}

struct PersonalBestText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .bold()
            .font(.largeTitle)
            .foregroundColor(.brandInverse)
    }
}

struct BorderedCaption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1)
            )
            .foregroundColor(Color.brandPrimary)
    }
}

struct SemiBoldSubHeadline: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.semibold)
            .font(.subheadline)
    }
}
