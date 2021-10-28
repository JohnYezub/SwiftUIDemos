//
//  RoutingView.swift
//  SwiftUIDemos
//
//  Created by Evgeny on 28.10.2021.
//

import SwiftUI

fileprivate class Router: ObservableObject {
    @Published var currentPage: Page = .page1
}

fileprivate enum Page {
        case page1
        case page2
}

fileprivate struct PresentingView: View {
    @ObservedObject var router: Router = Router()

    private let transition = AnyTransition.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading))
       var body: some View {
           switch router.currentPage {
           case .page1:
               FirstView()
                   .transition(transition)
           case .page2:
               SecondView()
           }
       }
}

fileprivate struct FirstView: View {
    var body: some View {
        ZStack {
            Color.red
            Text("This is the first view")

        }
    }
}

fileprivate struct SecondView: View {
    var body: some View {
        ZStack {
            Color.green
            Text("This is the second view")
        }
    }
}

///Uses router from PresentingView
struct RoutingView: View {
    private let presentingView = PresentingView()

    var body: some View {
        ZStack {
            presentingView
                .ignoresSafeArea()

            VStack {
                Spacer()
                HStack {
                    Button("First") {
                        withAnimation(.easeIn(duration: 0.5)) {
                            presentingView.router.currentPage = .page1
                        }
                    }

                    Button("Second") {
                        withAnimation(.easeIn(duration: 0.5)) {
                            presentingView.router.currentPage = .page2
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct RoutingView_Previews: PreviewProvider {
    static var previews: some View {
        RoutingView()
    }
}
