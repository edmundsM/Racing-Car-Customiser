//
//  ContentView.swift
//  Car Customizer
//
//  Created by Max Edmunds on 17/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar = 0
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var nitroPackage = false
    @State private var launchPackage = false
    
    var body: some View {
        
        let exhaustPackageBinding = Binding<Bool> (
            get : { self.exhaustPackage },
            set : { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                }
            }
        )
        let tiresPackageBinding = Binding<Bool> (
            get : { self.tiresPackage },
            set : { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                }
            }
        )
        let nitroPackageBinding = Binding<Bool> (
            get : { self.nitroPackage },
            set : { newValue in
                self.nitroPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 10
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 10
                }
            }
        )
        let launchPackageBinding = Binding<Bool> (
            get : { self.launchPackage },
            set : { newValue in
                self.launchPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 1.5
                } else {
                    starterCars.cars[selectedCar].acceleration += 1.5
                }
            }
        )
        
        
        
        
        Form {
            VStack(alignment: .leading, spacing: 20) {
                Text(starterCars.cars[selectedCar].displayStats())
                Button("Random Car", action: {
                    selectedCar = Int.random(in: 0 ..< self.starterCars.cars.count)})
                Button("Next Car", action: {
                    if selectedCar == 3 {
                        selectedCar = 0
                    } else {
                        selectedCar += 1
                    }
                })
            }
            Section {
                Toggle("Exhaust Package", isOn: exhaustPackageBinding)
                Toggle("Tires Package", isOn: tiresPackageBinding)
                Toggle("Nitro Boost Package", isOn: nitroPackageBinding)
                Toggle("Launch Control Package", isOn: launchPackageBinding)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
