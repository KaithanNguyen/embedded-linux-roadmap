# Lab: Driver model, I2C/SPI client & regmap
Status: Not run

## Goal
Viết I2C client driver cho LSM6DSOX: probe từ device tree, đọc WHO_AM_I qua regmap, cấu hình ODR, xuất dữ liệu qua sysfs.

Artifact cần tạo: Driver source; patch DTS; dmesg; checkpatch sạch.

## Environment
Date/time + timezone:
Board + revision / image:
Kernel version + config fragment:
Toolchain + flags:
Device tree đã sửa:
Source commit:
Prerequisites:

## Planned cases
Probe thành công; WHO_AM_I sai → probe thất bại sạch; unbind/bind qua sysfs; thiếu regulator → defer.

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
