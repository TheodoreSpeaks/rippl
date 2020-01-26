//
//  SettingsButton.swift
//  Rippl
//
//  Created by Rahil Patel on 1/25/20.
//  Copyright © 2020 Rippl. All rights reserved.
//

import SwiftUI

struct SettingsButton: View {
    var body: some View {
        Button(action: {
            
        }) {
            Image(systemName: "gear")
        }.foregroundColor(Color("Green"))
    }
}

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButton()
    }
}
