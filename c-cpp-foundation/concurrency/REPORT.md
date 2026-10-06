# Lab: Concurrency
Status: Not run

## Goal
Hai thread cùng tăng counter: bản không khóa, bản mutex, bản `atomic_fetch_add`; ghi kết quả và thời gian. Sau đó viết bounded queue producer/consumer bằng mutex + condvar.

Artifact cần tạo: src/counter.c, src/queue.c + tests; TSan report; bảng thời gian kèm số core và flags.

## Environment
Date/time + timezone:
Host OS/kernel:
Compiler/tool versions + flags:
Board/image (nếu có):
Source commit:
Prerequisites:

## Planned cases
Chạy lặp nhiều lần với số vòng lớn; queue đầy/rỗng; shutdown khi consumer đang chờ; chạy với ThreadSanitizer.

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
