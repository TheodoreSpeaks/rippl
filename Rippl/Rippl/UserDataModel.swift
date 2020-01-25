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
}
