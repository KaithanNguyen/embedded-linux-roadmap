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
| Board | Profile | Vai trò trong project |
| --- | --- | --- |
| STM32MP257F-DK | [stm32mp257f-dk.md](boards/stm32mp257f-dk.md) | Sensor/control node chạy OpenSTLinux |
| Jetson Nano | [jetson-nano.md](boards/jetson-nano.md) | Camera, xử lý và lưu clip |

Project tích hợp: [STM32MP257F-DK + Jetson Nano](../projects/stm32mp257f-dk_jetson-nano/README.md).

## Inventory
Chỉ ghi thiết bị đang có thật; không công khai serial number hoặc MAC address.

| Thiết bị | Model / revision | Có sẵn? | Dùng cho | Ghi chú |
| --- | --- | --- | --- | --- |
| STM32MP257F-DK | TODO: revision trên PCB | Có | Board labs, project | — |
| Jetson Nano Developer Kit | TODO: 4GB (A02/B01) hay 2GB | Có | Board labs, project | Bản gốc (Tegra X1) |
| microSD (mỗi board một thẻ) | TODO: dung lượng, class | TODO | Boot image | Ghi checksum image đã ghi |
| Cáp USB-C có data | TODO | TODO | Console ST-LINK của STM32MP2 | — |
| Nguồn 5V⎓4A barrel cho Jetson | TODO | TODO | Chạy ổn định khi dùng camera/GPU | Cần jumper J48 |
| USB-UART 3.3V (FTDI/CP2102/...) | TODO | TODO | Debug UART của Jetson | Chọn loại có mức 3.3V |
| Cáp Ethernet / switch | TODO | TODO | Kết nối hai board | — |
| Multimeter | TODO | TODO | Đo rail, mức logic | — |
| Logic analyzer (tùy chọn) | TODO | TODO | Capture UART/I2C/SPI | — |
| Breadboard, LED, điện trở, nút bấm, dây jumper | TODO | TODO | GPIO lab | — |
| Sensor I2C 3.3V | TODO: model | TODO | I2C lab + project | Lưu link datasheet |
| Camera CSI hoặc USB cho Jetson | TODO: model | TODO | Project | — |

## Topic labs
Rotation: Electrical basics → UART → GPIO → I2C → SPI. Cùng nhịp 45 phút; một lab phần cứng có thể kéo dài nhiều buổi.
Mỗi topic có README hướng dẫn và REPORT.md để ghi actual output, giống [C/C++ foundation](../c-cpp-foundation/README.md).

| Topic | Nội dung | Board |
| --- | --- | --- |
| [Electrical basics & datasheet](electrical-basics/README.md) | Logic level, pull-up, open-drain, hạn dòng, pin map | Cả hai |
| [UART & serial console](uart/README.md) | Baud, 8N1, TX/RX, GND chung, boot log | Cả hai |
| [GPIO](gpio/README.md) | libgpiod, active-low, pull-up, pinmux | Cả hai |
| [I2C](i2c/README.md) | Pull-up, địa chỉ 7-bit, ACK/NACK, i2c-tools, ioctl | Cả hai |
| [SPI](spi/README.md) | Mode, chip select, speed, spidev loopback | Cả hai |

Device tree, boot chain và Yocto sẽ có folder riêng khi đến giai đoạn 01–04/2027 của [roadmap](../ROADMAP.md).

## Tài liệu tham khảo
Ghi tên tài liệu + version/revision mỗi khi dùng; ưu tiên tài liệu gốc của hãng.
- [ST STM32MPU wiki](https://wiki.st.com/stm32mpu)
- [ST product page STM32MP257F-DK](https://www.st.com/en/evaluation-tools/stm32mp257f-dk.html) (user manual, schematic)
- [NVIDIA JetPack archive](https://developer.nvidia.com/embedded/jetpack-archive)
- [NVIDIA Jetson Linux (L4T) archive](https://developer.nvidia.com/embedded/jetson-linux-archive)
- [Linux kernel docs — I2C dev interface](https://docs.kernel.org/i2c/dev-interface.html)
- [Linux kernel docs — spidev](https://docs.kernel.org/spi/spidev.html)
- [libgpiod](https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git)
