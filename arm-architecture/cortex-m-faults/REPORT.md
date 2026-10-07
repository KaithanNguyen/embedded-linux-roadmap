# Lab: Cortex-M exceptions & faults
Status: Not run

## Goal
Trên M33, cố ý gây fault (null dereference, chia 0 khi bật DIV_0_TRP, truy cập lệch, stack overflow); viết fault handler in stacked frame và các thanh ghi fault, rồi tìm dòng lỗi bằng addr2line.

Artifact cần tạo: src/fault_handler.c; log fault từng trường hợp; bảng giải mã CFSR.

## Environment
Date/time + timezone:
Board + lõi CPU + tần số:
Kernel / firmware:
Compiler + flags:
Source commit:
Prerequisites:

## Planned cases
Từng loại fault; fault trong ISR và trong thread; vùng MPU guard cho stack.

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
