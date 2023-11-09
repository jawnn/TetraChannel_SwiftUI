//
//  PersonalBestView.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 11/8/23.
//

import SwiftUI

struct PersonalBestView: View {
    var record: Record

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(record.data.gameType == "blitz" ? record.data.score.formatted() : record.data.finalTime.raceTime())
                    .modifier(BoldLargeTitle(color: Color.brandInverse))

//                if let ranked = record.rank {
//                    Text("\(ranked)")
//                        .modifier(BorderedCaption())
//                }
            }
            Text("Achieved \(record.publishDate.timeElapsedSince())")
                .modifier(SemiBoldSubHeadline())

            HorizontalDivider()

            HStack {
                VerticalDataCell(header: "Pieces", data: record.data.piecesPlaced.formatted())

                Spacer()

                VerticalDataCell(header: "Holds", data: record.data.holds.formatted())

                Spacer()

                VerticalDataCell(header: "Quads", data: record.data.clears.quads.formatted())
            }
        }
    }
}

struct PersonalBestView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalBestView(record: MockData.fortyLineRecord)
    }
}
