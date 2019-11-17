//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Lucas Inocencio on 15/11/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController, AddWheatherDelegate {
    
    private var weatherListViewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        self.weatherListViewModel.addWeatherViewModel(vm)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        //        print(vm.name)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.numberOfRows(section)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        if segue.identifier == "AddWeatherCitySegue" {
        //            prepareSegueForAddWeatherCityViewController(segue: segue)
        //        } else if segue.identifier == "SettingsSegue" {
        //            prepareSegueForSettingsTableViewController(segue: segue)
        //        }
        
        switch segue.identifier {
        case "AddWeatherCitySegue":
            prepareSegueForAddWeatherCityViewController(segue: segue)
            break
        case "SettingsSegue":
            prepareSegueForSettingsTableViewController(segue: segue)
            break
        default: break
        }
    }
    
    private func prepareSegueForSettingsTableViewController(segue: UIStoryboardSegue) {
        
    }
    
    private func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityController not found")
        }
        
        addWeatherCityVC.delegate = self
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherCell
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        
        cell.configure(weatherVM)
        
        return cell
    }
    
    
}
