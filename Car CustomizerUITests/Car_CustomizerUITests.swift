//
//  Car_CustomizerUITests.swift
//  Car CustomizerUITests
//
//  Created by Max Edmunds on 17/01/2022.
//

import XCTest

class Car_CustomizerUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenBoughtTiresAndExhaustPackageOtherTwoUpgradesAreDisabled() throws {
        // arrange
        //let app = XCUIApplication()
        //app.launch()
        
        //act
        
        //let tablesQuery = app.tables
        //tablesQuery.switches["Exhaust Package (Cost: 500)"].tap()
        //tablesQuery.switches["Tires Package (Cost: 500)"].tap()
        
        
        
        //assert
        //XCTAssertEqual(tablesQuery.switches["Nitro Boost Package (Cost: 500)"].isEnabled, false)
        //XCTAssertEqual(tablesQuery.switches["Launch Control Package (Cost: 1000)"].isEnabled, false)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
