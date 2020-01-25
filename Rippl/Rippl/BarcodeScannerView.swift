//
//  BarcodeScannerView.swift
//  Rippl
//
//  Created by Rahil Patel on 1/25/20.
//  Copyright © 2020 Rippl. All rights reserved.
//

import SwiftUI
import BarcodeScanner

struct BarcodeScannerView: UIViewControllerRepresentable {
    var onCapture: (String) -> Void
    var onFail: (Error) -> Void
    func makeUIViewController(context: UIViewControllerRepresentableContext<BarcodeScannerView>) -> BarcodeScannerViewController {
        let vc = BarcodeScannerViewController()
        vc.headerViewController.closeButton.isHidden = true
        vc.codeDelegate = context.coordinator.self
        vc.errorDelegate = context.coordinator.self
        return vc
    }
    func updateUIViewController(_ uiViewController: BarcodeScannerViewController, context: UIViewControllerRepresentableContext<BarcodeScannerView>) {
        
    }
    func makeCoordinator() -> BarcodeScannerView.Coordinator {
        return Coordinator(onCapture: onCapture, onFail: onFail)
    }
    class Coordinator: BarcodeScannerCodeDelegate, BarcodeScannerErrorDelegate, BarcodeScannerDismissalDelegate {
        var onCapture: (String) -> Void
        var onFail: (Error) -> Void
        
        init(onCapture: @escaping (String) -> Void, onFail: @escaping (Error) -> Void) {
            self.onCapture = onCapture
            self.onFail = onFail
        }
        
        func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
            onCapture(code)
            controller.resetWithError(message: "Success!")
        }
        func scanner(_ controller: BarcodeScannerViewController, didReceiveError error: Error) {
            onFail(error)
        }
        func scannerDidDismiss(_ controller: BarcodeScannerViewController) {
            controller.dismiss(animated: true, completion: nil)
            print("Scanner dismissed")
        }
    }
}
