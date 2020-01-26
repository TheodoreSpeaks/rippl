//
//  EditButton.swift
//  Rippl
//
//  Created by Rahil Patel on 1/25/20.
//  Copyright © 2020 Rippl. All rights reserved.
//

import SwiftUI

struct EditButton: View {
    var body: some View {
        Button(action: {
            
        }) {
            Text("Edit").foregroundColor(Color("Green")).bold()
        }
    }
}

struct EditButton_Previews: PreviewProvider {
    static var previews: some View {
        EditButton()
    }
}
