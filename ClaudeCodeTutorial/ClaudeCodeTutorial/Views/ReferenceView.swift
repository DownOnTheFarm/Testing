import SwiftUI

struct ReferenceView: View {
    @State private var searchText = ""

    private var categories: [String] {
        let allCategories = Set(TutorialData.commandReferences.map { $0.category })
        return allCategories.sorted()
    }

    private var filteredCommands: [CommandReference] {
        if searchText.isEmpty {
            return TutorialData.commandReferences
        }
        return TutorialData.commandReferences.filter {
            $0.command.localizedCaseInsensitiveContains(searchText) ||
            $0.description.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(categories, id: \.self) { category in
                    let commands = filteredCommands.filter { $0.category == category }
                    if !commands.isEmpty {
                        Section(category) {
                            ForEach(commands) { ref in
                                CommandRow(reference: ref)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Quick Reference")
            .searchable(text: $searchText, prompt: "Search commands")
        }
    }
}

struct CommandRow: View {
    let reference: CommandReference

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(reference.command)
                .font(.system(.body, design: .monospaced))
                .fontWeight(.semibold)
                .foregroundStyle(.purple)

            Text(reference.description)
                .font(.subheadline)
                .foregroundStyle(.primary)

            if let example = reference.example {
                Text(example)
                    .font(.system(.caption, design: .monospaced))
                    .foregroundStyle(.secondary)
                    .padding(6)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ReferenceView()
}
