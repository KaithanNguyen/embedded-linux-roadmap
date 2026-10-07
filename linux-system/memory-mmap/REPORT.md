# Lab: Virtual memory & mmap
Status: Not run

## Goal
Đọc file 100 MB bằng read() và bằng mmap(); đếm page fault (`/usr/bin/time -v` hoặc perf) và đo thời gian; xóa page cache giữa các lần chạy (trên board hoặc máy ảo).

Artifact cần tạo: src/mmap_vs_read.c; bảng số đo; trích smaps.

## Environment
Date/time + timezone:
Host OS/kernel hoặc board/image:
libc + compiler + flags:
Tải hệ thống khi đo:
Source commit:
Prerequisites:

## Planned cases
Cache nóng và nguội; truy cập tuần tự và ngẫu nhiên; file lớn hơn RAM còn trống (trên board).

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
