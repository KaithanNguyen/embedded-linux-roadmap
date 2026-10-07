# Lab: Kernel module & character driver
Status: Not run

## Goal
Viết misc driver có buffer vòng: write đẩy dữ liệu, read lấy ra, poll báo sẵn sàng, ioctl xóa buffer; test bằng chương trình C.

Artifact cần tạo: Module source + Makefile; chương trình test; dmesg; checkpatch sạch.

## Environment
Date/time + timezone:
Board + revision / image:
Kernel version + config fragment:
Toolchain + flags:
Device tree đã sửa:
Source commit:
Prerequisites:

## Planned cases
Đọc khi rỗng (blocking và O_NONBLOCK); ghi khi đầy; nhiều reader; rmmod khi có fd mở; con trỏ user không hợp lệ.

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
