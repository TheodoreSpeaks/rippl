//
//  ProfileView.swift
//  Rippl
//
//  Created by Rahil Patel on 1/25/20.
//  Copyright © 2020 Rippl. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @State var selectedTab = 0
    var selections = ["WEEK", "MONTH", "YEAR"]
    var body: some View {
        NavigationView {
            VStack {
                ProfileHeaderView()
                    .frame(height: 100)
                Picker("", selection: $selectedTab) {
                    ForEach(0 ..< selections.count) { index in
                        Text(self.selections[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                .font(Font.custom("Avenir", size: 17))
                .padding(.top)
                
                ProfileSummaryView(timeInterval: selections[selectedTab])
                Spacer()
            }
            .navigationBarTitle("Profile")
            .navigationBarItems(leading: EditButton(), trailing: SettingsButton())
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
