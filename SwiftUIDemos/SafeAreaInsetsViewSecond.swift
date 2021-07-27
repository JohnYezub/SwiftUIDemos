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
                .background(Color.blue.ignoresSafeArea())
        }
    }
}

struct SafeAreaInsetsViewSecond_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaInsetsViewSecond()
    }
}
