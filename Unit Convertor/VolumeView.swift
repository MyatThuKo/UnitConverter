//
//  VolumeView.swift
//  Unit Convertor
//
//  Created by Myat Thu Ko on 6/3/20.
//  Copyright © 2020 Myat Thu Ko. All rights reserved.
//

import SwiftUI

struct VolumeView: View {
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
    
    @State private var inputV = ""
    @State private var unitSelection = ["Liter", "Milliliter", "Cubic Meter", "Galloon", "US Fluid Ounce", "Imperial Fluid Ounce"]
    @State private var inputUnit = 1
    @State private var outputUnit = 0
    
    var outputV: Double {
        let input = Double(Double(inputV) ?? 0)
        var inputVolume = Measurement(value: input, unit: UnitVolume.liters)
        
        switch inputUnit {
        case 0:
            inputVolume = Measurement(value: input, unit: UnitVolume.liters)
        case 1:
            inputVolume = Measurement(value: input, unit: UnitVolume.milliliters)
        case 2:
            inputVolume = Measurement(value: input, unit: UnitVolume.cubicMeters)
        case 3:
            inputVolume = Measurement(value: input, unit: UnitVolume.gallons)
        case 4:
            inputVolume = Measurement(value: input, unit: UnitVolume.fluidOunces)
        case 5:
            inputVolume = Measurement(value: input, unit: UnitVolume.imperialFluidOunces)
        default:
            print("No input")
        }
        
        return (convert(inputVolume))
    }
    
    func convert(_ inputVolume: Measurement<UnitVolume>) -> Double {
        var outputVolume = inputVolume.converted(to: .liters)
        
        switch outputUnit {
        case 0:
            outputVolume = inputVolume.converted(to: .liters)
        case 1:
            outputVolume = inputVolume.converted(to: .milliliters)
        case 2:
            outputVolume = inputVolume.converted(to: .cubicMeters)
        case 3:
            outputVolume = inputVolume.converted(to: .gallons)
        case 4:
            outputVolume = inputVolume.converted(to: .fluidOunces)
        case 5:
            outputVolume = inputVolume.converted(to: .imperialFluidOunces)
        default:
            print("No input")
        }
        
        return outputVolume.value
    }
    
    var body: some View {
        Form {
            Section(header: Text("Input")) {
                TextField("Input", text: $inputV)
                    .keyboardType(.decimalPad)
                    .onTapGesture {
                        self.endEditing()
                }
                
                Picker("Input Unit", selection: $inputUnit) {
                    ForEach(0..<self.unitSelection.count) {
                        Text("\(self.unitSelection[$0])")
                    }
                }
            }
            Section(header: Text("Output")) {
                Picker("Output Unit", selection: $outputUnit) {
                    ForEach(0..<self.unitSelection.count) {
                        Text("\(self.unitSelection[$0])")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .labelsHidden()
                
                Text("\(outputV, specifier: "%g")")
            }
        }
        .navigationBarTitle("Volume Converter", displayMode: .inline)
    }
}

struct VolumeView_Previews: PreviewProvider {
    static var previews: some View {
        VolumeView()
    }
}
