import UIKit

class WeatherListTableViewController: UITableViewController, AddWheatherDelegate {
    private var weatherListViewModel = WeatherListViewModel()
    private var datasource: TableViewDataSource<WeatherCell, WeatherViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.datasource = TableViewDataSource(cellIdentifier: "weatherCell", items: self.weatherListViewModel.weatherViewModels, configureCell: { (cell, vm) in
            cell.cityNameLabel.text = vm.name.value
            cell.temperatureLabel.text = vm.currentTemperature.temperature.value.formatAsDegree
        })
        
        self.tableView.dataSource = self.datasource
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        self.weatherListViewModel.addWeatherViewModel(vm)
        self.datasource.updateItems(self.weatherListViewModel.weatherViewModels)
        self.tableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "AddWeatherCitySegue":
            prepareSegueForAddWeatherCityViewController(segue: segue)
            break
        case "SettingsSegue":
            prepareSegueForSettingsTableViewController(segue: segue)
            break
        case "DetailsSegue":
            prepareSegueForWeatherDetailsViewController(segue: segue)
            break
        default: break
        }
    }
    
    private func prepareSegueForWeatherDetailsViewController(segue: UIStoryboardSegue) {
        guard let weatherDetailsVC = segue.destination as? WeatherDetailsViewController,
            let indexPath = self.tableView.indexPathForSelectedRow else {
                return
        }
        
        let waetherVC = self.weatherListViewModel.modelAt(indexPath.row)
        weatherDetailsVC.weatherViewModel = waetherVC
    }
    
    private func prepareSegueForSettingsTableViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }
        
        guard let settingsTVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("SettingsTableViewController not found")
        }
        
        settingsTVC.delegate = self
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
}

extension WeatherListTableViewController: SettingsDelegate {
    func settingsDone(vm: SettingsViewModel) {
        self.weatherListViewModel.updateUnit(to: vm.selectedUnit)
        self.tableView.reloadData()
    }
}
