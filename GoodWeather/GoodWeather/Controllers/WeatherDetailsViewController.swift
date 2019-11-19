//
//  WeatherDetailsViewController.swift
//  GoodWeather
//
//  Created by Lucas Inocencio on 19/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetailsViewController: UIViewController {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    var weatherViewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let weatherVM = self.weatherViewModel {
            self.cityNameLabel.text = weatherVM.name.value
            self.currentTemperatureLabel.text = weatherVM.currentTemperature.temperature.value.formatAsDegree
            self.maxTempLabel.text = weatherVM.currentTemperature.temperatureMax.value.formatAsDegree
            self.minTempLabel.text = weatherVM.currentTemperature.temperatureMin.value.formatAsDegree
        }
    }
}
