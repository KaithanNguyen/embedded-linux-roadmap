# Lab: C++ templates & STL
Status: Not run

## Goal
Viết `RingBuffer<T, N>` dùng std::array (không heap) với push/pop/size; đo code size bằng `size` khi instantiate 1 kiểu và 3 kiểu T.

Artifact cần tạo: src/ring_buffer.hpp + tests; output `size`; ghi chú iterator invalidation đã quan sát.

## Environment
Date/time + timezone:
Host OS/kernel:
Compiler/tool versions + flags:
Board/image (nếu có):
Source commit:
Prerequisites:

## Planned cases
Full/empty/wrap-around, N=1, `static_assert` cho N=0; vector `reserve` vs `push_back` gây reallocation (in `data()` trước/sau); không giữ reference qua `push_back`.

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
