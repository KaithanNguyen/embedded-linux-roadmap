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

Project chạy theo kiểu walking skeleton: hệ thống tối thiểu IMU → driver → service C → TCP → laptop chạy từ 12/2026, sau đó mỗi tháng thay hoặc nâng một phần (driver tự viết, image Yocto, Jetson + mTLS, camera) và đo lại; 06/2027 chỉ ổn định và hoàn thiện. Độ bền và bảo mật được test cùng lúc với tính năng.

## Backlog
Ba ý tưởng dưới đây được gộp vào project trên thay vì làm riêng.

| Project idea | Outcome | Gate | Gộp vào |
| --- | --- | --- | --- |
| Linux data logger | Thu dữ liệu, xử lý I/O error, shutdown sạch | Test lỗi và tái hiện | sensor-svc (12/2026) |
| Board service | Cross compile, deploy, start/restart service | Build/run trên board + log | systemd + watchdog (01/2027) |
| Reproducible image | Ghi cấu hình, build image và boot verification | Clean build + checksum + boot evidence | Yocto image STM32MP2 (03/2027, Cổng 1) |

Chọn một project theo roadmap, chỉ chuyển sang project tiếp theo sau khi có evidence.
