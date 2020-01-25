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
    var body: some View {
        BarcodeScannerView(onCapture: { controller, code in
            print(code)
            self.scanned = true
            controller.resetWithError(message: "Success!")
        }) { error in
            print(error.localizedDescription)
        }
        .alert(isPresented: $scanned) {
            Alert(title: Text("Success!"), message: Text("You've successfully scanned the item."), dismissButton: nil)
        }
    }
}

struct CaptureView_Previews: PreviewProvider {
    static var previews: some View {
        CaptureView()
    }
}
