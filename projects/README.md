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
| [Edge sensor + camera](stm32mp257f-dk_jetson-nano/README.md) | STM32MP257F-DK + Jetson Nano | Planned |

Project gồm phần nền BSP + driver (11/2026–03/2027), mini project network (04/2027), mini project camera (05/2027) và tích hợp + độ bền (06/2027).

## Backlog
Ba ý tưởng dưới đây được gộp vào project trên thay vì làm riêng.

| Project idea | Outcome | Gate | Gộp vào |
| --- | --- | --- | --- |
| Linux data logger | Thu dữ liệu, xử lý I/O error, shutdown sạch | Test lỗi và tái hiện | sensor-svc (04/2027) |
| Board service | Cross compile, deploy, start/restart service | Build/run trên board + log | systemd + watchdog (06/2027) |
| Reproducible image | Ghi cấu hình, build image và boot verification | Clean build + checksum + boot evidence | Yocto image STM32MP2 (03/2027, Cổng 1) |

Chọn một project theo roadmap, chỉ chuyển sang project tiếp theo sau khi có evidence.
