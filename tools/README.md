# Tools

## repo_check.py

Repository checks and progress report. Standard-library Python 3.9+, runs on Linux, macOS and Windows.

| Command | Purpose |
| --- | --- |
| `python tools/repo_check.py check` | Internal links and anchors, topic report structure and status values, `TRACKING.md` claims against their evidence, daily log format, local private denylist. Exits with status 1 on errors; runs in CI. |
| `python tools/repo_check.py progress` | Print the generated progress tables. |
| `python tools/repo_check.py progress --write` | Update the generated blocks in `README.md` and `leetcode/`. |
| `python tools/repo_check.py history` | List commits whose message, file paths or added lines match the private denylist. |

Warnings (overdue topics, topics due for re-verification, stale progress tables) never fail the check.

### Private denylist

Terms that must never appear in this public repository — for example employer, customer or unreleased product names — are kept outside the repository, one Python regular expression per line:

```text
~/.config/embedded-linux-roadmap/denylist.txt
```

Override the location with `--denylist PATH` or the `REPO_DENYLIST` environment variable. Matching is case-insensitive; wrap a term in `(?-i:...)` to make it case-sensitive; lines starting with `#` are comments. Never commit this file. CI does not have it, so run the check locally before pushing.

## Git hook

Run the checks before every commit:

```bash
git config core.hooksPath tools/hooks
```

The hook checks the working tree, so stage everything you intend to commit. Skip it once with `git commit --no-verify` only when you know why the check fails.
