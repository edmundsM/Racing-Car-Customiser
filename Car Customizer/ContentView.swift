//
//  ContentView.swift
//  Car Customizer
//
//  Created by Max Edmunds on 17/01/2022.
//

import SwiftUI

struct ContentView: View {
    let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
    
    var body: some View {
        Text("""
        Car make: \(car.make)
        Model: \(car.model)
        Top Speed: \(car.topSpeed)
        Acceleration: \(car.acceleration)s
        Handling: \(car.handling)
    """)
            .frame(width: 400, height: 110)
            .padding()
            .background(.gray)
            .position(x: 215, y: 60)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
