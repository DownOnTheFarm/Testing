import Foundation

struct TutorialData {

    // MARK: - Modules

    static let modules: [TutorialModule] = [
        introductionModule,
        gettingStartedModule,
        coreFeaturesModule,
        advancedUsageModule,
        bestPracticesModule
    ]

    // MARK: - Command Reference

    static let commandReferences: [CommandReference] = [
        CommandReference(command: "/help", description: "Show help and available commands", category: "General", example: nil),
        CommandReference(command: "/clear", description: "Clear the conversation history", category: "General", example: nil),
        CommandReference(command: "/compact", description: "Compact the conversation to save context", category: "General", example: nil),
        CommandReference(command: "/config", description: "Open or modify configuration", category: "Settings", example: nil),
        CommandReference(command: "/init", description: "Initialize a CLAUDE.md file for the project", category: "Setup", example: nil),
        CommandReference(command: "/review", description: "Review a pull request", category: "Git", example: "/review"),
        CommandReference(command: "/cost", description: "Show token usage and cost for the session", category: "General", example: nil),
        CommandReference(command: "/doctor", description: "Check the health of your Claude Code setup", category: "Setup", example: nil),
        CommandReference(command: "/model", description: "Switch the AI model", category: "Settings", example: "/model sonnet"),
        CommandReference(command: "/permissions", description: "View or modify tool permissions", category: "Settings", example: nil),
        CommandReference(command: "/memory", description: "Edit CLAUDE.md memory files", category: "Settings", example: nil),
        CommandReference(command: "Esc", description: "Cancel the current operation", category: "Controls", example: nil),
        CommandReference(command: "Shift+Tab", description: "Toggle between Plan and Act modes", category: "Controls", example: nil),
        CommandReference(command: "#", description: "Add a file to context", category: "Context", example: "# src/app.ts"),
        CommandReference(command: "@", description: "Reference a URL or resource", category: "Context", example: "@ https://docs.example.com"),
        CommandReference(command: "!", description: "Run a bash command inline", category: "Controls", example: "! npm test"),
    ]

    // MARK: - Module 1: Introduction

    static let introductionModule = TutorialModule(
        title: "Introduction",
        subtitle: "What is Claude Code and why use it",
        iconName: "star.fill",
        lessons: [
            Lesson(
                title: "What is Claude Code?",
                sections: [
                    LessonSection(
                        heading: "Overview",
                        body: "Claude Code is an agentic coding tool made by Anthropic that lives in your terminal. It can understand your entire codebase, edit files, run commands, search the web, and help you accomplish complex software engineering tasks through natural language conversation.",
                        codeExample: nil,
                        tip: nil
                    ),
                    LessonSection(
                        heading: "How It Works",
                        body: "When you start Claude Code, it opens an interactive session in your terminal. You type natural language requests, and Claude reads your files, understands the context, makes edits, runs tests, and iterates until the task is complete. It operates directly in your project directory with access to your real files and tools.",
                        codeExample: nil,
                        tip: "Claude Code works best when you start it from the root of your project directory."
                    ),
                    LessonSection(
                        heading: "Key Capabilities",
                        body: """
                        Claude Code can:

                        - Read and understand your entire codebase
                        - Edit files with precise, targeted changes
                        - Run terminal commands (tests, builds, linters)
                        - Search the web for documentation
                        - Manage git operations (commits, PRs, branches)
                        - Debug errors by reading logs and stack traces
                        - Refactor code across multiple files
                        - Answer questions about how your code works
                        """,
                        codeExample: nil,
                        tip: nil
                    )
                ],
                quiz: Quiz(questions: [
                    QuizQuestion(
                        question: "Where does Claude Code run?",
                        options: ["In a web browser", "In your terminal", "In a mobile app", "In a cloud IDE only"],
                        correctIndex: 1,
                        explanation: "Claude Code is a terminal-based tool. You run it from the command line in your project directory."
                    ),
                    QuizQuestion(
                        question: "What can Claude Code do with your files?",
                        options: ["Only read them", "Only create new files", "Read, edit, and create files", "Nothing - it only gives advice"],
                        correctIndex: 2,
                        explanation: "Claude Code can read your existing files, make targeted edits, and create new files as needed."
                    )
                ])
            ),
            Lesson(
                title: "Where Claude Code Runs",
                sections: [
                    LessonSection(
                        heading: "Multiple Environments",
                        body: "Claude Code is available in several forms: as a CLI tool in your terminal, as a desktop app for Mac and Windows, as a web app at claude.ai/code, and as IDE extensions for VS Code and JetBrains. Each gives you the same powerful coding assistant.",
                        codeExample: nil,
                        tip: nil
                    ),
                    LessonSection(
                        heading: "Terminal CLI",
                        body: "The original and most powerful way to use Claude Code. Install it globally via npm, then run 'claude' in any project directory. You get full access to your filesystem, terminal commands, and git.",
                        codeExample: CodeExample(
                            language: "bash",
                            code: "npm install -g @anthropic-ai/claude-code\ncd your-project\nclaude",
                            caption: "Installing and starting Claude Code"
                        ),
                        tip: nil
                    ),
                    LessonSection(
                        heading: "Web and Desktop",
                        body: "Claude Code on the web (claude.ai/code) runs in a remote container with your GitHub repos cloned automatically. The desktop app brings Claude Code to a native window on Mac or Windows. Both provide the same conversational coding experience.",
                        codeExample: nil,
                        tip: "The web version is great for working on the go without a local development setup."
                    )
                ],
                quiz: nil
            )
        ],
        order: 0
    )

