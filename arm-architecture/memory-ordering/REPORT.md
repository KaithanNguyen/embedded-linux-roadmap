# Lab: Memory ordering & barriers
Status: Not run

## Goal
Viết litmus test message passing (flag + data) không barrier, chạy hàng triệu lần trên MP257F và Jetson; đếm số lần quan sát được reorder; thêm release/acquire rồi chạy lại.

Artifact cần tạo: src/litmus_mp.c; bảng số lần reorder; assembly của từng biến thể.

## Environment
Date/time + timezone:
Board + lõi CPU + tần số:
Kernel / firmware:
Compiler + flags:
Source commit:
Prerequisites:

## Planned cases
Không barrier; chỉ compiler barrier; release/acquire; hai thread ghim ở hai core khác nhau; so sánh Cortex-A35 (in-order) với Cortex-A57 (out-of-order).

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
