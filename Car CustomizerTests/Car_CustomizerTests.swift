//
//  Car_CustomizerTests.swift
//  Car CustomizerTests
//
//  Created by Max Edmunds on 17/01/2022.
//

import XCTest

class Car_CustomizerTests: XCTestCase {

    func testNewCarGivesMeACarWithAllAttributes() {
        //arrange
        //act
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        //assert
        XCTAssertEqual(car.make, "Mazda")
        XCTAssertEqual(car.model, "MX-5")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 7.7)
        XCTAssertEqual(car.handling, 5)
        
    }

    func testCarCorrectlyReturnsAttributes() {
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        let expected = """
        Make: Mazda
        Model: MX-5
        Top Speed: 125mph
        Acceleration (0-60): 7.7s
        Handling: 5
        """
        let actual = car.displayStats()
        XCTAssertEqual(expected, actual)
        }
    
}