    // MARK: - Module 2: Getting Started

    static let gettingStartedModule = TutorialModule(
        title: "Getting Started",
        subtitle: "Installation, setup, and your first session",
        iconName: "play.circle.fill",
        lessons: [
            Lesson(
                title: "Installation",
                sections: [
                    LessonSection(
                        heading: "Prerequisites",
                        body: "To use Claude Code CLI, you need Node.js version 18 or later installed on your system. You also need an Anthropic API key or a Claude Pro/Team/Enterprise subscription.",
                        codeExample: nil,
                        tip: "Check your Node version with 'node --version' in the terminal."
                    ),
                    LessonSection(
                        heading: "Install via npm",
                        body: "Install Claude Code globally using npm. This makes the 'claude' command available from any directory on your system.",
                        codeExample: CodeExample(
                            language: "bash",
                            code: "npm install -g @anthropic-ai/claude-code",
                            caption: "Global installation"
                        ),
                        tip: nil
                    ),
                    LessonSection(
                        heading: "Authentication",
                        body: "The first time you run Claude Code, it will prompt you to authenticate. You can sign in with your Anthropic account or provide an API key. Claude Code will guide you through the process.",
                        codeExample: CodeExample(
                            language: "bash",
                            code: "# Start Claude Code - it will prompt for auth on first run\nclaude\n\n# Or set your API key as an environment variable\nexport ANTHROPIC_API_KEY=sk-ant-...",
                            caption: "Authentication options"
                        ),
                        tip: nil
                    )
                ],
                quiz: Quiz(questions: [
                    QuizQuestion(
                        question: "What is the minimum Node.js version required?",
                        options: ["Node 14", "Node 16", "Node 18", "Node 20"],
                        correctIndex: 2,
                        explanation: "Claude Code requires Node.js version 18 or later."
                    )
                ])
            ),
            Lesson(
                title: "Your First Session",
                sections: [
                    LessonSection(
                        heading: "Starting a Session",
                        body: "Navigate to your project directory and type 'claude' to start an interactive session. Claude Code will analyze your project structure and be ready to help.",
                        codeExample: CodeExample(
                            language: "bash",
                            code: "cd ~/my-project\nclaude",
                            caption: "Starting your first session"
                        ),
                        tip: nil
                    ),
                    LessonSection(
                        heading: "Asking Your First Question",
                        body: "Once the session starts, just type your request in plain English. Start with something simple like asking Claude to explain your project structure or a specific file.",
                        codeExample: CodeExample(
                            language: "text",
                            code: "> Explain the architecture of this project\n\n> What does the main function in src/index.ts do?\n\n> Find all the API endpoints in this codebase",
                            caption: "Example first prompts"
                        ),
                        tip: "Start with read-only questions to get comfortable before asking Claude to make changes."
                    ),
                    LessonSection(
                        heading: "Understanding Permissions",
                        body: "Claude Code asks for your permission before taking actions like editing files or running commands. You can approve individually, or allow certain tools to run automatically. This keeps you in control of what changes are made to your project.",
                        codeExample: nil,
                        tip: "You can configure permission settings with /permissions to allow commonly-used tools to run without prompting."
                    )
                ],
                quiz: nil
            ),
            Lesson(
                title: "One-Shot Commands",
                sections: [
                    LessonSection(
                        heading: "Quick Tasks Without a Session",
                        body: "You don't always need an interactive session. Use the -p flag to send a single prompt and get a response, perfect for quick tasks like generating a commit message or asking a fast question.",
                        codeExample: CodeExample(
                            language: "bash",
                            code: "# Ask a quick question\nclaude -p \"What does this project do?\"\n\n# Generate a commit message\ngit diff --staged | claude -p \"Write a commit message for these changes\"\n\n# Pipe input for processing\ncat error.log | claude -p \"What's causing these errors?\"",
                            caption: "One-shot command examples"
                        ),
                        tip: nil
                    ),
                    LessonSection(
                        heading: "Piping and Scripting",
                        body: "Claude Code works great in shell pipelines. You can pipe file contents, command output, or any text into Claude for analysis. This makes it easy to integrate into your existing workflow and scripts.",
                        codeExample: CodeExample(
                            language: "bash",
                            code: "# Analyze test failures\nnpm test 2>&1 | claude -p \"Fix these test failures\"\n\n# Review a diff\ngit diff main | claude -p \"Review this diff for bugs\"\n\n# Process with output format\nclaude -p \"List all TODO comments\" --output-format json",
                            caption: "Pipeline integration examples"
                        ),
                        tip: nil
                    )
                ],
                quiz: Quiz(questions: [
                    QuizQuestion(
                        question: "Which flag sends a single prompt without starting an interactive session?",
                        options: ["-s", "-q", "-p", "-o"],
                        correctIndex: 2,
                        explanation: "The -p flag (for 'prompt') lets you send a single prompt and get back a response without entering interactive mode."
                    )
                ])
            )
        ],
        order: 1
    )

