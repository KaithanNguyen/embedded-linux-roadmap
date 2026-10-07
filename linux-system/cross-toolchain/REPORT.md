# Lab: Cross toolchain & sysroot
Status: Not run

## Goal
Cross compile một chương trình dùng thư viện (ví dụ libgpiod) cho aarch64 bằng toolchain + sysroot; chạy trên QEMU user-mode rồi trên board; đọc `file`, `readelf -d`, `ldd`.

Artifact cần tạo: Lệnh build; output file/readelf; bảng kích thước binary và dependency.

## Environment
Date/time + timezone:
Host OS/kernel hoặc board/image:
libc + compiler + flags:
Tải hệ thống khi đo:
Source commit:
Prerequisites:

## Planned cases
Dynamic với sysroot đúng; dynamic với sysroot sai version; static; musl (nếu có toolchain).

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
