# Lab: Interrupt controllers: GIC & NVIC
Status: Not run

## Goal
Lần theo ngắt INT1 của LSM6DSOX: chân GPIO → bộ điều khiển ngắt GPIO → GIC → handler; đọc `/proc/interrupts`, đổi affinity bằng `/proc/irq/<n>/smp_affinity` và quan sát.

Artifact cần tạo: Sơ đồ đường đi ngắt (trích device tree); /proc/interrupts trước/sau; số đo latency (liên kết HW06).

## Environment
Date/time + timezone:
Board + lõi CPU + tần số:
Kernel / firmware:
Compiler + flags:
Source commit:
Prerequisites:

## Planned cases
Ngắt chạy trên CPU0 và CPU1; có tải (stress-ng) và không tải; số ngắt khớp ODR.

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
