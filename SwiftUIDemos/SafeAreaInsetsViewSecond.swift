//
//  SafeAreaInsetsViewSecond.swift
//  SwiftUIDemos
//
//  Created by Evgeny on 27.07.2021.
//

import SwiftUI

struct SafeAreaInsetsViewSecond: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .green]), startPoint: .leading, endPoint: .trailing)
                .background(Color.orange.ignoresSafeArea()) //orange - safe area color
            Text("Safe area is orange")
            Text("Yes, navigation decrease the view with gradient")
            Text("Check the difference iPhone 8 and X")
        }
    }
}

struct SafeAreaInsetsViewSecond_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaInsetsViewSecond()
    }
}
