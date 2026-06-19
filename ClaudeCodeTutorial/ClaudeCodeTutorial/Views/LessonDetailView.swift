import SwiftUI

struct LessonDetailView: View {
    let lesson: Lesson
    @EnvironmentObject var progressManager: ProgressManager
    @State private var showQuiz = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                ForEach(lesson.sections) { section in
                    LessonSectionView(section: section)
                }

                if let quiz = lesson.quiz {
                    quizButton(quiz: quiz)
                }

                completeButton
            }
            .padding()
        }
        .navigationTitle(lesson.title)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showQuiz) {
            if let quiz = lesson.quiz {
                QuizView(quiz: quiz, lessonID: lesson.id)
            }
        }
    }

    private func quizButton(quiz: Quiz) -> some View {
        Button {
            showQuiz = true
        } label: {
            HStack {
                Image(systemName: "questionmark.circle.fill")
                    .font(.title3)

                VStack(alignment: .leading) {
                    Text("Take the Quiz")
                        .font(.headline)
                    Text("\(quiz.questions.count) questions")
                        .font(.caption)
                }

                Spacer()

                if let score = progressManager.quizScore(for: lesson.id) {
                    Text("\(score)/\(quiz.questions.count)")
                        .font(.headline)
                        .foregroundStyle(.green)
                } else {
                    Image(systemName: "chevron.right")
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(.purple.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .buttonStyle(.plain)
    }

    private var completeButton: some View {
        Button {
            progressManager.markCompleted(lesson.id)
        } label: {
            HStack {
                Image(systemName: progressManager.isCompleted(lesson.id) ? "checkmark.circle.fill" : "circle")
                Text(progressManager.isCompleted(lesson.id) ? "Completed" : "Mark as Complete")
            }
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding()
            .background(progressManager.isCompleted(lesson.id) ? .green : .purple)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding(.bottom)
    }
}

struct LessonSectionView: View {
    let section: LessonSection

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(section.heading)
                .font(.title3.bold())

            Text(section.body)
                .font(.body)
                .foregroundStyle(.primary)

            if let codeExample = section.codeExample {
                CodeBlockView(example: codeExample)
            }

            if let tip = section.tip {
                TipView(text: tip)
            }
        }
    }
}

struct TipView: View {
    let text: String

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "lightbulb.fill")
                .foregroundStyle(.yellow)

            Text(text)
                .font(.callout)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.yellow.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    NavigationStack {
        LessonDetailView(lesson: TutorialData.modules[0].lessons[0])
            .environmentObject(ProgressManager())
    }
}
