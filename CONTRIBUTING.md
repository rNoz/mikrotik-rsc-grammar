# Contributing to the MikroTik RouterOS Script tree-sitter grammar

Thank you for contributing. This grammar is small, so a few lightweight rules keep review fast.

## How to propose a change

1. Open an issue first for grammar changes that add, rename, or remove nodes. Small query fixes and test additions may go straight to a PR.
2. One logical change per pull request. Split unrelated fixes into separate PRs.
3. Regenerate the parser (`npx tree-sitter generate`) and update or add corpus tests so `npx tree-sitter test` stays green.

## Writing issues and pull requests

- **Do not manually wrap lines in issue bodies or PR descriptions.** Each paragraph should be one continuous line in the source. GitHub reflows prose, so wrapping only creates ragged diffs and broken quoting. Wrapping at 80 columns is correct for code, commit messages, and `.md` files in the repo, but wrong for anything rendered on github.com.
- Use the issue/PR templates if they exist. Otherwise include:
  - What input currently parses incorrectly or what node is missing.
  - What you changed in `grammar.js` and why.
  - The new/updated parse output for the relevant corpus test.
  - `npx tree-sitter test` output.
- No emojis and no em dashes in published text. Use commas, parentheses, or separate sentences instead.
- Do not include personal paths, hostnames, emails, or other machine-specific identifiers in issue/PR bodies or screenshots. Use neutral placeholders such as `/tmp/demo.rsc`.

## Branch and commit style

- Conventional-commit subjects: `feat:`, `fix:`, `docs:`, `test:`, `refactor:`, `chore:`.
- Keep commits focused. Squash the feature to a single commit before opening the PR; follow-up review fixes go in one additional commit.
- Always include generated `src/parser.c`, `src/grammar.json`, and `src/node-types.json` when `grammar.js` changes, so consumers can use the grammar without running `tree-sitter generate`.

## Verification

```bash
npm install tree-sitter-cli
npx tree-sitter generate
npx tree-sitter test
```

All 59 corpus tests must pass. If you intentionally change parse output, run `npx tree-sitter test --update` and inspect the diff.

## Query files

Query files live in `queries/`. Any change to grammar node names must be reflected there. Test queries by copying them into a grammar checkout and running `npx tree-sitter test`.

## Code of conduct

Be constructive and direct. Keep discussions focused on the change at hand.
