# Conventions

Rules that keep this repository consistent, reproducible and safe to publish. `python tools/repo_check.py check` enforces the parts marked **(checked)**.

## Language

- Public entry points (README, CONVENTIONS, tooling, pull request descriptions) are written in English.
- Learning notes, lab guides and reports are written in Vietnamese with English technical terms.

## Layout and naming

| Item | Rule | Example |
| --- | --- | --- |
| Folders and files | kebab-case, ASCII | `c-cpp-foundation/function-pointer/` |
| Topic lab | `README.md` (guide, deep dive, AI split) + `REPORT.md` (results) per folder under `c-cpp-foundation/`, `arm-architecture/`, `linux-system/`, `linux-kernel/`, `hardware/` **(checked)** | `linux-kernel/device-tree/` |
| Weekly sprint | `sprints/YYYY-MM-DD_topic/` (Monday of the week) | `sprints/2026-10-05_linux-workstation/` |
| Daily log | `log/YYYY-MM.md`, one line per day: `YYYY-MM-DD · area · output · commit/link` **(checked)** | `log/2026-10.md` |
| Evidence | `YYYY-MM-DD_<board>_<topic>_<case>.<ext>` next to the report that uses it | `2026-11-07_mp2_boot_sdcard.log` |
| ADR | `docs/adr/NNNN-<decision>.md` | `docs/adr/0001-imu-transport.md` |
| Write-up | `docs/writeups/YYYY-MM-DD_<slug>.md` | — |
| LeetCode solution | `leetcode/<NN-topic>/NNNN-<slug>.c` or `.cpp` | `leetcode/01-arrays-hashing/0001-two-sum.c` |

## Status vocabulary (checked)

| Where | Allowed values |
| --- | --- |
| Topic `README.md` | `Not started`, `In progress`, `Blocked`, `Done` |
| Topic `REPORT.md` | `Not run`, `In progress`, `Blocked`, `Done` — `Done` requires a Pass/Fail row and an existing evidence link under Results |
| Result rows | `Pass`, `Fail`, `Not run` |
| `TRACKING.md` level | `L0`–`L4`; L2+ needs existing evidence, L3+ a verification date, L4 evidence under `projects/`, `debug-logs/`, `docs/` or `sprints/` |
| LeetCode result | `Not started`, `Solved`, `Solved có gợi ý`, `Verified`, `Chưa xong` |

## Evidence policy

- Record only output that was actually produced, with the exact command, environment (OS, compiler, board, image) and source commit.
- Review every log before committing: remove serial numbers, MAC addresses, internal IP addresses, user names and anything else that identifies a device or a person.
- Large artifacts (OS images, SDKs, video) are not committed; record their checksum and where they are stored.
- Internal links must resolve on GitHub, which is case-sensitive **(checked)**.

## Confidentiality

- Never commit material from an employer, a customer or a non-public product, and never commit secrets (keys, tokens, certificates).
- Commit messages and branch names are public too; the same rules apply to them.
- Keep a local, uncommitted denylist of terms that must never appear in this repository; the check and the pre-commit hook refuse matching content (see [tools](tools/README.md)).

## Code

| Language | Standard and style | Baseline flags |
| --- | --- | --- |
| C | C11; Linux kernel coding style (tabs, 8 columns); kernel code must pass `checkpatch.pl` | `-std=c11 -Wall -Wextra -Wpedantic -g` |
| C++ | C++17 (C++20 only where the toolchain allows it); 4-space indent | `-std=c++17 -Wall -Wextra -Wpedantic -g` |
| Python | PEP 8, standard library first | — |
| Shell | Bash, `set -u`, clean under `shellcheck --severity=warning` | — |

Use `-fsanitize=address,undefined` (or `thread`) wherever the toolchain supports it, and say so when it does not.

## Tests

- Every lab or project folder with code has a `Makefile` with a `check` target that builds and runs the host tests; CI runs `make check` wherever it is defined.
- Tests cover normal, boundary, error and, where relevant, recovery cases.
- Steps that need a board are documented with their evidence; they are not run in CI.

## Commits and pull requests

- [Conventional Commits](https://www.conventionalcommits.org/): `type(scope): summary`, with `type` one of `feat`, `fix`, `docs`, `test`, `build`, `ci`, `refactor`, `chore`.
- One logical change per commit; the body explains why when the summary cannot.
- Pull requests state which parts were drafted with AI and how they were verified ([approach](docs/ai-assisted-engineering.md)).
- Larger changes go through a branch and a pull request using the [template](.github/pull_request_template.md): what changed, why, how it was tested.
