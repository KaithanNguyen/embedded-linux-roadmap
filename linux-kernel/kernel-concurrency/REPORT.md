# Lab: Kernel concurrency
Status: Not run

## Goal
Thêm khóa cho driver của module-char-driver và interrupts-deferred-work: dữ liệu chia sẻ giữa IRQ thread và read(); cố ý gây race và phát hiện bằng stress test + lockdep.

Artifact cần tạo: Patch thêm khóa; log lockdep; giải thích lựa chọn.

## Environment
Date/time + timezone:
Board + revision / image:
Kernel version + config fragment:
Toolchain + flags:
Device tree đã sửa:
Source commit:
Prerequisites:

## Planned cases
Không khóa; mutex; spin_lock_irqsave; nhiều reader đồng thời.

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
