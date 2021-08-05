//
//  PositionReader.swift
//  SwiftUIDemos
//
//  Created by Evgeny on 05.08.2021.
//

import SwiftUI

struct PositionReader: View {
    @State var values: [ViewPositionData] = []
    var body: some View {
        VStack {
            Text("VStack text")
                .modifier(TrackSize(viewKeyName: "VStack text"))

            Color.yellow
                .modifier(TrackSize(viewKeyName: "Spacer"))
                .overlay(
                    VStack(alignment: .leading){
                        ForEach(values, id: \.viewKeyName) { value in
                            Text("\(value.viewKeyName): \(value.rect.prettyPrint())")
                        }
                    }
                )

            HStack {
                Text("First HStack text")
                    .modifier(TrackSize(viewKeyName: "First HStack"))

                Text("Second HStack text")
                    .modifier(TrackSize(viewKeyName: "Second HStack"))
            }
            .padding()

        }.onPreferenceChange(ViewPositionDataKey.self) { values in
            self.values = values
            values.forEach { value in
                print("KeyName \(value.viewKeyName): \(value.rect)")
            }
        }
    }
}

extension PositionReader {

    //The key that collects values
    struct ViewPositionDataKey: PreferenceKey {
        static var defaultValue: [ViewPositionData] = []

        static func reduce(value: inout [ViewPositionData], nextValue: () -> [ViewPositionData]) {
            value.append(contentsOf: nextValue())
        }
    }

    //We use viewIndex to correspond CGRect and view
    struct ViewPositionData: Equatable {
        let viewKeyName: String
        let rect: CGRect
    }

    //Modifier with GeometryReader and preference updater
    struct TrackSize: ViewModifier {
        let viewKeyName: String
        private var sizeView: some View {
            GeometryReader { geometry in
                Color.clear.preference(key: ViewPositionDataKey.self, value: [ViewPositionData(viewKeyName: viewKeyName, rect: geometry.frame(in: .global))])
            }
        }

        func body(content: Content) -> some View {
            content.background(sizeView)
        }
    }

}

extension CGRect {
    func prettyPrint() -> String {
        return String(format: "%.1f", self.origin.x) + ", " + String(format: "%.1f", self.origin.y) + ", " + String(format: "%.1f", self.size.width) + ", " + String(format: "%.1f", self.size.height)
    }
}

struct PositionReader_Previews: PreviewProvider {
    static var previews: some View {
        PositionReader()
    }
}
