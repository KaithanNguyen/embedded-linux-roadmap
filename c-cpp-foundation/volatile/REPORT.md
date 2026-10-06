# Lab: volatile
Status: Not run

## Goal
Biên dịch hai hàm đọc object volatile/non-volatile ở -O0 và -O2; xem assembly. Chỉ đọc biến host hợp lệ, không giả lập truy cập địa chỉ MMIO tùy ý.

Artifact cần tạo: src/access.c; assembly excerpts; limitations note.

## Environment
Date/time + timezone:
Host OS/kernel:
Compiler/tool versions + flags:
Board/image (nếu có):
Source commit:
Prerequisites:

## Planned cases
So sánh generated code, ghi compiler/target; giải thích vì sao volatile không làm read-modify-write atomic.

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
