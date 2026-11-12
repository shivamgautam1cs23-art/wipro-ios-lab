import SwiftUI

struct ContentView: View {

    @State private var refreshCount = 0
    @State private var lastRefresh = Date.distantPast

    var body: some View {

        NavigationStack {

            VStack(spacing: 20) {

                Text("Home Screen")
                    .font(.largeTitle)
                    .bold()

                Text("Refresh Count: \(refreshCount)")

                NavigationLink("Go to Second Screen") {
                    SecondView()
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Home")
            .onAppear {

                print("Home: View appeared")

                refreshIfNeeded()
            }
            .onDisappear {

                print("Home: View disappeared")
            }
        }
    }

    // Lightweight refresh operation

    private func refreshIfNeeded() {

        let now = Date()

        if now.timeIntervalSince(lastRefresh) >= 5 {

            refreshCount += 1
            lastRefresh = now

            print("Home: Data refreshed")
        }
    }
}
