# Lab: Preprocessor & build
Status: Not run

## Goal
Viết macro SQUARE/MAX bản naive và bản an toàn hơn; xem output `gcc -E`. Tạo Makefile cho 2 module có header dependency (`-MMD -MP`), sửa header rồi build lại; viết CMakeLists.txt tương đương.

Artifact cần tạo: src + Makefile + CMakeLists.txt; trích `gcc -E`; rebuild log trước/sau khi sửa header.

## Environment
Date/time + timezone:
Host OS/kernel:
Compiler/tool versions + flags:
Board/image (nếu có):
Source commit:
Prerequisites:

## Planned cases
Argument có side effect (`x++`), thiếu ngoặc; sửa header → object nào rebuild; build có/không `-DLOG_LEVEL=2`; out-of-tree build với CMake.

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
