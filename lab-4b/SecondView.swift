import SwiftUI

struct SecondView: View {

    var body: some View {

        VStack(spacing: 20) {

            Text("Second Screen")
                .font(.largeTitle)
                .bold()

            Text("You are now on the second screen.")

        }
        .navigationTitle("Second")
        .navigationBarTitleDisplayMode(.inline)

        .onAppear {

            print("Second: View appeared")
        }

        .onDisappear {

            print("Second: View disappeared")
        }
    }
}
