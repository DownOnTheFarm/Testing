import SwiftUI

struct CodeBlockView: View {
    let example: CodeExample

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(example.language)
                    .font(.caption.monospaced())
                    .foregroundStyle(.secondary)

                Spacer()

                Button {
                    UIPasteboard.general.string = example.code
                } label: {
                    Image(systemName: "doc.on.doc")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color(.systemGray5))

            Text(example.code)
                .font(.system(.callout, design: .monospaced))
                .padding(12)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemGray6))

            if let caption = example.caption {
                Text(caption)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(.systemGray5))
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 1)
        )
    }
}

#Preview {
    CodeBlockView(example: CodeExample(
        language: "bash",
        code: "npm install -g @anthropic-ai/claude-code\ncd your-project\nclaude",
        caption: "Installing Claude Code"
    ))
    .padding()
}
