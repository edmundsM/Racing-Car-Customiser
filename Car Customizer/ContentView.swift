//
//  ContentView.swift
//  Car Customizer
//
//  Created by Max Edmunds on 17/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0 {
        didSet {
            if selectedCar >= starterCars.cars.count {
                selectedCar = 0
            }
        }
    }
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var nitroPackage = false
    @State private var launchPackage = false
    @State private var remainingFunds = 1000
    @State private var remainingTime = 30
    
    var timerDone: Bool{
            if self.remainingTime == 0 {
                return false
            } else {
                return true
            }
        }
    
    var exhaustPackageEnabled: Bool {
        return exhaustPackage ? true : remainingFunds >= 500 ? true : false
    }
    
    var tiresPackageEnabled: Bool {
        return tiresPackage ? true : remainingFunds >= 500 ? true : false
    }
    
    var nitroPackageEnabled: Bool {
        return nitroPackage ? true : remainingFunds >= 500 ? true : false
    }
    
    var launchPackageEnabled: Bool {
        return launchPackage ? true : remainingFunds >= 1000 ? true : false
    }
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get : { self.exhaustPackage },
            set : { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 500
                }
            }
        )
        let tiresPackageBinding = Binding<Bool> (
            get : { self.tiresPackage },
            set : { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 500
                }
            }
        )
        let nitroPackageBinding = Binding<Bool> (
            get : { self.nitroPackage },
            set : { newValue in
                self.nitroPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 10
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 10
                    remainingFunds += 500
                }
            }
        )
        let launchPackageBinding = Binding<Bool> (
            get : { self.launchPackage },
            set : { newValue in
                self.launchPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 1.5
                    starterCars.cars[selectedCar].handling += 1
                    remainingFunds -= 1000
                } else {
                    starterCars.cars[selectedCar].acceleration += 1.5
                    starterCars.cars[selectedCar].handling -= 1
                    remainingFunds += 1000
                }
            }
        )
        
        
        
        VStack {
            Text("\(remainingTime)")
                .onReceive(timer) {_ in
                    if self.remainingTime > 0 {
                        self.remainingTime -= 1
                    }
                }
                .foregroundColor(.red)
            Form {
                VStack(alignment: .leading, spacing: 20) {
                    Text(starterCars.cars[selectedCar].displayStats())
                    Button("Next Car", action: {
                        selectedCar += 1
                    })
                    .disabled(!timerDone)
                }
                Section {
                    Toggle("Exhaust Package (Cost: 500)", isOn: exhaustPackageBinding)
                        .disabled(!exhaustPackageEnabled)
                        .disabled(!timerDone)
                    Toggle("Tires Package (Cost: 500)", isOn: tiresPackageBinding)
                        .disabled(!tiresPackageEnabled)
                        .disabled(!timerDone)
                    Toggle("Nitro Boost Package (Cost: 500)", isOn: nitroPackageBinding)
                        .disabled(!nitroPackageEnabled)
                        .disabled(!timerDone)
                    Toggle("Launch Control Package (Cost: 1000)", isOn: launchPackageBinding)
                        .disabled(!launchPackageEnabled)
                        .disabled(!timerDone)
                }
            }
            Text("Remaining Funds: \(remainingFunds)")
                .foregroundColor(.red)
                .baselineOffset(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
