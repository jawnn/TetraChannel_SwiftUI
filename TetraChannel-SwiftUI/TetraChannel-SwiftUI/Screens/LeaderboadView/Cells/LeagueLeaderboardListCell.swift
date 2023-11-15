    //
    //  LeagueLeaderboardListCell.swift
    //  TetraChannel-SwiftUI
    //
    //  Created by Roberto Manese III on 11/1/23.
    //

import SwiftUI

struct LeagueLeaderboardListCell: View {

    let player: LeagueRankedPlayer
    let rank: Int

    var body: some View {

        HStack(alignment: .center) {
            Text("#\(rank)")
                .foregroundColor(.secondary)
                .frame(alignment: .leading)
                .padding(.leading, 16)
            Text(player.username)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()

            Text("\(player.league.gamesWon)")
                .frame(alignment: .leading)
                .foregroundColor(.secondary)
            Text("(\(player.league.winPercentage)%)")

            Spacer()

            Text(player.league.rating.toString(decimalDigits: 2))
                .modifier(RankText())
                .frame(alignment: .trailing)
                .padding(.trailing, 16)
        }
    }
}

struct LeagueLeaderboardListCell_Previews: PreviewProvider {
    static var previews: some View {
        LeagueLeaderboardListCell(player: MockData.leaguePlayer1, rank: 1)
    }
}
