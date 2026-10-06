# Lab: I2C
Status: Not run

## Goal
Đo 3.3V trên header bằng multimeter trước khi nối LSM6DSOX; xác định bus bằng `i2cdetect -l`, scan bus đó, đọc WHO_AM_I bằng `i2cget` và giải mã gói bằng logic analyzer. Sau đó viết chương trình C qua `/dev/i2c-N` (`ioctl(I2C_RDWR)`) đọc gia tốc và con quay ở 104 Hz.

Artifact cần tạo: Wiring; output i2cdetect/i2cget; ảnh logic analyzer; src/lsm6dsox_i2c.c + mẫu dữ liệu đọc được.

## Environment
Date/time + timezone:
Host OS/kernel:
Board + revision / image / kernel:
Wiring / pin map:
Tool versions (libgpiod, i2c-tools, terminal...):
Source commit:
Prerequisites:

## Planned cases
Địa chỉ đúng; địa chỉ sai (NACK → errno gì); tháo SDA; WHO_AM_I so với datasheet (LSM6DSOX: 0x6C); board nằm yên → trục Z xấp xỉ 1 g.

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
