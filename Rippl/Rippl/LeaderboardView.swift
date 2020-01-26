//
//  LeaderboardView.swift
//  Rippl
//
//  Created by Rahil Patel on 1/25/20.
//  Copyright © 2020 Rippl. All rights reserved.
//

import SwiftUI

struct LeaderboardView: View {
    @EnvironmentObject var userDataModel: UserDataModel
    @State var selectedTab = 0
    var selections = ["FRIENDS", "LOCAL", "GLOBAL"]
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                Picker("", selection: $selectedTab) {
                    ForEach(0 ..< selections.count) { index in
                        Text(self.selections[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                .font(Font.custom("Avenir", size: 17))
                .padding(.top)
                    .navigationBarTitle("Leaderboard")
                LeaderboardSelectionView(users: userDataModel.getList(for: selections[selectedTab])).padding(5)
                Spacer()
            }
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
