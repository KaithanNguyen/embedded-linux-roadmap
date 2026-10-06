# Roadmap 10/2026 – 09/2027
Mục tiêu: Embedded Linux vững vào 06/2027, chứng minh bằng hệ thống STM32MP257F-DK + Jetson Nano chạy được, có test và evidence. 07–09/2027 mở rộng sang bảo mật, AI tại biên và đóng góp upstream.
Thời gian giả định: hai buổi Embedded Linux tối trong tuần (T3, T6) + lab chính T7. Kỳ nào chưa đạt thì cắt bớt phạm vi kỳ sau thay vì dồn việc, và ghi một dòng lý do.

Kế hoạch theo từng mức:
- **Quý, tháng, cổng, chỉ số:** file này.
- **Tuần:** [sprints](sprints/README.md), mỗi tuần một dòng output mục tiêu + output thực tế.
- **Ngày:** [nhịp học hằng tuần](WORKFLOW.md#nhịp-học-hằng-tuần) và [log một dòng mỗi ngày](LEARNING_LOG.md).
- **Verify từng topic:** [TRACKING.md](TRACKING.md) — level L0–L4, evidence, mục tiêu level theo cổng.

## Thứ tự học và vai trò thiết bị
Laptop (Linux, C, gdb, cross compile) → STM32MP257F-DK (boot, U-Boot, device tree, kernel, driver, Yocto) → LSM6DSOX (peripheral thực chiến đầu tiên) → Jetson Nano từ 04/2027 (userspace nâng cao, networking, camera/AI).
Networking đi cùng Jetson Nano ở Q2/2027, nên Cổng 1 tập trung vào BSP và driver.

| Thiết bị | Vai trò | Bắt đầu dùng | Output tiêu biểu |
| --- | --- | --- | --- |
| Laptop Ubuntu (WSL2/VM, sau đó native) | Nền Linux, C, gdb, cross compile; sau này build Yocto | 10/2026 | Mini shell, chương trình đa luồng, IPC |
| STM32MP257F-DK | Board chính: boot flow, U-Boot, device tree, kernel, driver, Yocto | 11/2026 | Log boot có chú thích, kernel + DTB tự build, image Yocto riêng |
| LSM6DSOX | Peripheral đầu tiên: I2C, SPI, IRQ, IIO | 12/2026 | WHO_AM_I đọc được, dữ liệu qua IIO, driver tự viết |
| Logic analyzer 8 kênh | Giải mã I2C/SPI, đo độ trễ ngắt và timing | 11/2026 | Ảnh tín hiệu trong mỗi bản ghi debug |
| Đồng hồ vạn năng | Kiểm tra 3.3V trước khi nối dây, thông mạch, đo dòng | 11/2026 | Bảng dòng tiêu thụ của cảm biến theo chế độ |
| USB-UART 3.3V | UART thứ hai trên header MP257F (log M33), console Jetson Nano | 01/2027 | Loopback UART, console Jetson Nano |
| Jetson Nano (Tegra X1) | Userspace nâng cao, networking, camera, AI | 04/2027 | Nhận dữ liệu IMU qua mạng, pipeline GStreamer/OpenCV |

Chi tiết thiết bị và an toàn: [hardware](hardware/README.md). Project tích hợp: [STM32MP257F-DK + Jetson Nano](projects/stm32mp257f-dk_jetson-nano/README.md).

## Hai cổng
| Cổng | Thời điểm | Tiêu chí đạt | Trạng thái |
| --- | --- | --- | --- |
| Cổng 1 — BSP & driver | 03/2027 | Kernel + DTB tự build; driver IIO tự viết cho LSM6DSOX; image Yocto riêng boot trên board; viết driver cho một cảm biến I2C mới trong 1 tuần mà không theo tutorial; level theo [mục tiêu cổng](TRACKING.md#mục-tiêu-level-theo-cổng) | Chưa đánh giá |
| Cổng 2 — Hệ thống end-to-end | 06/2027 | MP257F + Jetson chạy end-to-end (IMU, mạng, video, M33); báo cáo test rút nguồn; CI xanh; README, ADR, video demo; người khác clone repo và chạy được theo README; level theo [mục tiêu cổng](TRACKING.md#mục-tiêu-level-theo-cổng) | Chưa đánh giá |

## Theo quý
| Quý | Output phải có cuối quý | Tiêu chí đạt | Output thực tế | Trạng thái |
| --- | --- | --- | --- | --- |
| Q4/2026 | Repo có ít nhất 25 commit; 4 chương trình user space; MP257F boot kernel + DTB tự build; LSM6DSOX chạy qua I2C, SPI và IIO; 10 bản ghi debug có ảnh logic analyzer | Giải thích bằng tiếng Anh trong 5 phút luồng boot của board và đường đi của một mẫu dữ liệu từ LSM6DSOX tới user space | | Đang làm |
| Q1/2027 | Kernel module đầu tiên; driver IIO tự viết cho LSM6DSOX; image Yocto riêng | Cổng 1 | | Chưa bắt đầu |
| Q2/2027 | Hệ thống MP257F + Jetson chạy end-to-end: IMU, mạng, video, M33; báo cáo test rút nguồn; CI xanh; README, ADR, video demo | Cổng 2 | | Chưa bắt đầu |
| Q3/2027 | Secure boot + threat model; demo AI có số đo; 1 patch gửi upstream | Trình bày bằng tiếng Anh trong 5 phút chuỗi secure boot và threat model; số đo AI tái hiện được từ README | | Chưa bắt đầu |

## Theo tháng
| Tháng | Phần cứng chính | Output mục tiêu | Output thực tế | Trạng thái |
| --- | --- | --- | --- | --- |
| 10/2026 | Laptop | Repo học có log hằng ngày; mini shell; chương trình đa luồng; IPC; binary aarch64 chạy trên QEMU | | Đang làm |
| 11/2026 | MP257F-DK | Log boot có chú thích; app cross compile + gdbserver; boot thủ công từ U-Boot; kernel + DTB tự build | | Chưa bắt đầu |
| 12/2026 | MP257F-DK, LSM6DSOX | Cảm biến chạy qua I2C và SPI; dữ liệu qua IIO với ngắt data-ready; bài viết tổng kết quý | | Chưa bắt đầu |
| 01/2027 | MP257F-DK, LSM6DSOX | Kernel module đầu tiên; I2C client driver tự viết dùng regmap, đọc WHO_AM_I và xuất dữ liệu qua sysfs; debug kernel bằng printk, dynamic debug, ftrace | | Chưa bắt đầu |
| 02/2027 | MP257F-DK, LSM6DSOX | Driver IIO tự viết: probe từ device tree, ngắt data-ready, IIO buffer + trigger; README so sánh với `st_lsm6dsx` upstream | | Chưa bắt đầu |
| 03/2027 | MP257F-DK | Yocto: layer riêng, recipe cho app, driver và bản vá device tree; image riêng boot trên board (Cổng 1) | | Chưa bắt đầu |
| 04/2027 | Jetson Nano, MP257F-DK | Jetson Nano chạy; MP257F gửi dữ liệu LSM6DSOX qua TCP và UDP sang Jetson; đo độ trễ và mất gói bằng Wireshark; thêm TLS | | Chưa bắt đầu |
| 05/2027 | Jetson Nano | Pipeline GStreamer/OpenCV; video + dữ liệu chuyển động đồng bộ timestamp; sự kiện rung/rơi từ LSM6DSOX kích hoạt ghi hình | | Chưa bắt đầu |
| 06/2027 | Cả hệ thống | Firmware M33 đọc LSM6DSOX theo thời gian thực, gửi lên Linux qua RPMsg; OTA A/B, watchdog, test rút nguồn, CI; README + video demo (Cổng 2) | | Chưa bắt đầu |
| 07/2027 | MP257F-DK | Chuỗi secure boot, ký firmware, threat model một trang | | Chưa bắt đầu |
| 08/2027 | Jetson Nano hoặc MP257F-DK | Model nhỏ chạy trên GPU Jetson hoặc NPU MP257F, có số đo độ trễ, điện năng và nhiệt | | Chưa bắt đầu |
| 09/2027 | Tổng hợp | Một patch gửi upstream; tổng kết năm; kế hoạch năm tiếp theo | | Chưa bắt đầu |

## Output tối thiểu theo chu kỳ
| Chu kỳ | Output tối thiểu | Nơi ghi |
| --- | --- | --- |
| Ngày | Mỗi buổi có một output (xem [nhịp học](WORKFLOW.md#nhịp-học-hằng-tuần)); ngày bị kẹt thì output là "đã thử gì, giả thuyết gì" | [log tháng](LEARNING_LOG.md) |
| Tuần | 2 commit có ý nghĩa; 1 bản ghi debug journal; 2–3 bài LeetCode; 1 bài viết hoặc bản ghi âm tiếng Anh tổng hợp tuần; verify lại 1–2 topic; review Chủ nhật 30 phút | [sprints](sprints/README.md), [TRACKING](TRACKING.md), [weekly review](templates/weekly-review.md) |
| Tháng | Đọc lại debug journal, rút ra một khuôn mẫu lỗi; 1 milestone project + 1 ADR; 1 mini project 90 phút cùng AI + cập nhật AI error log; 1 bài viết kỹ thuật tiếng Anh; spot check 2 topic L3 | Bảng tháng ở trên, [monthly review](templates/monthly-review.md) |
| Quý | Đối chiếu bảng quý; audit TRACKING; demo từ clean checkout; điều chỉnh quý tiếp theo | Bảng quý ở trên, [quarterly review](templates/quarterly-review.md) |

Cập nhật cột "Output thực tế" và "Trạng thái" trong buổi review Chủ nhật, kèm link commit hoặc bài viết.
Chủ nhật cuối mỗi tháng: thêm các dòng tuần của tháng tới vào [sprints](sprints/README.md).

## Chỉ số đến 06/2027
Số hiện tại được sinh tự động ở phần [Progress của README](README.md#progress) bằng `python tools/repo_check.py progress --write`.

| Chỉ số | Mục tiêu | Nơi đếm |
| --- | --- | --- |
| Topic đạt ≥ L2 / ≥ L3 | Theo [mục tiêu cổng](TRACKING.md#mục-tiêu-level-theo-cổng) | [TRACKING](TRACKING.md) |
| Bản ghi debug journal | 30 | [debug-logs](debug-logs/README.md) |
| Bài LeetCode | 100 | [leetcode](leetcode/README.md) |
| ADR | 10 | [docs/adr](docs/adr/README.md) |
| Bài viết tiếng Anh | 20 | [docs/writeups](docs/writeups/README.md) |
| Patch gửi upstream (đến 09/2027) | 1–2 | [TRACKING KN12](TRACKING.md#boot-bsp--kernel) |

## Chuẩn bị trước
- Tuần 1–4 dùng WSL2 hoặc máy ảo đều được.
- Yocto cần khoảng 90–100 GB trống: chuẩn bị SSD ngoài hoặc dual boot Ubuntu trước 03/2027.
- Trước khi nối dây: tra user manual UM3385 của board để tìm chân I2C, SPI, GPIO trên header 40 chân.
- Giai đoạn camera (05/2027) cần camera Raspberry Pi v2 (IMX219) hoặc webcam USB; trước đó có thể dùng file video.

## Theo dõi gate
| Gate | Ngày đánh giá | Evidence/commit | Gap | Hành động tiếp theo |
| --- | --- | --- | --- | --- |
| TODO | TODO | Chưa có | Chưa đánh giá | TODO |