    // MARK: - Module 3: Core Features

    static let coreFeaturesModule = TutorialModule(
        title: "Core Features",
        subtitle: "File editing, debugging, and git operations",
        iconName: "hammer.fill",
        lessons: [
            Lesson(
                title: "Reading and Editing Files",
                sections: [
                    LessonSection(
                        heading: "How Claude Reads Code",
                        body: "Claude Code can read any file in your project. It uses tools like Grep, Glob, and Read to search through your codebase. You don't need to manually point it to files \u{2014} just describe what you're looking for and Claude will find the relevant code.",
                        codeExample: CodeExample(
                            language: "text",
                            code: "> Where is the user authentication logic?\n\n> Show me how the database connection is configured\n\n> Find all files that import the UserService class",
                            caption: "Claude finds files for you"
                        ),
                        tip: nil
                    ),
                    LessonSection(
                        heading: "Making Edits",
                        body: "When you ask Claude to change code, it makes precise, targeted edits. It shows you exactly what will change and asks for approval before writing. Edits use a search-and-replace approach that modifies only the specific lines that need to change.",
                        codeExample: CodeExample(
                            language: "text",
                            code: "> Add input validation to the signup form\n\n> Rename the 'getData' function to 'fetchUserProfile' and update all callers\n\n> Convert this class component to a functional component with hooks",
                            caption: "Example edit requests"
                        ),
                        tip: "Be specific about what you want changed. 'Fix the bug in the login function' works better than 'fix the bug'."
                    ),
                    LessonSection(
                        heading: "Multi-File Changes",
                        body: "Claude Code excels at changes that span multiple files. Whether it's a refactor that touches dozens of files, adding a new feature with models/views/controllers, or renaming a concept across the codebase, Claude handles the coordination.",
                        codeExample: CodeExample(
                            language: "text",
                            code: "> Add a new 'archived' status to the Task model, update the API, the frontend, and the tests\n\n> Refactor the payment processing to use the Strategy pattern",
                            caption: "Multi-file change requests"
                        ),
                        tip: nil
                    )
                ],
                quiz: nil
            ),
            Lesson(
                title: "Running Commands",
                sections: [
                    LessonSection(
                        heading: "Terminal Commands",
                        body: "Claude Code can run shell commands on your behalf \u{2014} tests, builds, linters, package managers, and more. It asks permission before running each command, and you can see the full output.",
                        codeExample: CodeExample(
                            language: "text",
                            code: "> Run the tests and fix any failures\n\n> Install the axios package and update the imports\n\n> Build the project and resolve any TypeScript errors",
                            caption: "Claude runs commands for you"
                        ),
                        tip: nil
                    ),
                    LessonSection(
                        heading: "Inline Shell Commands",
                        body: "You can run a quick shell command directly by prefixing it with '!' in the Claude Code prompt. The output goes into the conversation so Claude can reason about it.",
                        codeExample: CodeExample(
                            language: "text",
                            code: "> ! npm test\n> ! git status\n> ! ls -la src/",
                            caption: "Inline shell commands with !"
                        ),
                        tip: nil
                    ),
                    LessonSection(
                        heading: "Iterative Debugging",
                        body: "One of Claude Code's strengths is iterative debugging. Ask it to run your tests, and if they fail, Claude will read the errors, diagnose the issue, make fixes, and re-run the tests \u{2014} repeating until everything passes.",
                        codeExample: CodeExample(
                            language: "text",
                            code: "> Run the test suite. If any tests fail, fix the code and re-run until they all pass.",
                            caption: "Iterative test fixing"
                        ),
                        tip: "This loop of run-diagnose-fix-rerun is where Claude Code really shines."
                    )
                ],
                quiz: Quiz(questions: [
                    QuizQuestion(
                        question: "How do you run an inline shell command in Claude Code?",
                        options: ["Prefix with $", "Prefix with !", "Prefix with >", "Use the /run command"],
                        correctIndex: 1,
                        explanation: "Prefixing a command with ! runs it as a shell command and feeds the output into the conversation."
                    )
                ])
            ),
            Lesson(
                title: "Git Operations",
                sections: [
                    LessonSection(
                        heading: "Commits and Messages",
                        body: "Claude Code can handle your entire git workflow. Ask it to commit your changes and it will analyze the diff, write a descriptive commit message, and create the commit. It follows conventional commit style and writes messages that explain the 'why' not just the 'what'.",
                        codeExample: CodeExample(
                            language: "text",
                            code: "> Commit my changes with a descriptive message\n\n> Stage only the files related to the auth fix and commit them",
                            caption: "Git commit examples"
                        ),
                        tip: nil
                    ),
                    LessonSection(
                        heading: "Pull Requests",
                        body: "Claude Code can create pull requests complete with a title, summary, and test plan. It examines all the commits on your branch and generates a comprehensive PR description.",
                        codeExample: CodeExample(
                            language: "text",
                            code: "> Create a pull request for this branch\n\n> Create a PR with a detailed description of the changes",
                            caption: "PR creation"
                        ),
                        tip: nil
                    ),
                    LessonSection(
                        heading: "Code Review",
                        body: "Use the /review command to have Claude review a pull request. It will examine the diff, identify potential issues, and provide feedback. You can also ask Claude to review specific aspects like security, performance, or style.",
                        codeExample: CodeExample(
                            language: "text",
                            code: "> /review\n\n> Review this PR for security vulnerabilities\n\n> Check if there are any edge cases we're missing",
                            caption: "Code review commands"
                        ),
                        tip: nil
                    )
                ],
                quiz: nil
            )
        ],
        order: 2
    )

