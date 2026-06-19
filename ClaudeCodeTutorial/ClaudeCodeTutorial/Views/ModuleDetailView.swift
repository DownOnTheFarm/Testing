import SwiftUI

struct ModuleDetailView: View {
    let module: TutorialModule
    @EnvironmentObject var progressManager: ProgressManager

    var body: some View {
        List {
            Section {
                HStack(spacing: 16) {
                    Image(systemName: module.iconName)
                        .font(.title)
                        .foregroundStyle(.purple)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(module.title)
                            .font(.title2.bold())
                        Text(module.subtitle)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(.vertical, 8)
            }

            Section("Lessons") {
                ForEach(module.lessons) { lesson in
                    NavigationLink(destination: LessonDetailView(lesson: lesson)) {
                        HStack {
                            Image(systemName: progressManager.isCompleted(lesson.id) ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(progressManager.isCompleted(lesson.id) ? .green : .secondary)

                            VStack(alignment: .leading, spacing: 2) {
                                Text(lesson.title)
                                    .font(.body)

                                if let quiz = lesson.quiz {
                                    Text("\(lesson.sections.count) sections \u{00B7} \(quiz.questions.count) quiz questions")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                } else {
                                    Text("\(lesson.sections.count) sections")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(module.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ModuleDetailView(module: TutorialData.modules[0])
            .environmentObject(ProgressManager())
    }
}
