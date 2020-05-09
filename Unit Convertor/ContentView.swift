//
//  ContentView.swift
//  Unit Convertor
//
//  Created by Myat Thu Ko on 5/7/20.
//  Copyright © 2020 Myat Thu Ko. All rights reserved.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView: View {
    
    @State private var input = ""
    @State private var unitFrom = 0
    @State private var unitTo = 0
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
    
    let tempUnits = ["Fahrenheit", "Celsius", "Kelvin"]
    
    var convertedTemp: Double {
        let inputTemp = Double(Double(input) ?? 0)
        let inputUnit = tempUnits[unitFrom]
        let outputUnit = tempUnits[unitTo]
        
        switch (inputUnit, outputUnit) {
        case ("Fahrenheit", "Celsius"):
            return Double((inputTemp - 32) * 5/9)
        case ("Fahrenheit", "Kelvin"):
            return Double((inputTemp - 32) * 5/9 + 273.15)
        case ("Celsius", "Fahrenheit"):
            return Double((inputTemp * 9/5) + 32)
        case ("Celsius", "Kelvin"):
            return Double(inputTemp + 273.15)
        case ("Kelvin", "Fahrenheit"):
            return Double((inputTemp - 273.15) * 9/5 + 32)
        case ("Kelvin", "Celsius"):
            return Double(inputTemp - 273.15)
        default:
            return inputTemp
        }
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("From")){
                    Picker("From", selection: $unitFrom) {
                        ForEach(0..<tempUnits.count) {
                            Text("\(self.tempUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    TextField("Degree", text: $input)
                        .keyboardType(.decimalPad)
                        .onTapGesture {
                            self.endEditing()
                    }
                }
                
                Section(header: Text("To")){
                    Picker("To", selection: $unitTo) {
                        ForEach(0..<tempUnits.count) {
                            Text("\(self.tempUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Text("\(convertedTemp, specifier: "%.2f")")
                }
            }
            .navigationBarTitle(Text("Temperature Convertor"))
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
