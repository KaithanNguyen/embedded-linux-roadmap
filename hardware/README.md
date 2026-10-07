# Hardware
Kiến thức phần cứng phục vụ Embedded Linux: đọc schematic/datasheet, giao tiếp ngoại vi từ Linux user space, đo đạc và bring-up board.
Mỗi kết luận cần evidence thật: log, số đo, ảnh setup hoặc capture logic analyzer. Thông số board chỉ đánh dấu "đã xác minh" khi có nguồn tài liệu + version hoặc đo trên board.

## An toàn — đọc trước mỗi lab
- Tắt nguồn khi đấu/tháo dây, camera ribbon hoặc module mở rộng.
- Đối chiếu pin map với tài liệu của đúng board revision trước khi cấp điện.
- GPIO header của cả hai board dùng logic 3.3V: không đưa tín hiệu 5V vào GPIO; nối GND chung trước khi nối tín hiệu giữa hai board hoặc với USB-UART.
- Dùng nguồn đúng thông số trong user manual; ghi adapter đã dùng.
- Chống tĩnh điện: chạm vật nối đất trước khi cầm board, cầm ở mép.
- Trước khi ghi image vào microSD: xác minh đúng thiết bị bằng `lsblk`; ghi nhầm device có thể xóa ổ đĩa của host.
- Đo điện áp bằng multimeter ở chế độ V; không để que đo chạm hai pin cạnh nhau.

## Boards
| Board | Profile | Bắt đầu dùng | Vai trò trong project |
| --- | --- | --- | --- |
| STM32MP257F-DK | [stm32mp257f-dk.md](boards/stm32mp257f-dk.md) | 11/2026 | Node real-time: M33 lấy mẫu sensor, điều khiển LED/buzzer; Linux trên A35 chạy service |
| Jetson Nano (Tegra X1) | [jetson-nano.md](boards/jetson-nano.md) | 04/2027 | Gateway và camera: nhận dữ liệu, pipeline GStreamer có encoder phần cứng, nhận dạng bằng GPU |

Project tích hợp: [STM32MP257F-DK + Jetson Nano](../projects/stm32mp257f-dk_jetson-nano/README.md). Vai trò và thời điểm của từng thiết bị: [roadmap](../ROADMAP.md#thứ-tự-học-và-vai-trò-thiết-bị).

## Inventory
Cột "Có sẵn?" chỉ ghi "Có" khi thiết bị đã ở trong tay; không công khai serial number hoặc MAC address.

| Thiết bị | Model / revision | Có sẵn? | Dùng cho | Ghi chú |
| --- | --- | --- | --- | --- |
| STM32MP257F-DK | TODO: revision trên PCB | Có | Board labs, project | Nguồn USB-C 5V/3A; console qua STLINK-V3EC trên board |
| Jetson Nano Developer Kit | Bản gốc (Tegra X1), 4GB; TODO: revision carrier A02/B01 | Có | Networking, camera, AI (từ 04/2027) | Nguồn 5V/4A qua jack DC + jumper J48; nên gắn quạt; không có Wi-Fi sẵn |
| microSD cho Jetson | ≥ 64 GB | TODO | Rootfs JetPack 4.6 | Ghi checksum image đã ghi |
| microSD cho STM32MP257F-DK | TODO: dung lượng | TODO | Starter Package / image Yocto | Ghi checksum image đã ghi |
| Cáp USB-C có data | — | TODO | Console + nguồn STM32MP257F-DK | — |
| LSM6DSOX (IMU) | TODO: module/breakout | TODO | Peripheral chính: I2C, SPI, IRQ, IIO, driver | WHO_AM_I 0x6C theo datasheet |
| BME280 | TODO: module | TODO | Bài I2C phụ, M33 | — |
| LED, buzzer, nút bấm, điện trở, breadboard, dây jumper | — | TODO | GPIO, device tree, M33 | — |
| Logic analyzer 8 kênh | TODO | TODO | Giải mã I2C/SPI/UART, đo timing ngắt | Ảnh tín hiệu vào bản ghi debug |
| Đồng hồ vạn năng | TODO | TODO | Kiểm tra 3.3V, thông mạch, đo dòng cảm biến | — |
| USB-UART 3.3V | TODO | TODO | UART thứ hai trên header MP257F (log M33), console Jetson | Từ 01/2027 |
| Switch Ethernet 5 cổng + 3 cáp | TODO | TODO | Host, MP257F, Jetson chung một LAN | — |
| Camera Raspberry Pi v2 (IMX219) | — | TODO | Camera cho Jetson (05/2027) | Chạy sẵn với JetPack; camera v3 không được hỗ trợ sẵn; tạm dùng webcam USB |

Chưa cần camera B-CAMS-IMX cho STM32MP257F-DK: phần camera làm trên Jetson rẻ và nhanh hơn.

## Topic labs
Rotation: Electrical basics → UART → GPIO → I2C → Register-level → Sensor signal → SPI. Cùng nhịp 45 phút; một lab phần cứng có thể kéo dài nhiều buổi.
Mỗi topic có README (hướng dẫn, Deep dive, phần làm tay và phần dùng AI) và REPORT.md để ghi actual output, giống [C/C++ foundation](../c-cpp-foundation/README.md).

| Topic | Nội dung | Board | Dự kiến |
| --- | --- | --- | --- |
| [Electrical basics & datasheet](electrical-basics/README.md) | Logic level, pull-up, hạn dòng, pin map, cây nguồn | Cả hai | 11/2026 |
| [UART & serial console](uart/README.md) | Baud, 8N1, termios, flow control | Cả hai | 11/2026 |
| [GPIO](gpio/README.md) | libgpiod, edge event, gpio-leds/gpio-keys | Cả hai | 11/2026 |
| [I2C](i2c/README.md) | ACK/NACK, repeated start, bus recovery, ioctl | MP257F | 12/2026 |
| [Register-level programming](register-programming/README.md) | Register map, read-modify-write, đối chiếu code AI với datasheet | MP257F | 12/2026 |
| [Sensor data & signal basics](sensor-signal/README.md) | Sampling, noise, calibration, lọc fixed-point | MP257F | 12/2026 |
| [SPI](spi/README.md) | Mode, chip select, DMA, đọc FIFO theo burst | MP257F | 12/2026 |

Boot chain, device tree và driver ở [linux-kernel](../linux-kernel/README.md); kiến trúc CPU và interrupt controller ở [arm-architecture](../arm-architecture/README.md).

## Tài liệu tham khảo
Ghi tên tài liệu + version/revision mỗi khi dùng; ưu tiên tài liệu gốc của hãng.
- [ST STM32MPU wiki](https://wiki.st.com/stm32mpu)
- [ST product page STM32MP257F-DK](https://www.st.com/en/evaluation-tools/stm32mp257f-dk.html) (user manual, schematic)
- [NVIDIA JetPack archive](https://developer.nvidia.com/embedded/jetpack-archive)
- [NVIDIA Jetson Linux (L4T) archive](https://developer.nvidia.com/embedded/jetson-linux-archive)
- [Linux kernel docs — I2C dev interface](https://docs.kernel.org/i2c/dev-interface.html)
- [Linux kernel docs — spidev](https://docs.kernel.org/spi/spidev.html)
- [libgpiod](https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git)
