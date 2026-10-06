# Projects
Mỗi project mới có folder riêng, dùng [project report](../templates/project-report.md).

## Artifact contract
- README: problem, architecture, build/run, demo, limitations.
- Source + build configuration.
- Tests: requirement mapping, normal/boundary/error/recovery.
- Evidence: log thật, measurements và commit.
- Debug notes: hypothesis, root cause, fix và regression.

## Đang triển khai
| Project | Boards | Trạng thái |
| --- | --- | --- |
| [Event-triggered edge capture](stm32mp257f-dk_jetson-nano/README.md) | STM32MP257F-DK + Jetson Nano | Planned |

## Backlog
Ba ý tưởng dưới đây được gộp thành milestone của project trên thay vì làm riêng.

| Project idea | Outcome | Gate | Gộp vào |
| --- | --- | --- | --- |
| Linux data logger | Thu dữ liệu, xử lý I/O error, shutdown sạch | Test lỗi và tái hiện | sensor-svc (M1–M2) |
| Board service | Cross compile, deploy, start/restart service | Build/run trên board + log | systemd units (M3) |
| Reproducible image | Ghi cấu hình, build image và boot verification | Clean build + checksum + boot evidence | Yocto image STM32MP2 (M3) |

Chọn một project theo roadmap, chỉ chuyển sang project tiếp theo sau khi có evidence.
