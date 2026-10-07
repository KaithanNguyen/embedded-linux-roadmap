# Lab: Exception levels & boot
Status: Not run

## Goal
Từ boot log và source TF-A/U-Boot/kernel, lập bảng: stage → EL → Secure/Non-secure → nhiệm vụ; xác nhận EL lúc kernel khởi động bằng dòng `CPU: All CPU(s) started at EL..` trong dmesg.

Artifact cần tạo: Bảng EL; boot log có chú thích; sơ đồ đường đi của một lời gọi SMC.

## Environment
Date/time + timezone:
Board + lõi CPU + tần số:
Kernel / firmware:
Compiler + flags:
Source commit:
Prerequisites:

## Planned cases
Tắt/bật CPU1 qua `/sys/devices/system/cpu/cpu1/online` và giải thích lời gọi PSCI; reboot và poweroff đi qua đâu.

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
