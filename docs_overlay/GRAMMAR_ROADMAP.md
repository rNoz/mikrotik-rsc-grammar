# ROADMAP — MikroTik RSC Grammar (rNoz fork)

> Personal fork: `rNoz/mikrotik-rsc-grammar`  
> Upstream: `keiras94/mikrotik-rsc-grammar`  
> Downstream extension: `keiras94/mikrotik-zed` (operator fork: `rNoz/mikrotik-zed`)

This file tracks the grammar-side work and how it feeds the extension.

## Current state

The `rNoz` fork is ahead of upstream with the following changes already on `main`:

- `tree-sitter.json` has the required `name` field and points to the `rNoz` fork.
- Missing query files added: `brackets.scm`, `indents.scm`, `outline.scm`, `injections.scm`.
- `queries/highlights.scm` updated to match current grammar node names.
- `property=value` inside menu commands parses as `(named_param ...)`.
- `=` and `->` split into dedicated `assignment` and `arrow` tokens.
- `subexpression` interleaves operators/assignment/identifiers with values.
- All 59 tree-sitter corpus tests pass.

## Planned upstream contributions

See `.overlay/issues/` and `.overlay/prs/` for full draft text.

### PR 1: Grammar metadata and query completeness

- Target: `keiras94/mikrotik-rsc-grammar`
- Scope: Add `name` to `tree-sitter.json`, fix repository link, add missing query files, fix `highlights.scm` to use existing node names.
- Files: `tree-sitter.json`, `queries/*.scm`, generated parser.
- Cross-reference: Downstream PR draft at `rNoz/mikrotik-zed/.overlay/prs/align-queries-with-grammar.md`.

### PR 2: Parse `property=value` in menu commands

- Target: `keiras94/mikrotik-rsc-grammar`
- Scope: Modify `grammar.js` so `key=value` inside menu commands binds as `(named_param ...)`. Update corpus expectations and queries.
- Files: `grammar.js`, `src/parser.c`, `test/corpus/`, `queries/highlights.scm`.
- Cross-reference: Downstream PR draft at `rNoz/mikrotik-zed/.overlay/prs/align-queries-with-grammar.md`.

## Upstream coordination

- If upstream merges PR 1 and PR 2, the extension can be repointed from `rNoz/mikrotik-rsc-grammar` back to `keiras94/mikrotik-rsc-grammar`.
- If upstream is slow, keep the `rNoz` fork as the canonical grammar source and continue development there. The extension already points to it.

## Active upstream contributions

| PR | Repo | Status | What it does |
|---|---|---|---|
| `keiras94/mikrotik-rsc-grammar#2` | grammar | draft | Metadata/query completeness; cherry-picked into `overlay/integration` as `aad25c0`. |

Linked issue: `keiras94/mikrotik-rsc-grammar#1`.

## How to test right now

```bash
cd ~/projects/mikrotik-hub/mikrotik-rsc-grammar
git checkout overlay/integration
npx tree-sitter generate
npx tree-sitter test
```

Expected: 59/59 corpus tests pass.

## Cross-references

- `CONTRIBUTING.md` — contribution rules for this repo.
- `.overlay/PLAYBOOK.md` — how we prepare branches and PRs.
- `.overlay/INTEGRATION.md` — current integration branch state.
- `.overlay/NEXT.md` — immediate next steps.
- Sibling project plans: `~/projects/mikrotik-hub/mikrotik-zed/ROADMAP.md`.
