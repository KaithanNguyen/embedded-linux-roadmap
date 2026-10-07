# Lab: Interrupts & deferred work
Status: Not run

## Goal
Driver nhận ngắt INT1 (data-ready) bằng threaded IRQ, đọc mẫu qua I2C trong thread, đẩy vào kfifo; đếm số ngắt và số mẫu mất.

Artifact cần tạo: Driver source; số đo latency (logic analyzer: INT1 → GPIO bật trong handler); bảng mẫu mất.

## Environment
Date/time + timezone:
Board + revision / image:
Kernel version + config fragment:
Toolchain + flags:
Device tree đã sửa:
Source commit:
Prerequisites:

## Planned cases
ODR 104/416/833 Hz; tải CPU cao; trigger cạnh và mức; handler chậm làm mất ngắt.

## Prediction
Tôi nghĩ sẽ xảy ra gì, vì sao?

## Reproduce
Working directory:
Source / input:
Command chính xác:
Expected result:
Cleanup chỉ áp dụng với tài nguyên của lab:

## Results
| Case | Input | Expected | Actual | Pass/Fail/Not run | Evidence |
| --- | --- | --- | --- | --- | --- |
| Normal | TODO | TODO | Chưa chạy | Not run | — |
| Boundary | TODO | TODO | Chưa chạy | Not run | — |
| Error | TODO | TODO | Chưa chạy | Not run | — |

## Deep dive
| Bài | Kết quả | Evidence |
| --- | --- | --- |
| 1 | Not run | — |
| 2 | Not run | — |
| 3 | Not run | — |

## Analysis
Giải thích chênh lệch dự đoán/kết quả; giới hạn của phép thử.
## Lessons
3 điều đã hiểu; 1 điều còn chưa hiểu.
## English explanation
5 câu giải thích mục tiêu, cách làm, lỗi, kết quả, ứng dụng.
## Next action
TODO
## Tracking
Có kết quả thật thì cập nhật level + evidence của topic trong [TRACKING.md](../../TRACKING.md).
