//
//  LeaderboardView.swift
//  TetraChannel-SwiftUI
//
//  Created by Roberto Manese III on 10/27/23.
//

import SwiftUI

struct LeaderboardView: View {
    @StateObject var viewModel = LeaderboardViewModel()
    @State var selectedLeaderboard = 0
    var rankCount: Int = 1

    var body: some View {
        ZStack {
            NavigationView {
                VStack{

                    Picker(selection: $selectedLeaderboard) {
                        Text("League").tag(0)
                        Text("XP").tag(1)
                    } label: {
                        Text("LABEL")
                    }
                    .padding([.leading, .trailing, .bottom])
                    .pickerStyle(.segmented)

                    if (selectedLeaderboard == 0) {
                        List {
                            Section {
                                ForEach(Array(viewModel.leagueLeaderboard.enumerated()), id: \.offset) { offset, rankedPlayer in
                                    LeagueLeaderboardListCell(player: rankedPlayer, rank: offset + 1)
                                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                }
                            } header: {
                                Text("[rank, name, wins(%), rating]")
                            }
                        }
                        .listStyle(.grouped)
                    } else {
                        List {
                            Section {
                                ForEach(Array(viewModel.xpLeaderboard.enumerated()), id: \.offset) { offset, rankedPlayer in
                                    XpLeaderboardListCell(player: rankedPlayer, rank: offset + 1)
                                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                                }
                            } header: {
                                Text("[rank, play counter, XP]")
                            }
                        }
                        .listStyle(.grouped)
                    }

                    Spacer()

                }
                .navigationTitle("Leaderboard")
                .task {
                    viewModel.dispatchRequest()
                }
            }

            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
