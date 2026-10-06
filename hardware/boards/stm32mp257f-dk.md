# STM32MP257F-DK — board profile
Status: Chưa xác minh trên board thật.
Bảng dưới là điểm khởi đầu từ thông tin chung của dòng STM32MP25; đối chiếu với user manual/schematic đúng revision, ghi nguồn rồi mới tick "Đã xác minh".

## Tổng quan
| Mục | Giá trị cần xác minh | Đã xác minh? | Nguồn + version |
| --- | --- | --- | --- |
| Board revision | TODO: in trên PCB | ☐ | — |
| SoC | STM32MP257F | ☐ | — |
| CPU | 2× Arm Cortex-A35 (Linux) + 1× Cortex-M33 (firmware real-time) | ☐ | — |
| Accelerator | NPU, GPU 3D, video codec, ISP | ☐ | — |
| RAM | TODO: dung lượng + loại | ☐ | — |
| Boot media | microSD + các mode khác chọn bằng boot switch | ☐ | — |
| Console | ST-LINK virtual COM port qua USB-C, thường 115200 8N1 | ☐ | — |
| Nguồn | TODO: connector + thông số adapter | ☐ | — |
| Mạng | TODO: Ethernet / Wi-Fi / Bluetooth | ☐ | — |
| Mở rộng | TODO: GPIO header, camera, display | ☐ | — |

## Software stack
ST cung cấp STM32MPU Ecosystem với OpenSTLinux (dựa trên Yocto). Học theo thứ tự:

| Package | Dùng để | Milestone project |
| --- | --- | --- |
| Starter Package | Flash image prebuilt, boot, thử board | M0 bring-up |
| Developer Package | SDK cross compile app; sửa kernel/device tree ngoài Yocto | M1–M2 |
| Distribution Package | Build toàn bộ image bằng Yocto, thêm layer/recipe riêng | M3 reproducible image |

Ghi version ecosystem, Yocto release và kernel thực tế (`uname -a`, `cat /etc/os-release`) cho mỗi lab.

## Boot chain cần hiểu
ROM code → TF-A BL2 → TF-A BL31 + OP-TEE → U-Boot → Linux kernel → systemd.
Firmware Cortex-M33 được load qua remoteproc (hoặc chạy trước, tùy flavor của ecosystem); A35 ↔ M33 giao tiếp qua RPMsg.
Đây là sơ đồ khái quát. Xác minh bằng boot log thật và ghi lại chỗ khác biệt.

## Bring-up checklist (M0)
- [ ] Ghi board revision, ecosystem version, image đã flash + checksum.
- [ ] Flash Starter Package vào microSD theo hướng dẫn của đúng version; ghi tool (STM32CubeProgrammer) + version + lệnh.
- [ ] Đặt boot switch cho microSD; ghi vị trí switch hoặc chụp ảnh.
- [ ] Mở console theo [UART lab](../uart/README.md); capture boot log từ power-on.
- [ ] Đánh dấu các stage trong boot log: TF-A, OP-TEE, U-Boot, kernel, systemd.
- [ ] Login, chạy `system_report.sh` của [sprint 01](../../sprints/2026-10-05_linux-workstation/scripts/README.md) trên board; so sánh host vs target.
- [ ] Network: lấy IP, ping host, SSH; ghi cách cấu hình.
- [ ] Cross compile hello world bằng Developer Package SDK; ghi output `file <binary>`; chạy trên board.

Evidence lưu theo quy tắc của [project](../../projects/stm32mp257f-dk_jetson-nano/README.md#evidence).

## Câu hỏi tự kiểm tra
- Ai load kernel và device tree? Chúng nằm ở partition nào trên microSD?
- Vì sao TF-A/OP-TEE chạy trước U-Boot?
- Cortex-M33 và Cortex-A35 chia peripheral thế nào; ai cấu hình quyền truy cập?
- Binary build trên host x86_64 có chạy được trên board không? Vì sao?
- So với Jetson Nano: boot chain, BSP và cách build image khác nhau ở đâu?
