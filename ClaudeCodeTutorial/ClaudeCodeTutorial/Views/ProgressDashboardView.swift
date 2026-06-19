import SwiftUI

struct ProgressDashboardView: View {
    @EnvironmentObject var progressManager: ProgressManager
    @State private var showResetConfirmation = false

    var body: some View {
        NavigationStack {
            List {
                overallProgressSection
                modulesSection
                resetSection
            }
            .navigationTitle("Progress")
            .alert("Reset Progress?", isPresented: $showResetConfirmation) {
                Button("Cancel", role: .cancel) {}
                Button("Reset", role: .destructive) {
                    progressManager.resetProgress()
                }
            } message: {
                Text("This will clear all your completed lessons and quiz scores. This cannot be undone.")
            }
        }
    }

    private var overallProgressSection: some View {
        Section {
            let total = TutorialData.totalLessonCount
            let completed = progressManager.totalCompleted
            let percentage = progressManager.completionPercentage(totalLessons: total)

            VStack(spacing: 16) {
                ZStack {
                    Circle()
                        .stroke(Color(.systemGray5), lineWidth: 12)

                    Circle()
                        .trim(from: 0, to: percentage / 100)
                        .stroke(.purple, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                        .animation(.easeInOut, value: percentage)

                    VStack {
                        Text("\(Int(percentage))%")
                            .font(.title.bold())
                        Text("Complete")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(width: 120, height: 120)
                .padding()

                HStack(spacing: 32) {
                    StatItem(value: "\(completed)", label: "Completed")
                    StatItem(value: "\(total - completed)", label: "Remaining")
                    StatItem(value: "\(progressManager.quizScores.count)", label: "Quizzes")
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
        }
    }

    private var modulesSection: some View {
        Section("By Module") {
            ForEach(TutorialData.modules.sorted(by: { $0.order < $1.order })) { module in
                let completed = module.lessons.filter { progressManager.isCompleted($0.id) }.count
                let total = module.lessons.count

                HStack {
                    Image(systemName: module.iconName)
                        .foregroundStyle(.purple)
                        .frame(width: 24)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(module.title)
                            .font(.body)

                        ProgressView(value: Double(completed), total: Double(total))
                            .tint(.purple)
                    }

                    Text("\(completed)/\(total)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    private var resetSection: some View {
        Section {
            Button(role: .destructive) {
                showResetConfirmation = true
            } label: {
                HStack {
                    Image(systemName: "arrow.counterclockwise")
                    Text("Reset All Progress")
                }
            }
        }
    }
}

struct StatItem: View {
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.title3.bold())
            Text(label)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ProgressDashboardView()
        .environmentObject(ProgressManager())
}
