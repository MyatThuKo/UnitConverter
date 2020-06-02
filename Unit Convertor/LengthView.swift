//
//  LengthView.swift
//  Unit Convertor
//
//  Created by Myat Thu Ko on 6/2/20.
//  Copyright © 2020 Myat Thu Ko. All rights reserved.
//

import SwiftUI

struct LengthView: View {
    
    @State private var inputLength = ""
    @State private var unitLength = ["Meters", "Kilometers", "Feet", "Yards", "Miles", "Inches"]
    @State private var selectedInputL = 0
    @State private var selectedOutputL = 0
    
    var outputLength: Double {
        let inputValue = Double(Double(inputLength) ?? 0)
        
        var inputHeight = Measurement(value: inputValue, unit: UnitLength.meters)
        var outputHeight: Double = 0
        
        switch unitLength[selectedInputL] {
        case "Meters":
            inputHeight = Measurement(value: inputValue, unit: UnitLength.meters)
        case "Kilometers":
            inputHeight = Measurement(value: inputValue, unit: UnitLength.kilometers)
        case "Feet":
            inputHeight = Measurement(value: inputValue, unit: UnitLength.feet)
        case "Yards":
            inputHeight = Measurement(value: inputValue, unit: UnitLength.yards)
        case "Miles":
            inputHeight = Measurement(value: inputValue, unit: UnitLength.miles)
        case "Inches":
            inputHeight = Measurement(value: inputValue, unit: UnitLength.inches)
        default:
            print("No selection")
        }
        
        outputHeight = convert(inputHeight)
        return outputHeight
    }
    
    func convert(_ inputHeight: Measurement<UnitLength>) -> Double {
        
        var output = inputHeight.converted(to: .meters)
        
        switch unitLength[selectedOutputL] {
        case "Meters":
           output = inputHeight.converted(to: .meters)
        case "Kilometers":
            output = inputHeight.converted(to: .kilometers)
        case "Feet":
            output = inputHeight.converted(to: .feet)
        case "Yards":
            output = inputHeight.converted(to: .yards)
        case "Miles":
            output = inputHeight.converted(to: .miles)
        case "Inches":
            output = inputHeight.converted(to: .inches)
        default:
            print("No selection")
        }
        
        return output.value
    }
    
    var body: some View {
        Form{
            Section(header: Text("Input")){
                TextField("Length", text: $inputLength)
                    .keyboardType(.decimalPad)
                Picker("From", selection: $selectedInputL) {
                    ForEach(0..<unitLength.count) {
                        Text("\(self.unitLength[$0])")
                    }
                }
            }
            
            Section(header: Text("Output")){
                Picker("To", selection: $selectedOutputL) {
                    ForEach(0..<unitLength.count) {
                        Text("\(self.unitLength[$0])")
                    }
                }
                HStack {
                    Text("\(outputLength, specifier: "%g")")
                }
            }
        }
        .navigationBarTitle("Temperature Convertor", displayMode: .inline)
    }
}

struct LengthView_Previews: PreviewProvider {
    static var previews: some View {
        LengthView()
    }
}

//Length conversion: users choose meters, kilometers, feet, yards, or miles.
