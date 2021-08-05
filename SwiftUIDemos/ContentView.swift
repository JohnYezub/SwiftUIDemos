//
//  ContentView.swift
//  SwiftUIDemos
//
//  Created by Evgeny on 26.07.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: SafeAreaInsetsViewSecond()) {
                    Text("Safe area simple")
                }
                NavigationLink(destination: SafeAreaInsetsView()) {
                    Text("Safe area full control")
                }
                NavigationLink(destination: PositionReader()) {
                    Text("Position reader")
                }
            }
            .navigationTitle("SwiftUIDemos")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
