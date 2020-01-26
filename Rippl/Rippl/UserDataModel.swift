//
//  UserDataModel.swift
//  Rippl
//
//  Created by Rahil Patel on 1/25/20.
//  Copyright © 2020 Rippl. All rights reserved.
//

import Foundation
import Combine

class UserDataModel: ObservableObject {
    @Published var uid: String?
    var yearData: [Double] = [100,500,800,1000,400,1200,1600,200,800]
    var monthData: [Double] = [80,40,80,100,400,120,160,20,80]
    var weekData: [Double] = [10,40,60,80,100,20]
    let url = "https://ripplheroku.herokuapp.com"
    func getData(for timeInterval: String) -> [Double] {
        switch timeInterval {
        case "YEAR":
            return yearData
        case "MONTH":
            return monthData
        case "WEEK":
            return weekData
        default:
            return yearData
        }
    }
    func getTotal(for timeInterval: String) -> Int {
        var sum: Double = 0
        switch timeInterval {
        case "YEAR":
            for data in yearData {
                sum += data
            }
        case "MONTH":
            for data in monthData {
                sum += data
            }
        case "WEEK":
            for data in weekData {
                sum += data
            }
        default:
            for data in yearData {
                sum += data
            }
        }
        return Int(sum)
    }
    func getItem(for barcode: String, onComplete: @escaping (String, String) -> Void) {
        HttpRequest.makeGetRequest(urlString: "\(url)/barcode?barcode_id=\(barcode)", success: { (data) in
            print(data)
            guard let name = data["name"] as? String else { return }
            guard let amount = data["gallons"] as? Double else { return }
            let lastYear  = (self.yearData.last ?? 0) + Double(amount)
            let lastMonth = (self.monthData.last ?? 0) + Double(amount)
            let lastWeek = (self.weekData.last ?? 0) + Double(amount)
            self.yearData[self.yearData.count - 1] = lastYear
            self.monthData[self.monthData.count - 1] = lastMonth
            self.weekData[self.weekData.count - 1] = lastWeek
            DispatchQueue.main.async {
                onComplete(name, "\(amount.rounded())")
            }
        }) { error in
            print(error)
        }
    }
}
