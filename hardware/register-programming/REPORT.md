# Lab: Register-level programming
Status: Not run

## Goal
Lập bảng register LSM6DSOX cần dùng (WHO_AM_I, CTRL1_XL, CTRL2_G, CTRL3_C, INT1_CTRL, STATUS_REG, thanh ghi dữ liệu): địa chỉ, bit field, giá trị reset; cấu hình ODR và full scale bằng read-modify-write qua /dev/i2c. Nhờ AI sinh cùng bảng rồi đối chiếu từng bit, ghi sai lệch vào AI error log.

Artifact cần tạo: Bảng register (nguồn: datasheet + revision); src/lsm6dsox_regs.h; ảnh logic analyzer tần số INT1; mục trong docs/ai-error-log.md.

## Environment
Date/time + timezone:
Host OS/kernel:
Board + revision / image / kernel:
Wiring / pin map:
Tool versions (libgpiod, i2c-tools, terminal...):
Source commit:
Prerequisites:

## Planned cases
Giá trị reset khớp datasheet; đổi ODR rồi đo tần số INT1 bằng logic analyzer; read-modify-write không làm hỏng bit khác; bảng do AI sinh: sai lệch được tìm ra hoặc xác nhận không có.

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
