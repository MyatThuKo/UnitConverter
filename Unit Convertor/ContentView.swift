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
    var body: some View {
        NavigationView {
            Form {
                NavigationLink("Temperature", destination: TempView())
                NavigationLink("Time", destination: TimeView())
                NavigationLink("Length", destination: LengthView())
                NavigationLink("Volume", destination: VolumeView())
            }
            .navigationBarTitle("Unit Convertor")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

