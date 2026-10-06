# Projects
Mỗi project mới có folder riêng, dùng [project report](../templates/project-report.md).

## Artifact contract
- README: problem, architecture, build/run, demo, limitations.
- Source + build configuration.
- Tests: requirement mapping, normal/boundary/error/recovery.
- Evidence: log thật, measurements và commit.
- Debug notes: hypothesis, root cause, fix và regression.

## Backlog — chưa triển khai
| Project idea | Outcome | Gate |
| --- | --- | --- |
| Linux data logger | Thu dữ liệu, xử lý I/O error, shutdown sạch | Test lỗi và tái hiện |
| Board service | Cross compile, deploy, start/restart service | Build/run trên board + log |
| Reproducible image | Ghi cấu hình, build image và boot verification | Clean build + checksum + boot evidence |

Chọn một project theo roadmap, chỉ chuyển sang project tiếp theo sau khi có evidence.
