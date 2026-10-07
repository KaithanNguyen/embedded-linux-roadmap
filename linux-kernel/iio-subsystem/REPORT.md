# Lab: IIO subsystem
Status: Not run

## Goal
Chuyển driver ở driver-model sang IIO: channel accel/gyro, buffer + trigger data-ready từ INT1; đọc bằng iio_readdev hoặc chương trình C.

Artifact cần tạo: Driver IIO; output đọc buffer; bảng so sánh với driver upstream.

## Environment
Date/time + timezone:
Board + revision / image:
Kernel version + config fragment:
Toolchain + flags:
Device tree đã sửa:
Source commit:
Prerequisites:

## Planned cases
Đọc raw qua sysfs; buffer ở 104 và 416 Hz; tháo cảm biến khi đang chạy; so sánh dữ liệu với st_lsm6dsx.

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
