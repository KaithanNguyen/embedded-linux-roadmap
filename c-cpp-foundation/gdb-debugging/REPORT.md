# Lab: GDB & debugging tools
Status: Not run

## Goal
Viết chương trình có lỗi null dereference và một biến bị ghi đè sai; dùng GDB: `bt`, `frame`, `print`, `watch`. Bật core dump và phân tích offline bằng `gdb <binary> <core>`.

Artifact cần tạo: src/crash.c; transcript GDB session; cấu hình core dump đã dùng.

## Environment
Date/time + timezone:
Host OS/kernel:
Compiler/tool versions + flags:
Board/image (nếu có):
Source commit:
Prerequisites:

## Planned cases
Build `-O0` vs `-O2`; core dump không sinh ra (ghi lý do: ulimit, core_pattern, systemd-coredump, WSL); giai đoạn board: gdbserver trên target + gdb-multiarch trên host.

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
