# Lab: C++ RAII & ownership
Status: Not run

## Goal
Viết class `UniqueFd` bọc file descriptor: đóng trong destructor, cấm copy, cho phép move; viết lại `copy_file` của topic error-handling bằng RAII và so sánh.

Artifact cần tạo: src/unique_fd.cpp + tests; trace ctor/dtor; bảng so sánh C goto vs RAII.

## Environment
Date/time + timezone:
Host OS/kernel:
Compiler/tool versions + flags:
Board/image (nếu có):
Source commit:
Prerequisites:

## Planned cases
Move constructor/assignment, self-move, return sớm và exception giữa chừng vẫn đóng fd; log ctor/dtor để chứng minh thứ tự hủy.

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
