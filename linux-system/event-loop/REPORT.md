# Lab: Event loop: epoll & timers
Status: Not run

## Goal
Service một luồng dùng epoll: nhận TCP từ nhiều client, timer 100 ms gửi heartbeat, signalfd để thoát sạch.

Artifact cần tạo: src/epoll_server.c + client test; strace cho thấy epoll_wait; log tắt sạch.

## Environment
Date/time + timezone:
Host OS/kernel hoặc board/image:
libc + compiler + flags:
Tải hệ thống khi đo:
Source commit:
Prerequisites:

## Planned cases
10 client cùng lúc; client gửi nửa frame rồi dừng; client ngắt kết nối; SIGTERM khi đang ghi.

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
