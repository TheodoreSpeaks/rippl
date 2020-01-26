//
//  LoginView.swift
//  Rippl
//
//  Created by Rahil Patel on 1/25/20.
//  Copyright © 2020 Rippl. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userDataModel: UserDataModel
    var body: some View {
        VStack {
            Button(action: {
                self.userDataModel.uid = "\(UUID())"
            }) {
                Text("Login")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
