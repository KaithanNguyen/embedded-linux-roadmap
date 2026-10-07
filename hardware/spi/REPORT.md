# Lab: SPI
Status: Not run

## Goal
Bước 1: loopback MOSI→MISO trên header, gửi/nhận buffer bằng chương trình C `ioctl(SPI_IOC_MESSAGE)`, thử đổi mode và speed. Bước 2: chuyển LSM6DSOX sang SPI, đọc WHO_AM_I, so sánh thời gian đọc I2C và SPI bằng logic analyzer.

Artifact cần tạo: src/spi_loopback.c, src/lsm6dsox_spi.c; output; ảnh logic analyzer I2C vs SPI; cấu hình device tree/pinmux đã dùng.

## Environment
Date/time + timezone:
Host OS/kernel:
Board + revision / image / kernel:
Wiring / pin map:
Tool versions (libgpiod, i2c-tools, terminal...):
Source commit:
Prerequisites:

## Planned cases
Có/không nối loopback; speed thấp/cao; sai SPI mode với LSM6DSOX; spidev chưa được bật trong device tree/pinmux → ghi blocker và cách bật.

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
