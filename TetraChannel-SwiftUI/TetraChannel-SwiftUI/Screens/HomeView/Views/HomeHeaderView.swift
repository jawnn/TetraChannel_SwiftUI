//
//  HomeHeaderView.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 11/1/23.
//

import SwiftUI

struct HomeHeaderView: View {
    let gamesPlayed: Int
    let userCount: Int

    var body: some View {
        VStack() {
            Text("\(gamesPlayed)")
                .modifier(BoldLargeTitle())
            Text("games played by \(userCount) players")
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView(gamesPlayed: MockData.serverInfo.gamesPlayed, userCount: MockData.serverInfo.userCount)
    }
}
