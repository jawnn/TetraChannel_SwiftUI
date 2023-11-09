    //
    //  ProfileView.swift
    //  TetraChannel-SwiftUI
    //
    //  Created by Roberto Manese III on 10/27/23.
    //

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()

    var body: some View {
        ZStack {
            NavigationView {
                List {
                    VStack(alignment: .leading) {
                        Text(viewModel.profile.username)
                            .modifier(BoldLargeTitle(color: Color.brandInverse))
                        Text("Joined \(viewModel.profile.accountCreationDate!.timeElapsedSince())")
                            .modifier(SemiBoldSubHeadline())
                        Text("Played for \(viewModel.profile.gameTime.durationInHours()) hours")
                            .modifier(SemiBoldSubHeadline())

                        Spacer()

                        HorizontalDivider()

                        HStack(alignment: .center) {
                            VerticalDataCell(header: "XP", data: viewModel.profile.xp.toString(decimalDigits: 0))
                            Spacer()
                            VerticalDataCell(header: "Wins", data: viewModel.profile.gamesWon.formatted())
                            Spacer()
                            VerticalDataCell(header: "Total Games", data: viewModel.profile.gamesPlayed.formatted())
                        }
                        Spacer()
                    }

                    Section("Latest Achievements") {
                        ForEach(viewModel.newsfeed) { newsArticle in
                            NewsListCell(newsArticle: newsArticle)
                        }
                    }

                    Section("40 Lines") {
                        if let fortyLineRecord = viewModel.fortyLineRecord.record {
                            PersonalBestView(record: fortyLineRecord)
                        } else {
                            Text("Never played")
                                .modifier(BoldLargeTitle(color: Color.brandInverse))
                        }
                    }

                    Section("Blitz") {
                        if let blitzRecord = viewModel.blitzRecord.record {
                            PersonalBestView(record: blitzRecord)
                        } else {
                            Text("Never played")
                                .modifier(BoldLargeTitle(color: Color.brandInverse))
                        }
                    }
                }
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

