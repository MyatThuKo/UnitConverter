//
//  TimeView.swift
//  Unit Convertor
//
//  Created by Myat Thu Ko on 6/2/20.
//  Copyright © 2020 Myat Thu Ko. All rights reserved.
//

import SwiftUI

struct TimeView: View {
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
    
    @State private var inputTime = ""
    @State private var unitSelection = ["Days", "Hours", "Minutes", "Seconds"]
    @State private var selectedInputT = 1
    @State private var selectedOutputT = 1
    
    var outputTime: String {
        let input = Int(Int(inputTime) ?? 0)
        let inputUnit = unitSelection[selectedInputT]
        let outputUnit = unitSelection[selectedOutputT]
        var output = ""
        
        switch (inputUnit) {
        case ("Days"):
            switch outputUnit {
            case ("Days"):
                if input > 1 {
                    output = "\(input) days"
                } else {
                    output = "\(input) day"
                }
            case ("Hours"):
                output = "\(input * 24) hours"
            case ("Minutes"):
                output = "\(input * 1440) minutes"
            case ("Seconds"):
                output = "\(input * 86400) seconds"
            default:
                print("No input")
            }
        case ("Hours"):
            switch outputUnit {
            case ("Days"):
                if input > 1 {
                    output = "\(input / 24) day, \(input % 24) hours"
                } else {
                    output = "\(input / 24) days, \(input % 24) hour"
                }
            case ("Hours"):
                if input > 1 {
                    output = "\(input) hours"
                } else {
                    output = "\(input) hour"
                }
            case ("Minutes"):
                output = "\(input * 60) minutes"
            case ("Seconds"):
                output = "\(input * 3600) minutes"
            default:
                print("No input")
            }
        case ("Minutes"):
            switch outputUnit {
            case ("Days"):
                if input > 1 {
                    output = "\(input / 1440) day, \(input / 60) hour, \(input % 60) minutes"
                } else {
                    output = "\(input / 1440) day, \(input / 60) hour, \(input % 60) minute"
                }
            case ("Hours"):
                if input > 1 {
                    output = "\(input / 60) hour, \(input % 60) minutes"
                } else {
                    output = "\(input / 60) hour, \(input % 60) minute"
                }
            case ("Minutes"):
                if input > 1 {
                    output = "\(input) minutes"
                } else {
                    output = "\(input) minute"
                }
            case ("Seconds"):
                output = "\(input * 60) seconds"
            default:
                print("No input")
            }
        case ("Seconds"):
            switch outputUnit {
            case ("Days"):
                if input > 1 {
                    output = "\(input / 86400) day, \(input / 3600) hour, \(input / 60) minutes, \(input % 60) seconds"
                } else {
                    output = "\(input / 86400) day, \(input / 3600) hour, \(input / 60) minutes, \(input % 60) second"
                }
            case ("Hours"):
                if input > 1 {
                    output = "\(input / 3600) hour, \(input / 60) minutes, \(input % 60) seconds"
                } else {
                    output = "\(input / 3600) hour, \(input / 60) minute, \(input % 60) second"
                }
            case ("Minutes"):
                if input > 1 {
                    output = "\(input / 60) minutes, \(input % 60) seconds"
                } else {
                    output = "\(input / 60) minutes, \(input % 60) second"
                }
            case ("Seconds"):
                if input > 1 {
                    output = "\(input) seconds"
                } else {
                    output = "\(input) second"
                }
            default:
                print("No input")
            }
        default:
            print("No input")
        }
        return output
    }
    
    var body: some View {
        Form {
            Section(header: Text("Input")) {
                TextField("Time", text: $inputTime)
                    .keyboardType(.numberPad)
                    .onTapGesture {
                        self.endEditing()
                }
                Picker("From", selection: $selectedInputT) {
                    ForEach(0..<unitSelection.count) {
                        Text("\(self.unitSelection[$0])")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .labelsHidden()
            }
            Section(header: Text("Output")) {
                Picker("From", selection: $selectedOutputT) {
                    ForEach(0..<unitSelection.count) {
                        Text("\(self.unitSelection[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Text("\(outputTime)")
            }
        }
        .navigationBarTitle("Time Converter", displayMode: .inline)
    }
    
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView()
    }
}
