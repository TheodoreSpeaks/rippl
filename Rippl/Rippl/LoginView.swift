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
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack {
            ZStack {
                Image("menu_background").resizable().frame(height:570)
            }
            TextField("johndoe@email.com", text: $email).textFieldStyle(RoundedBorderTextFieldStyle()).padding([.leading, .trailing])
            SecureField("password", text: $password).textFieldStyle(RoundedBorderTextFieldStyle()).padding([.leading, .trailing])
            Button(action: {
                self.userDataModel.uid = "\(UUID())"
            }) {
                Text("Login").font(Font.custom("Avenir", size: 17)).foregroundColor(.white)
            }.frame(width: 320, height: 50).background(Color("Green")).cornerRadius(2)
            Button(action: {
                
            }) {
                Text("Create and account").font(Font.custom("Avenir", size: 17)).foregroundColor(Color("Green"))
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
