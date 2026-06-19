import SwiftUI

struct QuizView: View {
    let quiz: Quiz
    let lessonID: UUID
    @EnvironmentObject var progressManager: ProgressManager
    @Environment(\.dismiss) var dismiss

    @State private var currentIndex = 0
    @State private var selectedAnswer: Int?
    @State private var showExplanation = false
    @State private var correctCount = 0
    @State private var quizFinished = false

    var body: some View {
        NavigationStack {
            VStack {
                if quizFinished {
                    resultsView
                } else {
                    questionView
                }
            }
            .navigationTitle("Quiz")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }

    private var questionView: some View {
        let question = quiz.questions[currentIndex]

        return VStack(spacing: 24) {
            ProgressView(value: Double(currentIndex + 1), total: Double(quiz.questions.count))
                .tint(.purple)
                .padding(.horizontal)

            Text("Question \(currentIndex + 1) of \(quiz.questions.count)")
                .font(.caption)
                .foregroundStyle(.secondary)

            Text(question.question)
                .font(.title3.bold())
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            VStack(spacing: 12) {
                ForEach(question.options.indices, id: \.self) { index in
                    Button {
                        guard selectedAnswer == nil else { return }
                        selectedAnswer = index
                        showExplanation = true
                        if index == question.correctIndex {
                            correctCount += 1
                        }
                    } label: {
                        HStack {
                            Text(question.options[index])
                                .font(.body)
                                .multilineTextAlignment(.leading)

                            Spacer()

                            if showExplanation {
                                if index == question.correctIndex {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(.green)
                                } else if index == selectedAnswer {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundStyle(.red)
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(backgroundColor(for: index, correctIndex: question.correctIndex))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(borderColor(for: index, correctIndex: question.correctIndex), lineWidth: 2)
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)

            if showExplanation {
                VStack(spacing: 16) {
                    Text(question.explanation)
                        .font(.callout)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)

                    Button {
                        if currentIndex < quiz.questions.count - 1 {
                            currentIndex += 1
                            selectedAnswer = nil
                            showExplanation = false
                        } else {
                            progressManager.saveQuizScore(lessonID: lessonID, score: correctCount)
                            quizFinished = true
                        }
                    } label: {
                        Text(currentIndex < quiz.questions.count - 1 ? "Next Question" : "See Results")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.purple)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .padding(.horizontal)
                }
            }

            Spacer()
        }
        .padding(.top)
    }

    private var resultsView: some View {
        VStack(spacing: 24) {
            Spacer()

            Image(systemName: correctCount == quiz.questions.count ? "star.circle.fill" : "checkmark.circle.fill")
                .font(.system(size: 64))
                .foregroundStyle(correctCount == quiz.questions.count ? .yellow : .purple)

            Text("Quiz Complete!")
                .font(.title.bold())

            Text("\(correctCount) out of \(quiz.questions.count) correct")
                .font(.title3)
                .foregroundStyle(.secondary)

            if correctCount == quiz.questions.count {
                Text("Perfect score!")
                    .font(.headline)
                    .foregroundStyle(.green)
            } else if correctCount > quiz.questions.count / 2 {
                Text("Great job!")
                    .font(.headline)
                    .foregroundStyle(.blue)
            } else {
                Text("Keep learning and try again!")
                    .font(.headline)
                    .foregroundStyle(.orange)
            }

            Spacer()

            Button {
                dismiss()
            } label: {
                Text("Done")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.purple)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
    }

    private func backgroundColor(for index: Int, correctIndex: Int) -> Color {
        guard showExplanation else { return Color(.systemBackground) }
        if index == correctIndex { return .green.opacity(0.15) }
        if index == selectedAnswer { return .red.opacity(0.15) }
        return Color(.systemBackground)
    }

    private func borderColor(for index: Int, correctIndex: Int) -> Color {
        guard showExplanation else {
            return index == selectedAnswer ? .purple : Color(.systemGray4)
        }
        if index == correctIndex { return .green }
        if index == selectedAnswer { return .red }
        return Color(.systemGray4)
    }
}

#Preview {
    QuizView(
        quiz: TutorialData.modules[0].lessons[0].quiz!,
        lessonID: TutorialData.modules[0].lessons[0].id
    )
    .environmentObject(ProgressManager())
}
