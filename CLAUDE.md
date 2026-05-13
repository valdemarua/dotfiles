# CLAUDE

See [AGENTS.md](AGENTS.md) for repository structure, conventions, and how to make changes.

## Claude-specific notes

- Memory for this project is stored in `~/dotfiles/.claude/memory/` (auto-managed by Claude Code).
- Project settings live in `.claude/settings.local.json` (gitignored — machine-specific permissions).
- There is no test suite. Verify shell scripts with `bash -n <script>` before committing.
