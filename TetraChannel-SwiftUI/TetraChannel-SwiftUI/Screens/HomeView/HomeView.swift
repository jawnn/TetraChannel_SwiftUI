import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var body: some View {
        ZStack {
            NavigationView {

                VStack {

                    List {
                        HomeHeaderView(gamesPlayed: viewModel.serverInfo.gamesPlayed,
                                       userCount: viewModel.serverInfo.userCount)
                        .listRowSeparator(.hidden)

                        Section("Server Stats") {
                            KeyLineValueListCell(key: "Total Players",
                                                 value: viewModel.serverInfo.userCount.formatted())
                            KeyLineValueListCell(key: "Ranked Players",
                                                 value: viewModel.serverInfo.rankedAccounts.formatted())
                            KeyLineValueListCell(key: "Replays Stored",
                                                 value: viewModel.serverInfo.totalReplays.formatted())
                            KeyLineValueListCell(key: "Pieces Dropped",
                                                 value: viewModel.serverInfo.piecesPlaced.formatted())
                            KeyLineValueListCell(key: "Keypresses",
                                                 value: viewModel.serverInfo.keyPresses.formatted())
                        }
                        .listRowSeparatorTint(.brandPrimary)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

                        Section("Time Played") {
                            let gameTime = viewModel.serverInfo.gameTime
                            KeyLineValueListCell(key: "Hours",
                                                 value: gameTime.durationInHours())
                            KeyLineValueListCell(key: "Days",
                                                 value: gameTime.durationInDays())
                            KeyLineValueListCell(key: "Years",
                                                 value: gameTime.durationInYears())
                        }
                        .listRowSeparatorTint(.brandPrimary)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

                        Section("Latest News") {
                            ForEach(viewModel.newsfeed) { newsArticle in
                                NewsListCell(newsArticle: newsArticle)
                            }
                        }
                        .listRowSeparatorTint(.brandPrimary)
                        .listRowInsets(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))

                    }
                    .listStyle(.grouped)
                    .navigationTitle("Tetra Channel")
                    .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.inline)
                }
            }
            .task {
                viewModel.dispatchRequest()
            }

            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

