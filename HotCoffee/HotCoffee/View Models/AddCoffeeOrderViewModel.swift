//
//  AddCoffeeOrderViewModel.swift
//  HotCoffee
//
//  Created by Lucas Inocencio on 15/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import Foundation

struct AddCoffeOrderViewModel {
    var name: String?
    var email: String?
    
    var selectedType: String?
    var selectedSize: String?
    
    var types: [String] {
        return CoffeeType.allCases.map { $0.rawValue.capitalized }
    }
    
    var sizes: [String] {
        return CoffeeSize.allCases.map { $0.rawValue.capitalized }
    }
}

