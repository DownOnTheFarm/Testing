import SwiftUI

struct HomeView: View {
    @EnvironmentObject var progressManager: ProgressManager

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    headerCard
                    progressSummary
                    modulesList
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Claude Code Tutorial")
        }
    }

    private var headerCard: some View {
        VStack(spacing: 12) {
            Image(systemName: "terminal.fill")
                .font(.system(size: 48))
                .foregroundStyle(.purple)

            Text("Learn Claude Code")
                .font(.title.bold())

            Text("Master the agentic coding tool that lives in your terminal")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var progressSummary: some View {
        let total = TutorialData.totalLessonCount
        let completed = progressManager.totalCompleted
        let percentage = progressManager.completionPercentage(totalLessons: total)

        return HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("\(completed) of \(total) lessons")
                    .font(.headline)
                ProgressView(value: percentage, total: 100)
                    .tint(.purple)
            }

            Spacer()

            Text("\(Int(percentage))%")
                .font(.title2.bold())
                .foregroundStyle(.purple)
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }

    private var modulesList: some View {
        VStack(spacing: 16) {
            ForEach(TutorialData.modules.sorted(by: { $0.order < $1.order })) { module in
                NavigationLink(destination: ModuleDetailView(module: module)) {
                    ModuleCard(module: module)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

struct ModuleCard: View {
    let module: TutorialModule
    @EnvironmentObject var progressManager: ProgressManager

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: module.iconName)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
                .background(.purple.gradient)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 4) {
                Text(module.title)
                    .font(.headline)
                    .foregroundStyle(.primary)

                Text(module.subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)

                let completed = module.lessons.filter { progressManager.isCompleted($0.id) }.count
                Text("\(completed)/\(module.lessons.count) completed")
                    .font(.caption2)
                    .foregroundStyle(.purple)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    HomeView()
        .environmentObject(ProgressManager())
}
