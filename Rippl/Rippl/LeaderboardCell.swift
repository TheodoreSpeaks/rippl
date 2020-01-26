//
//  LeaderboardCell.swift
//  Rippl
//
//  Created by Rahil Patel on 1/26/20.
//  Copyright © 2020 Rippl. All rights reserved.
//

import SwiftUI

struct LeaderboardCell: View {
    @State var user: User
    var body: some View {
        HStack {
            user.image.cornerRadius(32)
            VStack {
                HStack {
                    Text("\(user.name)").font(Font.custom("Avenir", size: 17)).foregroundColor(.black)
                    Spacer()
                    Text("\(Int(user.progress)) gal").font(Font.custom("Avenir", size: 17)).foregroundColor(Color("Green"))
                }
                ProgressBar(value: Binding(get: {
                    self.user.progress/self.user.total
                }, set: { newVal in
                    self.user.progress = newVal * self.user.total
                }))
            }
        }
    }
}

struct LeaderboardCell_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardCell(user: User(id: UUID(), name: "Christina Morillo", image: Image("stock_christina"), progress: 2900, total: 5000))
    }
}
