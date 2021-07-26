//
//  SafeAreaInsetsView.swift
//  SwiftUIDemos
//
//  Created by Evgeny on 26.07.2021.
//

import SwiftUI

struct SafeAreaInsetView: View {

    var body: some View {
        // GeometryReader takes all available space
        GeometryReader { reader in
            ZStack {
                Color(.red)

                //add padding to the desired view
                Color(.cyan)
                    .padding(.bottom, reader.safeAreaInsets.bottom)
                //Just for info
                VStack(alignment: .leading) {
                    Text("Top: \(reader.safeAreaInsets.top)")
                    Text("Bottom: \(reader.safeAreaInsets.bottom)")
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
            SafeAreaInsetView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            SafeAreaInsetView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
        }
    }
}
