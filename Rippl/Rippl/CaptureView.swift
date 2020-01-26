//
//  CaptureView.swift
//  Rippl
//
//  Created by Rahil Patel on 1/25/20.
//  Copyright © 2020 Rippl. All rights reserved.
//

import SwiftUI

struct CaptureView: View {
    @State var scanned = false
    @EnvironmentObject var userDataModel: UserDataModel
    @State var itemName = ""
    @State var amount = ""
    var body: some View {
        BarcodeScannerView(onCapture: { controller, code in
            print(code)
            self.userDataModel.getItem(for: code) { name, amount in
                self.itemName = name
                self.amount = amount
                self.scanned = true
                controller.resetWithError(message: "Success!")
            }
        }) { error in
            print(error.localizedDescription)
        }
        .alert(isPresented: $scanned) {
            Alert(title: Text("Success!"), message: Text("You've successfully scanned the \(self.itemName). It has a footprint of about \(amount) gallons"), dismissButton: nil)
        }
    }
}

struct CaptureView_Previews: PreviewProvider {
    static var previews: some View {
        CaptureView()
    }
}
