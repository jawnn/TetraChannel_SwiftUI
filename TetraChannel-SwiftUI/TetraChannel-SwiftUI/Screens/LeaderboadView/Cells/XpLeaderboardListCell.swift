//
//  XpLeaderboardListCell.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 11/1/23.
//

import SwiftUI

struct XpLeaderboardListCell: View {
    let player: XpRankedPlayer
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


            
            Text(player.gamesPlayed == -1 ? "private" : "\(player.gamesPlayed)")
                .frame(alignment: .leading)
                .foregroundColor(.secondary)

            Text(player.xp.toString(decimalDigits: 0))
                .modifier(RankText())
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 16)
        }
    }
}

struct XpLeaderboardListCell_Previews: PreviewProvider {
    static var previews: some View {
        XpLeaderboardListCell(player: MockData.xpPlayer1, rank: 1)
    }
}
