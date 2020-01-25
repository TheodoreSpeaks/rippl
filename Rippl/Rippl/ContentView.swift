//
//  ContentView.swift
//  Rippl
//
//  Created by Rahil Patel on 1/25/20.
//  Copyright © 2020 Rippl. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userDataModel: UserDataModel
    var body: some View {
        Group {
            if userDataModel.uid == nil {
                LoginView()
            } else {
                TabView {
                    LeaderboardView()
                        .tabItem({
                            Image(systemName: "chart.bar")
                        })
                    .tag(0)
                    CaptureView()
                        .tabItem({
                            Image(systemName: "barcode.viewfinder")
                        })
                    .tag(1)
                    ProfileView()
                        .tabItem({
                            Image(systemName: "person")
                        })
                    .tag(2)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
