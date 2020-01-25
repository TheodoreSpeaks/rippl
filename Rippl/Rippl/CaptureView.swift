//
//  CaptureView.swift
//  Rippl
//
//  Created by Rahil Patel on 1/25/20.
//  Copyright © 2020 Rippl. All rights reserved.
//

import SwiftUI

struct CaptureView: View {
    var body: some View {
        BarcodeScannerView(onCapture: { code in
            print(code)
        }) { error in
            print(error.localizedDescription)
        }
    }
}

struct CaptureView_Previews: PreviewProvider {
    static var previews: some View {
        CaptureView()
    }
}