    // MARK: - Module 4: Advanced Usage

    static let advancedUsageModule = TutorialModule(
        title: "Advanced Usage",
        subtitle: "CLAUDE.md, MCP, hooks, and configuration",
        iconName: "gearshape.2.fill",
        lessons: [
            Lesson(
                title: "CLAUDE.md \u{2014} Project Memory",
                sections: [
                    LessonSection(
                        heading: "What is CLAUDE.md?",
                        body: "CLAUDE.md is a special file that gives Claude Code persistent instructions about your project. It's like a briefing document that Claude reads at the start of every session. Put it in your project root to share conventions, architecture decisions, and preferred patterns with Claude.",
                        codeExample: CodeExample(
                            language: "markdown",
                            code: """
                            # CLAUDE.md

                            ## Project Overview
                            This is a Next.js e-commerce app using TypeScript and Prisma.

                            ## Code Conventions
                            - Use functional components with hooks
                            - All API routes go in src/app/api/
                            - Use Zod for input validation
                            - Write tests for all new features

                            ## Common Commands
                            - `npm run dev` - Start development server
                            - `npm test` - Run test suite
                            - `npm run lint` - Run ESLint
                            """,
                            caption: "Example CLAUDE.md file"
                        ),
                        tip: "Use /init to generate a starter CLAUDE.md file automatically."
                    ),
                    LessonSection(
                        heading: "Multiple CLAUDE.md Files",
                        body: "You can place CLAUDE.md files at different levels: in your home directory (~/.claude/CLAUDE.md) for global preferences, in the project root for project-wide instructions, and in subdirectories for area-specific guidance. Claude reads all applicable files.",
                        codeExample: nil,
                        tip: "Keep CLAUDE.md concise. Claude reads it on every session start, so long files waste context."
                    )
                ],
                quiz: Quiz(questions: [
                    QuizQuestion(
                        question: "What is the purpose of CLAUDE.md?",
                        options: [
                            "To document the project for humans",
                            "To give Claude persistent instructions about your project",
                            "To configure Claude Code settings",
                            "To store conversation history"
                        ],
                        correctIndex: 1,
                        explanation: "CLAUDE.md provides persistent instructions that Claude reads at the start of every session, like coding conventions, project structure, and preferred patterns."
                    )
                ])
            ),
            Lesson(
                title: "MCP Servers",
                sections: [
                    LessonSection(
                        heading: "What is MCP?",
                        body: "The Model Context Protocol (MCP) lets Claude Code connect to external tools and services. MCP servers provide additional capabilities like accessing databases, interacting with APIs, reading from Google Drive, or connecting to Slack.",
                        codeExample: nil,
                        tip: nil
                    ),
                    LessonSection(
                        heading: "Adding MCP Servers",
                        body: "You can add MCP servers through the Claude Code settings or by using the 'claude mcp add' command. Once connected, Claude can use the tools provided by the MCP server just like its built-in tools.",
                        codeExample: CodeExample(
                            language: "bash",
                            code: "# Add an MCP server\nclaude mcp add my-server -- npx my-mcp-server\n\n# List configured servers\nclaude mcp list\n\n# Remove a server\nclaude mcp remove my-server",
                            caption: "Managing MCP servers"
                        ),
                        tip: nil
                    ),
                    LessonSection(
                        heading: "Popular MCP Servers",
                        body: "Common MCP servers include GitHub (for repo operations), Google Drive (for document access), PostgreSQL and other database connectors, and custom servers you build for your own APIs. The MCP ecosystem is growing rapidly.",
                        codeExample: nil,
                        tip: "You can build your own MCP servers to give Claude access to your internal tools and services."
                    )
                ],
                quiz: nil
            ),
            Lesson(
                title: "Hooks",
                sections: [
                    LessonSection(
                        heading: "What are Hooks?",
                        body: "Hooks are shell commands that run automatically in response to Claude Code events. They let you customize behavior \u{2014} for example, running a linter after every file edit, or sending a notification when a task completes.",
                        codeExample: nil,
                        tip: nil
                    ),
                    LessonSection(
                        heading: "Configuring Hooks",
                        body: "Hooks are configured in your settings.json file. Each hook specifies an event (like 'afterEdit' or 'afterCommand') and a command to run. You can set them up via /config or by editing the settings file directly.",
                        codeExample: CodeExample(
                            language: "json",
                            code: """
                            {
                              "hooks": {
                                "afterEdit": [
                                  {
                                    "command": "npx prettier --write $FILE",
                                    "description": "Format file after edit"
                                  }
                                ]
                              }
                            }
                            """,
                            caption: "Example hook configuration"
                        ),
                        tip: "Hooks run with the same permissions as your terminal, so be careful with what you automate."
                    )
                ],
                quiz: nil
            ),
            Lesson(
                title: "Plan Mode",
                sections: [
                    LessonSection(
                        heading: "Planning Before Acting",
                        body: "Plan mode lets you ask Claude to think through an approach before making any changes. Press Shift+Tab to toggle between Plan and Act modes. In Plan mode, Claude will analyze the problem and propose a strategy without editing any files.",
                        codeExample: CodeExample(
                            language: "text",
                            code: "> [Plan mode] How should we restructure the authentication system to support OAuth?\n\nClaude will analyze the codebase and propose:\n1. Which files need to change\n2. What new files to create\n3. The order of operations\n4. Potential risks and trade-offs",
                            caption: "Using Plan mode"
                        ),
                        tip: nil
                    ),
                    LessonSection(
                        heading: "When to Use Plan Mode",
                        body: "Use Plan mode for large refactors, architectural decisions, or when you want to understand the scope of a change before committing to it. Once you're happy with the plan, switch back to Act mode and ask Claude to execute it.",
                        codeExample: nil,
                        tip: "Plan mode is especially useful for unfamiliar codebases where you want to understand the impact of changes."
                    )
                ],
                quiz: Quiz(questions: [
                    QuizQuestion(
                        question: "How do you toggle Plan mode?",
                        options: ["/plan", "Shift+Tab", "Ctrl+P", "/mode plan"],
                        correctIndex: 1,
                        explanation: "Press Shift+Tab to toggle between Plan mode and Act mode."
                    )
                ])
            )
        ],
        order: 3
    )

