import XCTest
@testable import GoodWeather

class SettingsViewModelTests: XCTestCase {
    private var settingsVM: SettingsViewModel!
    
    override func setUp() {
        super.setUp()
        self.settingsVM = SettingsViewModel()
    }
    
    func test_default_value_celsius() {
        XCTAssertEqual(settingsVM.selectedUnit, .celsius)
    }
    
    func test_celsius() {
        XCTAssertEqual(self.settingsVM.selectedUnit.displayName, "Celsius")
    }
    
    func test_selection() {
        self.settingsVM.selectedUnit = .fahrenheit
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
    }
    
    override func tearDown() {
        super.tearDown()
        
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }
}
