//
//  ProfileHeaderView.swift
//  Rippl
//
//  Created by Rahil Patel on 1/25/20.
//  Copyright © 2020 Rippl. All rights reserved.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack {
            Divider()
            HStack {
                Image("man")
                    .cornerRadius(32)
                    .padding()
                VStack {
                    Text("Martin Péchy")
                    Spacer()
                }
                Spacer()
            }.frame(height: 64).padding(.top)
            HStack {
                VStack {
                    HStack {
                        Text("3").bold().foregroundColor(Color("Green"))
                        Spacer()
                    }
                    HStack {
                        Text("FOLLOWING")
                        Spacer()
                    }
                }.padding(.leading)
                Divider()
                VStack {
                    VStack {
                        HStack {
                            Text("1.3 M").bold().foregroundColor(Color("Green"))
                            Spacer()
                        }
                        HStack {
                            Text("FOLLOWERS")
                            Spacer()
                        }
                    }
                }
                Spacer()
            }.font(Font.custom("Avenir", size: 9))
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
