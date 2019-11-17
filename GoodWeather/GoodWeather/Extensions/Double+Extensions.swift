//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by Lucas Inocencio on 17/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import Foundation

extension Double {
    var formatAsDegree: String {
        return String(format: "%.0f°", self)
    }
}
