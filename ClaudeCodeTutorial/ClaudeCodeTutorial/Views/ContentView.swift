import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Learn", systemImage: "book.fill")
                }

            ReferenceView()
                .tabItem {
                    Label("Reference", systemImage: "text.book.closed.fill")
                }

            ProgressDashboardView()
                .tabItem {
                    Label("Progress", systemImage: "chart.bar.fill")
                }
        }
        .tint(.purple)
    }
}

#Preview {
    ContentView()
        .environmentObject(ProgressManager())
}
