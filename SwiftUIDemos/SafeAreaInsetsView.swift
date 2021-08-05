//
//  SafeAreaInsetsView.swift
//  SwiftUIDemos
//
//  Created by Evgeny on 26.07.2021.
//

import SwiftUI

struct SafeAreaInsetsView: View {

    var body: some View {
        // GeometryReader takes all available space
        GeometryReader { reader in
            ZStack {

                //Safe area color
                Color(.orange)

                //add padding to the desired view
                LinearGradient(gradient: Gradient(colors: [.yellow, .green]), startPoint: .leading, endPoint: .trailing)
                    .padding(.bottom, reader.safeAreaInsets.bottom)
                
                //Just for info
                VStack(alignment: .leading) {
                    Text("We setup paddings manually")
                    Text("Check the difference iPhone 8 and X")
                    Text("safeAreaInsets Top: \(reader.safeAreaInsets.top)")
                    Text("safeAreaInsets Bottom: \(reader.safeAreaInsets.bottom)")
                }
            }
            //Use it for the view wrapped in GeometryReader
            .ignoresSafeArea(edges: [.bottom, .top])
        }
    }
}



struct AlignmentGuide_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SafeAreaInsetsView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            SafeAreaInsetsView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
        }
    }
}
