    //
    //  LeagueStatsView.swift
    //  TetraChannel-SwiftUI
    //
    //  Created by Roberto Manese III on 11/14/23.
    //

import SwiftUI

struct LeagueStatsView: View {
    var leagueStats: League

    var body: some View {
        if leagueStats.rating != -1 {
            VStack {
                HStack(alignment: .center) {
                    VerticalDataCell(header: "Rank", data: leagueStats.letterRank.capitalized)
                        .modifier(BorderedCaption())
                    VerticalDataCell(header: "Rating", data: leagueStats.rating.toString(decimalDigits: 2))
                        .modifier(BorderedCaption())
                    Spacer()
                    VerticalDataCell(header: "Global", data: "#\(leagueStats.ranking)")
                        .modifier(BorderedCaption())
                    VerticalDataCell(header: "Region", data: "#\(leagueStats.localRanking)")
                        .modifier(BorderedCaption())
                }
                .frame(height: 50)
                VStack {
                    VStack(alignment: .leading, spacing: 2) {
                        HStack {
                            Text("Record")
                                .foregroundColor(.secondary)
                            Text("\(leagueStats.gamesWon) - \(leagueStats.gamesLoss) (\(leagueStats.winPercentage)%)")
                                .frame(maxWidth: .infinity, alignment: .trailing)

                        }
                        HStack {
                            Text("Percentile")
                                .foregroundColor(.secondary)
                            Text("\(leagueStats.topPercentile) (top \(leagueStats.percentileRank)%)")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        HStack {
                            Text("Top Rank")
                                .foregroundColor(.secondary)
                            Text(leagueStats.bestRank?.capitalized ?? "z")
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    HorizontalDivider()
                    HStack {
                        VerticalDataCell(header: "APM", data: "\(leagueStats.apm ?? -1)")
                        Spacer()
                        VerticalDataCell(header: "PPS", data: "\(leagueStats.pps ?? -1)")
                        Spacer()
                        VerticalDataCell(header: "VS", data: "\(leagueStats.vs ?? -1)")
                    }
                }
            }
            .bold()
        } else {
            Text("Never played")
                .modifier(BoldLargeTitle(color: Color.brandInverse))
        }
    }
}

struct LeagueStatsView_Previews: PreviewProvider {
    static var previews: some View {
        LeagueStatsView(leagueStats: MockData.league)
    }
}
