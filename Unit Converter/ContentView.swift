//
//  ContentView.swift
//  Unit Converter
//
//  Created by Kyle Housel on 11/15/23.
//

import SwiftUI

struct ContentView: View {

    @State private var selectedUnitIndexInput = 0
    @State private var selectedUnitIndexOutput = 0
    @State private var value = 1.0

    let units = ["inches", "feet", "yards", "millimeters", "centimeters", "meters", "kilometers"]

    var inputValue: Measurement<UnitLength> {
        let unit = units[selectedUnitIndexInput]
        var convertUnit: Measurement<UnitLength>
        
        switch unit {
        case "inches":
            convertUnit = Measurement(value: value, unit: UnitLength.inches)
        case "feet":
            convertUnit = Measurement(value: value, unit: UnitLength.feet)
        case "yards":
            convertUnit = Measurement(value: value, unit: UnitLength.yards)
        case "millimeters":
            convertUnit = Measurement(value: value, unit: UnitLength.millimeters)
        case "centimeters":
            convertUnit = Measurement(value: value, unit: UnitLength.centimeters)
        case "meters":
            convertUnit = Measurement(value: value, unit: UnitLength.meters)
        case "kilometers":
            convertUnit = Measurement(value: value, unit: UnitLength.kilometers)
        default:
            fatalError("Unsupported unit: \(unit)")
        }
        return convertUnit
    }
    
    var outputValue: String {
        let unit = units[selectedUnitIndexOutput]
        var conversion: Measurement<UnitLength>
        
        switch unit {
        case "inches":
            conversion = inputValue.converted(to: .inches)
        case "feet":
            conversion = inputValue.converted(to: .feet)
        case "yards":
            conversion = inputValue.converted(to: .yards)
        case "millimeters":
            conversion = inputValue.converted(to: .millimeters)
        case "centimeters":
            conversion = inputValue.converted(to: .centimeters)
        case "meters":
            conversion = inputValue.converted(to: .meters)
        case "kilometers":
            conversion = inputValue.converted(to: .kilometers)
        default:
            fatalError("Unsupported unit: \(unit)")
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        
        return formatter.string(from: NSNumber(value: conversion.value)) ?? ""
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Converting From:")) {
                    Picker("Unit", selection: $selectedUnitIndexInput) {
                        ForEach(0..<units.count) {
                            Text(self.units[$0])
                        }
                    }
                }
                Section(header: Text("Converting To:")) {
                    Picker("Unit", selection: $selectedUnitIndexOutput) {
                        ForEach(0..<units.count) {
                            Text(self.units[$0])
                        }
                    }
                }

                Section(header: Text("Enter value")) {
                    TextField("Value", value: $value, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("Converted Value")) {
                    Text("\(outputValue) \(units[selectedUnitIndexOutput])")
                }
            }
            .navigationTitle("Length Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


