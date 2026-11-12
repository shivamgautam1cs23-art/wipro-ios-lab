import SwiftUI

@main
struct LifecycleDemoApp: App {

    @Environment(\.scenePhase) private var scenePhase

    init() {
        print("App: Application initialized")
    }

    var body: some Scene {

        WindowGroup {

            ContentView()
                .onChange(of: scenePhase) { oldPhase, newPhase in

                    switch newPhase {

                    case .active:
                        print("App: Scene became ACTIVE")

                    case .inactive:
                        print("App: Scene became INACTIVE")

                    case .background:
                        print("App: Scene entered BACKGROUND")

                    @unknown default:
                        print("App: Unknown scene state")
                    }
                }
        }
    }
}
