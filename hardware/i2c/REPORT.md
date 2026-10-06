# Lab: I2C
Status: Not run

## Goal
Nối một sensor I2C 3.3V (ghi model) vào bus trên header; xác định bus bằng `i2cdetect -l`, scan bus đó, đọc register ID bằng `i2cget`; sau đó viết chương trình C dùng `ioctl(I2C_RDWR)`.

Artifact cần tạo: Wiring; output i2cdetect/i2cget; src/i2c_read.c; logic analyzer capture nếu có.

## Environment
Date/time + timezone:
Host OS/kernel:
Board + revision / image / kernel:
Wiring / pin map:
Tool versions (libgpiod, i2c-tools, terminal...):
Source commit:
Prerequisites:

## Planned cases
Địa chỉ đúng; địa chỉ sai (NACK → errno gì); tháo SDA; so sánh giá trị ID với datasheet.

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
