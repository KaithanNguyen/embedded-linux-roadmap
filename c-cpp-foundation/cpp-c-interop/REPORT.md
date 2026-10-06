# Lab: C/C++ interop & embedded C++
Status: Not run

## Goal
Build module counter (topic static-extern) thành thư viện C và gọi từ C++; quan sát symbol bằng `nm` + `c++filt` khi có/không `extern "C"`.

Artifact cần tạo: src C + C++ + Makefile; trích nm/c++filt; bảng size.

## Environment
Date/time + timezone:
Host OS/kernel:
Compiler/tool versions + flags:
Board/image (nếu có):
Source commit:
Prerequisites:

## Planned cases
Thiếu `extern "C"` → undefined reference (lưu lỗi linker); thư viện C nhận callback: dùng static function hoặc lambda không capture + context pointer; so sánh `size` có/không `-fno-exceptions -fno-rtti`.

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
