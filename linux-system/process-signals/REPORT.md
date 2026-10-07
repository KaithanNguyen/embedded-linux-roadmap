# Lab: Process & signals
Status: Not run

## Goal
Mini shell bằng C: chạy lệnh bằng fork/exec/wait, hỗ trợ pipe `a | b` và redirect `>`, xử lý Ctrl-C mà không giết shell.

Artifact cần tạo: src/minishell.c + test script; strace excerpt của fork/exec; valgrind sạch.

## Environment
Date/time + timezone:
Host OS/kernel hoặc board/image:
libc + compiler + flags:
Tải hệ thống khi đo:
Source commit:
Prerequisites:

## Planned cases
Lệnh không tồn tại (exit 127); lệnh bị signal giết; pipe hai lệnh; Ctrl-C khi lệnh đang chạy; không rò fd (`ls /proc/<pid>/fd`).

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
