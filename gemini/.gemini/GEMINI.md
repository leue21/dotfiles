# Gemini Instructions

## Scope
This file applies to the entire repository unless a subdirectory contains its own `gemini.md`.

---

## Core Principles
- Be **precise, correct, and minimal**
- Prefer **working solutions over explanations**
- Assume the reader is **technical**
- Do not repeat the question
- Do not speculate; say “unknown” if unsure

---

## Environment Assumptions
- OS: macOS (ARM)
- Shell: zsh
- Editor: Neovim
- Java: OpenJDK 17+ (LTS)
- Build tools: Maven or Gradle
- Terminal-first workflow

---

## Output Rules
- **Code first, explanation second**
- No emojis
- No marketing language
- No unnecessary safety disclaimers
- Use Markdown only when it improves readability

---

## General Code Style
- Prefer explicit, readable code over cleverness
- Follow existing project conventions strictly
- Avoid introducing new dependencies unless necessary
- Show complete, compilable examples

---

## Java-Specific Guidelines

### Language & Version
- Assume **Java 17+**
- Prefer modern Java features:
  - `record` for immutable data carriers
  - `sealed` classes when modeling closed hierarchies
  - `var` for local variables when readability improves
- Do not suggest deprecated APIs

---

### Code Style
- Follow **Google Java Style** unless the project specifies otherwise
- Use meaningful names; avoid abbreviations
- Prefer immutability
- Avoid field injection; prefer constructor injection

---

### Exceptions & Error Handling
- Use **checked exceptions** only when recovery is realistic
- Do not swallow exceptions
- Prefer custom domain exceptions over `RuntimeException`
- Include meaningful messages; avoid empty catch blocks

---

### Collections & Streams
- Prefer **Streams** for transformations, not for control flow
- Avoid side effects inside stream operations
- Use `List.of`, `Map.of` for small immutable collections
- Choose concrete types carefully (`ArrayList`, `HashMap`)

---

### Concurrency
- Prefer `java.util.concurrent` abstractions
- Avoid manual thread management unless necessary
- Prefer immutability and thread confinement
- Use `CompletableFuture` for async workflows when appropriate

---

### Testing
- Prefer **JUnit 4**
- Use Hamcrest for assertions
- Tests should be deterministic and isolated
- Do not mock value objects
- Prefer constructor-based test setup

---

### Build Tools
- Respect existing build tool (Maven or Gradle)
- Do not mix build systems
- Prefer standard directory layout
- Use the tool’s idiomatic configuration style

---

### Documentation
- Use Javadoc for public APIs only
- Avoid redundant comments
- Document invariants and non-obvious behavior
- Do not restate method names in comments

---

## macOS-Specific Rules
- Prefer native tools (`defaults`, `launchctl`)
- Avoid Linux-only instructions
- Assume Apple Silicon

---

## When Unsure
- Ask **one concise clarifying question**
- Do not provide multiple speculative solutions

---

## Prohibited Behaviors
- Do not hallucinate classes, methods, or flags
- Do not invent APIs or JVM options
- Do not suggest GUI steps unless requested

---

## Preferred Answer Pattern
1. Minimal correct solution
2. Optional explanation (only if non-obvious)
3. Warnings only if there is real risk


## Editor & Keybinding Preferences (Vim-first)

### General Rule
- Prefer **Vim-style keybindings** in all configurations, examples, and recommendations
- Assume the user is fluent in Vim motions and modes
- Avoid GUI-first or mouse-driven workflows

---

### Configurations
- When a tool supports Vim keybindings natively, **enable them**
- Prefer Vim-style bindings over defaults:
  - `hjkl` for movement
  - `/` and `?` for search
  - `n` / `N` for navigation
  - `gg`, `G`, `%`, `*`, `#` where applicable

Examples:
- Neovim: native
- TUI tools: enable Vim mode if available
- Browsers / terminals / file managers: prefer Vim plugins or modes

---

### Keybinding Guidance
- Do not suggest arrow keys unless explicitly requested
- Do not suggest mouse interactions
- Prefer modal workflows
- Avoid conflicts with established Vim muscle memory

---

### Documentation & Explanations
- Describe actions using Vim terminology:
  - “move”, “yank”, “delete”, “change”, “visual”
- Prefer keystroke notation:
  - `dd`, `ciw`, `:%s/foo/bar/g`
- Use `<leader>` notation when relevant

---

### Tool Recommendations
- Prefer tools with good Vim integration or modes
- Avoid recommending tools that cannot be used efficiently without a mouse
- If no Vim bindings exist, state this explicitly

---

### Prohibited Suggestions
- Do not recommend Emacs-style keybindings
- Do not recommend arrow-key-centric workflows
- Do not suggest remapping Vim to behave like other editors

---

### Assumptions
- Neovim is the primary editor
- Vim keybindings are preferred even outside the editor
- Consistency of muscle memory is more important than discoverability
