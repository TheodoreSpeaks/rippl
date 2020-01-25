//
//  ProfileSummaryView.swift
//  Rippl
//
//  Created by Rahil Patel on 1/25/20.
//  Copyright © 2020 Rippl. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct ProfileSummaryView: View {
    var timeInterval: String
    @EnvironmentObject var userDataModel: UserDataModel
    let chartStyle = ChartStyle(backgroundColor: .white, accentColor: Color("Green"), secondGradientColor: Color("Green"), textColor: .black, legendTextColor: .black)
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("THIS \(self.timeInterval)").font(Font.custom("Avenir", size: 11)).foregroundColor(.gray)
                    Spacer()
                }
                HStack {
                    Text("\(userDataModel.getTotal(for: timeInterval)) gal").font(Font.custom("Avenir", size: 17)).bold()
                    Spacer()
                }
            }
            LineView(data: userDataModel.getData(for: timeInterval), title: nil, style: chartStyle)
        }.padding()
    }
}

struct ProfileSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummaryView(timeInterval: "WEEK")
    }
}
