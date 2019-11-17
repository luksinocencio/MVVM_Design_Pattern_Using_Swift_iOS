//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Lucas Inocencio on 15/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import Foundation
import UIKit

protocol AddWheatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    var delegate: AddWheatherDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveCityButtonPressed() {
       if let city = cityNameTextField.text {
           let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=1f0f2993ffacf610731c60b5a6bb5607&units=metric")!
        
        print(weatherURL)
           
           let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { data in
               
            guard let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data) else {
                fatalError("decoding error")
            }
               return weatherVM
           }
           
           Webservice().load(resource: weatherResource) { [weak self] result in
            if let weatherVM = result {
                if let delegate = self?.delegate {
                    delegate.addWeatherDidSave(vm: weatherVM)
                    self?.dismiss(animated: true, completion: nil)
                }
            }
           }
       }
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
}

// units=metric
// API Key = 1f0f2993ffacf610731c60b5a6bb5607
