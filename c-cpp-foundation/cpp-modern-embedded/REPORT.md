# Lab: Modern C++ cho embedded
Status: Not run

## Goal
Viết class `UniqueFd` move-only bọc file descriptor; viết `RingBuffer<T, N>` dùng std::array (không heap); đo code size bằng `size`.

Artifact cần tạo: src/unique_fd.cpp, src/ring_buffer.hpp + tests; trace ctor/dtor; bảng code size.

## Environment
Date/time + timezone:
Host OS/kernel:
Compiler/tool versions + flags:
Board/image (nếu có):
Source commit:
Prerequisites:

## Planned cases
Move constructor/assignment, self-move, return sớm vẫn đóng fd; ring đầy/rỗng/wrap-around; instantiate 1 kiểu và 3 kiểu T.

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
