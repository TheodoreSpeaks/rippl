//
//  LeaderboardSelectionView.swift
//  Rippl
//
//  Created by Rahil Patel on 1/26/20.
//  Copyright © 2020 Rippl. All rights reserved.
//

import SwiftUI

struct LeaderboardSelectionView: View {
    var users: [User]
    var body: some View {
        List {
            ForEach(self.users, id: \.id) { user in
                LeaderboardCell(user: user)
            }
        }
    }
}

struct LeaderboardSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardSelectionView(users: [])
    }
}
