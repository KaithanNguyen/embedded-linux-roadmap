# Documentation

- [Linux cheat sheet](linux-cheatsheet.md): chỉ thêm command đã chạy và hiểu.
- [Concept notes](concepts/README.md): giải thích bằng lời của mình, liên kết lab.
- [Câu hỏi tự kiểm tra](self-check.md): verify mức L1 cho từng area trong [TRACKING](../TRACKING.md).
- [Design studies](design-studies/README.md): bài tập thiết kế hệ thống 45 phút + design doc.
- [ADR](adr/README.md): mỗi quyết định kỹ thuật của project một bản ghi; mục tiêu 10 ADR đến 06/2027.
- [Bài viết tiếng Anh](writeups/README.md): tổng hợp từ debug journal, ADR hoặc lab; mục tiêu 20 bài đến 06/2027.
- [AI error log](ai-error-log.md): lỗi AI đã mắc và cách phát hiện.
- [Lab template](../templates/lab-report.md): dùng để ghi kết quả từng thí nghiệm.

## Tài liệu đọc
Ghi phiên bản/năm xuất bản khi trích dẫn trong lab hoặc concept note.

| Mảng | Tài liệu |
| --- | --- |
| Linux nền tảng | *The Linux Command Line* (William Shotts); *How Linux Works* (Brian Ward) |
| Hệ thống máy tính | *Computer Systems: A Programmer's Perspective* (Bryant, O'Hallaron) |
| Lập trình hệ thống | *The Linux Programming Interface* (Michael Kerrisk); *C++ Concurrency in Action* (Anthony Williams) |
| Kernel, driver, Yocto | *Linux Device Drivers*; *Mastering Embedded Linux Programming*; [Bootlin kernel & driver slides](https://bootlin.com/doc/training/linux-kernel/linux-kernel-slides.pdf); [Yocto Project docs](https://docs.yoctoproject.org/) |
| STM32MP257F-DK | [ST wiki STM32MPU](https://wiki.st.com/stm32mpu); [trang board](https://www.st.com/en/evaluation-tools/stm32mp257f-dk.html); [STM32CubeMP2](https://github.com/STMicroelectronics/STM32CubeMP2) cho firmware M33 |
| LSM6DSOX | [Device tree binding `st_lsm6dsx`](https://kernel.org/doc/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt); datasheet của ST |
| Jetson Nano | [JetPack 4.6.1](https://developer.nvidia.com/embedded/jetpack-sdk-461); [jetson-inference](https://github.com/dusty-nv/jetson-inference) |
| Mạng và video | [Mosquitto](https://mosquitto.org/); Wireshark; iperf3; [GStreamer docs](https://gstreamer.freedesktop.org/documentation/) |

Thêm tài liệu phần cứng ở [hardware](../hardware/README.md#tài-liệu-tham-khảo).
