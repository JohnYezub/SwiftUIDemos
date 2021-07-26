# SwiftUI Demos

We know how to  expand any view to fill the screen area with .ignoreSafeArea() modifier.
But how to make child view to respect the safe area in case if parent ignores safe area?
GeometryReader is the answer. We have to use safe area insets from GeometryReader.
Starting from iPhoneX safe area insets are different to the old iPhones.
This demo shows how to position the content in your app according to safe area.

![SwiftUIDemos](./Screenshot1.png "SwiftUI Demos")
![SwiftUIDemos](./Screenshot2.png "SwiftUI Demos")
