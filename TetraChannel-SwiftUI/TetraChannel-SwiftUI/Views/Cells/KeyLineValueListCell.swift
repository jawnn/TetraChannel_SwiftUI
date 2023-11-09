//
//  KeyLineValueListCell.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 11/1/23.
//

import SwiftUI

struct KeyLineValueListCell: View {
    var key: String
    var value: String

    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)

            HStack {
                Text(key)
                    .foregroundColor(.primary)
                    .font(.headline)
                    .scaledToFit()
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
                    .padding(.leading, 8)
                Spacer()
                Text(value)
                    .foregroundColor(.primary)
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                    .scaledToFit()
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
                    .padding(.trailing, 8)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct KeyLineValueListCell_Previews: PreviewProvider {
    static var previews: some View {
        KeyLineValueListCell(key: "Total players", value: 2340897190487.formatted())
    }
}
