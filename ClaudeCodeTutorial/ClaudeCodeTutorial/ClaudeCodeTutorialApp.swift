import SwiftUI

@main
struct ClaudeCodeTutorialApp: App {
    @StateObject private var progressManager = ProgressManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(progressManager)
        }
    }
}
