import Foundation

struct TutorialModule: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let iconName: String
    let lessons: [Lesson]
    let order: Int
}

struct Lesson: Identifiable {
    let id = UUID()
    let title: String
    let sections: [LessonSection]
    let quiz: Quiz?
}

struct LessonSection: Identifiable {
    let id = UUID()
    let heading: String
    let body: String
    let codeExample: CodeExample?
    let tip: String?
}

struct CodeExample: Identifiable {
    let id = UUID()
    let language: String
    let code: String
    let caption: String?
}

struct Quiz: Identifiable {
    let id = UUID()
    let questions: [QuizQuestion]
}

struct QuizQuestion: Identifiable {
    let id = UUID()
    let question: String
    let options: [String]
    let correctIndex: Int
    let explanation: String
}

struct CommandReference: Identifiable {
    let id = UUID()
    let command: String
    let description: String
    let category: String
    let example: String?
}
