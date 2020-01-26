//
//  User.swift
//  Rippl
//
//  Created by Rahil Patel on 1/26/20.
//  Copyright © 2020 Rippl. All rights reserved.
//

import Foundation
import SwiftUI

struct User {
    var id = UUID()
    var name: String
    var image: Image
    var progress: CGFloat
    var total: CGFloat
}
