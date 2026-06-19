import Foundation
import SwiftUI

class ProgressManager: ObservableObject {
    @Published var completedLessons: Set<String> = []
    @Published var quizScores: [String: Int] = [:]

    private let completedKey = "completedLessons"
    private let scoresKey = "quizScores"

    init() {
        load()
    }

    func markCompleted(_ lessonID: UUID) {
        completedLessons.insert(lessonID.uuidString)
        save()
    }

    func isCompleted(_ lessonID: UUID) -> Bool {
        completedLessons.contains(lessonID.uuidString)
    }

    func saveQuizScore(lessonID: UUID, score: Int) {
        quizScores[lessonID.uuidString] = score
        save()
    }

    func quizScore(for lessonID: UUID) -> Int? {
        quizScores[lessonID.uuidString]
    }

    var totalCompleted: Int {
        completedLessons.count
    }

    func completionPercentage(totalLessons: Int) -> Double {
        guard totalLessons > 0 else { return 0 }
        return Double(completedLessons.count) / Double(totalLessons) * 100
    }

    func resetProgress() {
        completedLessons.removeAll()
        quizScores.removeAll()
        save()
    }

    private func save() {
        UserDefaults.standard.set(Array(completedLessons), forKey: completedKey)
        UserDefaults.standard.set(quizScores, forKey: scoresKey)
    }

    private func load() {
        if let saved = UserDefaults.standard.stringArray(forKey: completedKey) {
            completedLessons = Set(saved)
        }
        if let saved = UserDefaults.standard.dictionary(forKey: scoresKey) as? [String: Int] {
            quizScores = saved
        }
    }
}
