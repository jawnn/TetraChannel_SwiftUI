//
//  VerticalDataCell.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 11/8/23.
//

import SwiftUI

struct VerticalDataCell: View {
    let header: String
    let data: String

    var body: some View {
        VStack {
            Text(header)
                .font(.caption)
                .foregroundColor(.secondary)
            Text("\(data)")
                .bold()
        }
    }
}

struct VerticalDataCell_Previews: PreviewProvider {
    static var previews: some View {
        VerticalDataCell(header: "header", data: "data")
    }
}
