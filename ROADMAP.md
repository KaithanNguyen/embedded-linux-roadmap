# Roadmap 10/2026 – 09/2027
Mục tiêu: Embedded Linux/BSP vững vào 06/2027, chứng minh bằng hệ thống STM32MP257F-DK + Jetson Nano chạy được từ sớm và luôn chạy được, có test và số đo. 07–09/2027 là phần mở rộng: OTA kèm ký image, secure boot, M33/RPMsg, AI tại biên, đóng góp upstream.
Thời gian giả định: hai buổi tối trong tuần (T3, T6) + lab chính T7, song song với công việc toàn thời gian. Kỳ nào chưa đạt thì cắt phần Mở rộng trước, không dồn việc, và ghi một dòng lý do.

Kế hoạch theo từng mức:
- **Quý, tháng, cổng, chỉ số:** file này.
- **Tuần:** [sprints](sprints/README.md), mỗi tuần một dòng output mục tiêu + output thực tế.
- **Ngày:** [nhịp học hằng tuần](WORKFLOW.md#nhịp-học-hằng-tuần) và [log một dòng mỗi ngày](LEARNING_LOG.md).
- **Verify từng topic:** [TRACKING.md](TRACKING.md) — cổng, level L0–L4, evidence, mục tiêu level theo cổng.

## Nguyên tắc
1. **Linux/BSP là trục chính.** Boot, device tree, kernel, driver và Yocto được đầu tư sâu nhất. Ngôn ngữ: C cho driver, sensor-svc và protocol; một service C++ thực tế (edge-svc trên Jetson) cho phần application; Python chỉ dùng cho script test và đo. Không mở thêm nhánh ngôn ngữ.
2. **Luôn có một hệ thống đang chạy.** Walking skeleton từ 12/2026: LSM6DSOX → driver có sẵn (`st_lsm6dsx`) → sensor-svc viết bằng C → TCP → laptop nhận dữ liệu; chưa cần Jetson, camera hay TLS. Sau đó thay hoặc nâng từng phần một (driver tự viết, image Yocto, Jetson, camera, bảo mật) và đo lại trước/sau bằng cùng một script.
3. **Độ bền và bảo mật đi cùng tính năng.** Service đầu tiên đã có test crash, timeout, restart và cleanup. Bắt đầu ghi dữ liệu thì có ngay test đầy ổ đĩa và cắt nguồn. Làm OTA thì kiểm chữ ký image trong cùng milestone. Threat model ngắn và quyền chạy service được xét từ lúc thiết kế; secure boot chuyên sâu để Q3.
4. **Cổng chỉ gồm đường chính.** M33/RPMsg, OTA, detector GPU và phần đào sâu là Mở rộng: thiếu chúng vẫn qua được cổng ([phân loại cổng](TRACKING.md#phân-loại-cổng)).

## Thứ tự học và vai trò thiết bị
Laptop (Linux, C, gdb, cross compile; receiver của skeleton) → STM32MP257F-DK (boot, U-Boot, device tree, kernel, driver, Yocto) → LSM6DSOX (peripheral thực chiến đầu tiên) → Jetson Nano từ 04/2027 (edge-svc C++, TLS, camera) → Cortex-M33 từ 08/2027 (mở rộng).
Networking cơ bản (socket, timeout, mất kết nối) bắt đầu cùng skeleton ở 12/2026; TLS và video đi cùng Jetson ở Q2/2027.
Thời gian dồn vào phần AI không làm thay được — bring-up, kernel, timing, debug trên board, kiểm chứng code AI với datasheet; phần AI làm tốt (boilerplate, tra lệnh, số lượng lớn bài thuật toán) đã được cắt ([lý do](docs/ai-assisted-engineering.md)).

| Thiết bị | Vai trò | Bắt đầu dùng | Output tiêu biểu |
| --- | --- | --- | --- |
| Laptop Ubuntu (WSL2/VM, sau đó native) | Nền Linux, C, gdb, cross compile; receiver của walking skeleton; sau này build Yocto | 10/2026 | Mini shell, chương trình đa luồng, receiver nhận dữ liệu IMU qua TCP |
| STM32MP257F-DK | Board chính: boot flow, U-Boot, device tree, kernel, driver, Yocto; chạy sensor-svc | 11/2026 | Log boot có chú thích, kernel + DTB tự build, image Yocto riêng |
| LSM6DSOX | Peripheral đầu tiên: I2C, IRQ, IIO (SPI là phần mở rộng) | 12/2026 | WHO_AM_I đọc được, dữ liệu qua IIO, driver tự viết |
| Logic analyzer 8 kênh | Giải mã I2C, đo độ trễ ngắt và timing | 11/2026 | Ảnh tín hiệu trong mỗi bản ghi debug |
| Đồng hồ vạn năng | Kiểm tra 3.3V trước khi nối dây, thông mạch, đo dòng | 11/2026 | Bảng dòng tiêu thụ của cảm biến theo chế độ |
| USB-UART 3.3V | UART thứ hai trên header MP257F, console Jetson Nano | 01/2027 | Loopback UART, console Jetson Nano |
| Jetson Nano (Tegra X1) | edge-svc C++, mTLS, camera, recorder | 04/2027 | edge-svc nhận dữ liệu IMU qua mTLS, ghi clip khi có sự kiện |

Chi tiết thiết bị và an toàn: [hardware](hardware/README.md). Project tích hợp: [STM32MP257F-DK + Jetson Nano](projects/stm32mp257f-dk_jetson-nano/README.md).

## Hai cổng
| Cổng | Thời điểm | Tiêu chí đạt | Trạng thái |
| --- | --- | --- | --- |
| Cổng 1 — BSP, driver & skeleton | 03/2027 | Kernel + DTB tự build; driver IIO tự viết cho LSM6DSOX đã thay `st_lsm6dsx` trong skeleton, có số đo trước/sau; viết driver cho một cảm biến I2C mới trong 1 tuần, không theo tutorial; image Yocto riêng chạy sensor-svc dưới systemd bằng user riêng; test skeleton pass (partial read/write, mất kết nối, timeout, buffer đầy, crash/restart, shutdown); threat model v0; level theo [mục tiêu cổng](TRACKING.md#mục-tiêu-level-theo-cổng) | Chưa đánh giá |
| Cổng 2 — Đường chính ổn định | 06/2027 | Linux IIO → sensor-svc → mTLS → edge-svc → recorder chạy ổn: test 24 giờ không rò tài nguyên, 500 lần cắt nguồn không hỏng clip đã đóng, test đầy ổ đĩa, latency sự kiện → bắt đầu ghi có p50/p99; CI xanh; README, ADR, video demo; người khác clone repo và chạy được theo README; level theo [mục tiêu cổng](TRACKING.md#mục-tiêu-level-theo-cổng). Không yêu cầu M33/RPMsg, OTA hay detector GPU | Chưa đánh giá |

## Theo quý
| Quý | Output phải có cuối quý | Tiêu chí đạt | Output thực tế | Trạng thái |
| --- | --- | --- | --- | --- |
| Q4/2026 | Repo có ít nhất 25 commit; 4 chương trình user space; MP257F boot kernel + DTB tự build; LSM6DSOX chạy qua I2C và IIO (`st_lsm6dsx`); walking skeleton v0 gửi dữ liệu IMU qua TCP tới laptop; threat model v0; 10 bản ghi debug có ảnh logic analyzer | Giải thích bằng tiếng Anh trong 5 phút luồng boot của board và đường đi của một mẫu dữ liệu từ LSM6DSOX tới laptop | | Đang làm |
| Q1/2027 | Skeleton v1 có test độ bền, chạy dưới systemd bằng user riêng; kernel module đầu tiên; driver IIO tự viết thay driver có sẵn; image Yocto riêng | Cổng 1 | | Chưa bắt đầu |
| Q2/2027 | edge-svc C++ trên Jetson nhận dữ liệu qua mTLS; recorder ghi clip theo sự kiện; test 24 giờ, đầy ổ đĩa, 500 lần cắt nguồn; CI xanh; README, ADR, video demo | Cổng 2 | | Chưa bắt đầu |
| Q3/2027 | Mở rộng: OTA A/B kèm kiểm chữ ký image; chuỗi secure boot; M33/RPMsg hoặc demo AI có số đo; 1 patch gửi upstream | Trình bày bằng tiếng Anh trong 5 phút chuỗi secure boot, cách kiểm chữ ký OTA và threat model; số đo tái hiện được từ README | | Chưa bắt đầu |

## Theo tháng
Mỗi tháng từ 12/2026 kết thúc bằng một hệ thống chạy được và một lần đo lại bằng cùng script (latency, mất mẫu, CPU, bộ nhớ).

| Tháng | Phần cứng chính | Output mục tiêu | Output thực tế | Trạng thái |
| --- | --- | --- | --- | --- |
| 10/2026 | Laptop | Repo học có log hằng ngày; mini shell; chương trình đa luồng; binary aarch64 chạy trên QEMU | | Đang làm |
| 11/2026 | MP257F-DK | Log boot có chú thích; app cross compile + gdbserver; boot thủ công từ U-Boot; kernel + DTB tự build; LED và nút qua device tree; Arm: exception level và PSCI | | Chưa bắt đầu |
| 12/2026 | MP257F-DK, LSM6DSOX, laptop | LSM6DSOX qua I2C (WHO_AM_I, bảng register đối chiếu datasheet, bias/noise); dữ liệu qua IIO bằng `st_lsm6dsx` với ngắt data-ready; **walking skeleton v0**: sensor-svc đọc IIO buffer, gửi TCP tới receiver trên laptop, không chạy bằng root; spec một trang + threat model v0 viết trước khi code; bài viết tổng kết quý | | Chưa bắt đầu |
| 01/2027 | MP257F-DK, laptop | **Skeleton v1**: frame có CRC + ACK, outbox có giới hạn, systemd + watchdog, user riêng + sandboxing; test partial read/write, mất kết nối, timeout, buffer đầy, crash/restart, cleanup, shutdown; test plan map requirement ↔ test; kernel module đầu tiên; I2C client driver dùng regmap | | Chưa bắt đầu |
| 02/2027 | MP257F-DK, LSM6DSOX | Driver IIO tự viết (buffer + trigger data-ready) **thay `st_lsm6dsx` trong skeleton**, số đo trước/sau bằng cùng script; Wireshark capture của chính hệ thống; TCP_NODELAY có số đo; fuzz frame parser; core dump và log giữ qua reboot | | Chưa bắt đầu |
| 03/2027 | MP257F-DK | Yocto: layer riêng, recipe cho driver, sensor-svc, unit systemd và bản vá device tree; skeleton chạy trên image riêng và đo lại (Cổng 1) | | Chưa bắt đầu |
| 04/2027 | Jetson Nano, MP257F-DK | Jetson Nano chạy; edge-svc (C++) thay receiver trên laptop; mTLS giữa hai board; edge-svc bắt đầu ghi dữ liệu nên có ngay test đầy ổ đĩa và cắt nguồn; pytest điều khiển board; cập nhật threat model | | Chưa bắt đầu |
| 05/2027 | Jetson Nano | Camera + GStreamer encode phần cứng; recorder ghi clip theo sự kiện từ LSM6DSOX, timestamp đồng bộ; SHA-256 cho clip; 500 lần cắt nguồn; test 24 giờ | | Chưa bắt đầu |
| 06/2027 | Cả hệ thống | Ổn định, không thêm tính năng: sửa lỗi từ test, hoàn thiện ADR, README, video demo; clean clone chạy được theo README (Cổng 2) | | Chưa bắt đầu |
| 07/2027 | MP257F-DK | Mở rộng: OTA A/B bằng RAUC hoặc SWUpdate, image được ký và image sai chữ ký bị từ chối ngay trong milestone này; chuỗi secure boot; dm-verity; SBOM + CVE | | Chưa bắt đầu |
| 08/2027 | MP257F-DK hoặc Jetson Nano | Mở rộng: firmware M33 đọc LSM6DSOX gửi lên Linux qua RPMsg, so jitter với đường IIO; hoặc model nhỏ trên GPU Jetson / NPU MP257F có số đo độ trễ, điện năng, nhiệt | | Chưa bắt đầu |
| 09/2027 | Tổng hợp | Một patch gửi upstream; tổng kết năm; kế hoạch năm tiếp theo | | Chưa bắt đầu |

## Output tối thiểu theo chu kỳ
| Chu kỳ | Output tối thiểu | Nơi ghi |
| --- | --- | --- |
| Ngày | Mỗi buổi có một output (xem [nhịp học](WORKFLOW.md#nhịp-học-hằng-tuần)); ngày bị kẹt thì output là "đã thử gì, giả thuyết gì" | [log tháng](LEARNING_LOG.md) |
| Tuần | 2 commit có ý nghĩa; 1 bản ghi debug journal; 1–2 bài LeetCode hoặc 1 bài live coding; 1 bản ghi âm tiếng Anh tổng hợp tuần; verify lại 1–2 topic kèm một bài Deep dive; review Chủ nhật 30 phút | [sprints](sprints/README.md), [TRACKING](TRACKING.md), [weekly review](templates/weekly-review.md) |
| Tháng | Hệ thống vẫn chạy và được đo lại; đọc lại debug journal, rút ra một khuôn mẫu lỗi; 1 debug drill; 1 milestone project + 1 ADR; 1 mini project 90 phút cùng AI + cập nhật AI error log; 1 bài viết kỹ thuật tiếng Anh; spot check 2 topic L3 | Bảng tháng ở trên, [monthly review](templates/monthly-review.md) |
| Quý | Đối chiếu bảng quý; audit TRACKING; demo từ clean checkout; điều chỉnh quý tiếp theo | Bảng quý ở trên, [quarterly review](templates/quarterly-review.md) |

Cập nhật cột "Output thực tế" và "Trạng thái" trong buổi review Chủ nhật, kèm link commit hoặc bài viết.
Chủ nhật cuối mỗi tháng: thêm các dòng tuần của tháng tới vào [sprints](sprints/README.md).

## Chỉ số
Mục tiêu tính đến 06/2027, trừ khi ghi khác. Số hiện tại được sinh tự động ở phần [Progress của README](README.md#progress) bằng `python tools/repo_check.py progress --write`.

| Chỉ số | Mục tiêu | Nơi đếm |
| --- | --- | --- |
| Topic đạt ≥ L2 / ≥ L3 | Theo [mục tiêu cổng](TRACKING.md#mục-tiêu-level-theo-cổng) | [TRACKING](TRACKING.md) |
| Bản ghi debug journal | 30 | [debug-logs](debug-logs/README.md) |
| Debug drill | 6 trước Cổng 1, 12 trước Cổng 2 | [debug-drills](debug-drills/README.md) |
| Bài LeetCode | 60, trong đó ≥ 30 Verified | [leetcode](leetcode/README.md) |
| ADR | ≥ 5 cho quyết định của đường chính trước Cổng 2; 10 đến 09/2027 | [docs/adr](docs/adr/README.md) |
| Bài viết tiếng Anh | 12 | [docs/writeups](docs/writeups/README.md) |
| Patch gửi upstream (đến 09/2027) | 1–2 | [TRACKING KN12](TRACKING.md#boot-bsp--kernel) |

## Chuẩn bị trước
- Tuần 1–4 dùng WSL2 hoặc máy ảo đều được.
- Từ 12/2026 laptop và board cần chung một mạng LAN (switch hoặc cáp Ethernet trực tiếp) để chạy walking skeleton; địa chỉ lab xem [hardware của project](projects/stm32mp257f-dk_jetson-nano/docs/hardware.md).
- Yocto cần khoảng 90–100 GB trống: chuẩn bị SSD ngoài hoặc dual boot Ubuntu trước 03/2027.
- Trước khi nối dây: tra user manual UM3385 của board để tìm chân I2C, SPI, GPIO trên header 40 chân.
- Giai đoạn camera (05/2027) cần camera Raspberry Pi v2 (IMX219) hoặc webcam USB; trước đó có thể dùng file video.

## Theo dõi gate
| Gate | Ngày đánh giá | Evidence/commit | Gap | Hành động tiếp theo |
| --- | --- | --- | --- | --- |
| TODO | TODO | Chưa có | Chưa đánh giá | TODO |