    // MARK: - Module 5: Best Practices

    static let bestPracticesModule = TutorialModule(
        title: "Best Practices",
        subtitle: "Tips for getting the most out of Claude Code",
        iconName: "lightbulb.fill",
        lessons: [
            Lesson(
                title: "Writing Effective Prompts",
                sections: [
                    LessonSection(
                        heading: "Be Specific",
                        body: "The more specific your request, the better the result. Instead of 'fix the bug', say 'fix the null pointer exception in UserService.getProfile() that occurs when the user has no avatar set'. Include file names, function names, and error messages when you have them.",
                        codeExample: CodeExample(
                            language: "text",
                            code: "Bad:  Fix the login bug\nGood: Fix the login bug where users with special characters in their\n      email (like user+tag@example.com) get a 400 error from the\n      /api/auth/login endpoint",
                            caption: "Specific vs. vague prompts"
                        ),
                        tip: nil
                    ),
                    LessonSection(
                        heading: "Provide Context",
                        body: "Give Claude the context it needs. Mention the framework, language version, or constraints that matter. If there's a related issue or PR, reference it. If you want a specific approach, say so.",
                        codeExample: CodeExample(
                            language: "text",
                            code: "> Add rate limiting to the API endpoints. We're using Express\n  with Redis for caching. Use the express-rate-limit package\n  and store the rate limit data in our existing Redis instance.\n  Limit to 100 requests per minute per IP.",
                            caption: "Providing helpful context"
                        ),
                        tip: nil
                    ),
                    LessonSection(
                        heading: "Use the # Shortcut",
                        body: "Use # followed by a filename to add specific files to Claude's context. This is faster than asking Claude to find files and ensures it's looking at the right code.",
                        codeExample: CodeExample(
                            language: "text",
                            code: "> # src/services/auth.ts\n  Add a method to check if a session token has expired.\n  Follow the same pattern as the existing validateToken method.",
                            caption: "Using # to add files to context"
                        ),
                        tip: nil
                    )
                ],
                quiz: nil
            ),
            Lesson(
                title: "Project Setup Tips",
                sections: [
                    LessonSection(
                        heading: "Start with /init",
                        body: "When using Claude Code with a new project, run /init first. This creates a CLAUDE.md file with key information about your project that Claude will reference in every session.",
                        codeExample: nil,
                        tip: nil
                    ),
                    LessonSection(
                        heading: "Keep Tests Runnable",
                        body: "Claude Code is most effective when it can run your test suite. Make sure your tests can run with a simple command, and document that command in your CLAUDE.md. This lets Claude verify its changes work correctly.",
                        codeExample: CodeExample(
                            language: "markdown",
                            code: """
                            # In your CLAUDE.md:

                            ## Testing
                            - Run all tests: `npm test`
                            - Run a single test: `npm test -- --grep "test name"`
                            - Run with coverage: `npm run test:coverage`
                            """,
                            caption: "Documenting test commands in CLAUDE.md"
                        ),
                        tip: nil
                    ),
                    LessonSection(
                        heading: "Commit the .gitignore",
                        body: "Claude Code respects your .gitignore. Make sure it's properly configured so Claude doesn't accidentally read or modify generated files, node_modules, or build artifacts.",
                        codeExample: nil,
                        tip: nil
                    )
                ],
                quiz: nil
            ),
            Lesson(
                title: "Workflow Patterns",
                sections: [
                    LessonSection(
                        heading: "The Explore-Plan-Code-Verify Pattern",
                        body: "For complex tasks, use this pattern: First, ask Claude to explore the relevant code. Then switch to Plan mode and ask for a plan. Review the plan, then switch to Act mode and execute. Finally, ask Claude to run the tests to verify.",
                        codeExample: CodeExample(
                            language: "text",
                            code: "Step 1: \"Explore the authentication system and explain how login works\"\nStep 2: [Shift+Tab to Plan mode] \"Plan how to add OAuth support\"\nStep 3: [Review plan, Shift+Tab to Act mode] \"Implement the plan\"\nStep 4: \"Run the tests and fix any failures\"",
                            caption: "Explore-Plan-Code-Verify workflow"
                        ),
                        tip: nil
                    ),
                    LessonSection(
                        heading: "Using /compact for Long Sessions",
                        body: "During long sessions, Claude's context window fills up. Use /compact to summarize the conversation and free up space. This lets you continue working without starting a new session.",
                        codeExample: nil,
                        tip: "Use /compact proactively when you notice Claude starting to forget earlier context."
                    ),
                    LessonSection(
                        heading: "Resume Previous Sessions",
                        body: "Claude Code can resume where you left off. Use 'claude --resume' to continue your last session, or 'claude --continue' to start a new session but carry over the context from the previous one.",
                        codeExample: CodeExample(
                            language: "bash",
                            code: "# Resume the last session exactly where you left off\nclaude --resume\n\n# Continue with context from the last session\nclaude --continue",
                            caption: "Resuming sessions"
                        ),
                        tip: nil
                    )
                ],
                quiz: Quiz(questions: [
                    QuizQuestion(
                        question: "What does /compact do?",
                        options: [
                            "Minimizes the terminal window",
                            "Compresses your project files",
                            "Summarizes the conversation to free up context space",
                            "Removes unused imports from your code"
                        ],
                        correctIndex: 2,
                        explanation: "/compact summarizes the current conversation to free up context window space, letting you continue working in a long session."
                    ),
                    QuizQuestion(
                        question: "Which flag resumes the last Claude Code session?",
                        options: ["--last", "--resume", "--continue", "--restore"],
                        correctIndex: 1,
                        explanation: "Use 'claude --resume' to continue your last session exactly where you left off."
                    )
                ])
            )
        ],
        order: 4
    )

    static var totalLessonCount: Int {
        modules.reduce(0) { $0 + $1.lessons.count }
    }
}
