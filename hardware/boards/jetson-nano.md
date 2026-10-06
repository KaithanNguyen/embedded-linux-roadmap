# Jetson Nano — board profile
Model: Jetson Nano Developer Kit bản gốc (Tegra X1).
Status: Thông số chi tiết chưa xác minh trên board thật.

## Tổng quan
| Mục | Giá trị cần xác minh | Đã xác minh? | Nguồn + version |
| --- | --- | --- | --- |
| Module / carrier | TODO: revision carrier (A02/B01), bản 4GB hay 2GB | ☐ | — |
| SoC | NVIDIA Tegra X1 (T210) | ☐ | — |
| CPU | 4× Arm Cortex-A57 | ☐ | — |
| GPU | 128-core Maxwell (CUDA) | ☐ | — |
| RAM | 4 GB LPDDR4 (có bản 2 GB) | ☐ | — |
| Boot media | Bootloader trong QSPI-NOR; rootfs trên microSD | ☐ | — |
| Nguồn | micro-USB 5V⎓2A, hoặc DC barrel 5V⎓4A khi gắn jumper J48 | ☐ | — |
| Power mode | `nvpmodel`: 10W (MAXN) / 5W | ☐ | — |
| Console | Debug UART trên carrier (vị trí header khác giữa A02 và B01), cần USB-UART 3.3V; micro-USB device mode cho `/dev/ttyACM*` sau khi boot | ☐ | — |
| Camera | MIPI CSI-2 (B01 có 2 connector) hoặc USB camera | ☐ | — |
| Mở rộng | 40-pin header bố cục tương tự Raspberry Pi, logic 3.3V | ☐ | — |

## Software stack và giới hạn
- JetPack 4.6.x là dòng cuối hỗ trợ Jetson Nano: L4T R32.7.x, Ubuntu 18.04, Linux kernel 4.9, CUDA 10.2. Không có JetPack 5/6 cho Nano.
- Hệ quả: GCC 7 mặc định (C++17 phần lớn được hỗ trợ, C++20 thì không), Python 3.6, package cũ. Ghi rõ khi một lab phải dùng bản backport.
- Flash bằng SDK Manager cần host Ubuntu 18.04 (hoặc container); cách đơn giản hơn là ghi SD card image.

Ghi version thực tế: `cat /etc/nv_tegra_release`, `uname -a`, `dpkg -l | grep nvidia-l4t-core`.

## Boot chain cần hiểu
BootROM → các stage bootloader NVIDIA trong QSPI-NOR → U-Boot (đọc `/boot/extlinux/extlinux.conf`) → Linux kernel → systemd.
Đây là sơ đồ khái quát. Xác minh bằng boot log thật và ghi lại chỗ khác biệt.

## Bring-up checklist (M0)
- [ ] Xác định model/revision từ nhãn trên module và carrier.
- [ ] Ghi SD card image JetPack 4.6.x (tên file + checksum); dùng `lsblk` xác minh thẻ trước khi ghi.
- [ ] Chọn nguồn: barrel 5V⎓4A + jumper J48 khi dùng camera/GPU; ghi adapter.
- [ ] Mở console (debug UART hoặc micro-USB serial) và capture boot log.
- [ ] Hoàn tất first-boot setup; ghi version bằng các lệnh ở trên.
- [ ] Chạy `system_report.sh` của [sprint 01](../../sprints/2026-10-05_linux-workstation/scripts/README.md); so sánh với STM32MP2 (CPU, kernel, compiler).
- [ ] Chạy `tegrastats` khi idle và khi có tải; ghi nhiệt độ và power mode.
- [ ] Network: ping STM32MP2 qua Ethernet trực tiếp hoặc qua switch.
- [ ] Camera: capture 1 frame (CSI qua GStreamer `nvarguscamerasrc`, USB qua V4L2); ghi lệnh + output.

Evidence lưu theo quy tắc của [project](../../projects/stm32mp257f-dk_jetson-nano/README.md#evidence).

## Câu hỏi tự kiểm tra
- Vì sao Nano dừng ở JetPack 4.6, và giới hạn đó ảnh hưởng gì đến project?
- Bootloader ở QSPI-NOR, rootfs ở microSD: ghi lại SD có thay bootloader không?
- `nvpmodel` và `jetson_clocks` thay đổi gì; khi báo kết quả hiệu năng phải ghi kèm gì?
- Debug UART và UART trên 40-pin header là device node nào? Kiểm tra bằng kernel command line và `ls /dev/tty*`.
