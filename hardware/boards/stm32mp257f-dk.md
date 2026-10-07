# STM32MP257F-DK — board profile
Status: Chưa xác minh trên board thật. Bắt đầu dùng: 11/2026.
Giá trị bên dưới lấy từ kế hoạch học và product page; đối chiếu với user manual UM3385 và schematic đúng revision, ghi nguồn rồi mới tick "Đã xác minh".

## Tổng quan
| Mục | Giá trị cần xác minh | Đã xác minh? | Nguồn + version |
| --- | --- | --- | --- |
| Board revision | TODO: in trên PCB | ☐ | — |
| SoC | STM32MP257F | ☐ | — |
| CPU | 2× Arm Cortex-A35 1.5 GHz (Linux) + 1× Cortex-M33 400 MHz (firmware real-time) | ☐ | — |
| Accelerator | NPU, GPU 3D, video codec, ISP | ☐ | — |
| RAM | TODO: dung lượng + loại | ☐ | — |
| Boot media | microSD + các mode khác chọn bằng boot switch | ☐ | — |
| Console | STLINK-V3EC trên board, virtual COM port qua USB-C, thường 115200 8N1 | ☐ | — |
| Nguồn | USB-C 5V/3A | ☐ | — |
| Mạng | Ethernet 1 Gbit, Wi-Fi | ☐ | — |
| Mở rộng | Header GPIO 40 chân kiểu Raspberry Pi; TODO: camera, display | ☐ | — |

## Software stack
ST cung cấp STM32MPU Ecosystem với OpenSTLinux (dựa trên Yocto). Học theo thứ tự:

| Package | Dùng để | Thời điểm |
| --- | --- | --- |
| Starter Package | Flash image prebuilt, boot, thử board | Tuần 02–08/11/2026 |
| Developer Package | SDK cross compile app, gdbserver; sửa kernel/device tree ngoài Yocto | Từ tuần 09–15/11/2026 |
| Distribution Package | Build toàn bộ image bằng Yocto, thêm layer/recipe riêng | 03/2027 (Cổng 1) |
| [STM32CubeMP2](https://github.com/STMicroelectronics/STM32CubeMP2) | Firmware Cortex-M33, RPMsg với Linux | 06/2027 |

Ghi version ecosystem, Yocto release và kernel thực tế (`uname -a`, `cat /etc/os-release`) cho mỗi lab.

## Boot chain cần hiểu
ROM code → TF-A BL2 → TF-A BL31 + OP-TEE → U-Boot → Linux kernel → systemd.
Firmware Cortex-M33 được load qua remoteproc (hoặc chạy trước, tùy flavor của ecosystem); A35 ↔ M33 giao tiếp qua RPMsg.
Đây là sơ đồ khái quát. Xác minh bằng boot log thật và ghi lại chỗ khác biệt.

## Bring-up checklist (11/2026)
Bám theo [kế hoạch tuần](../../sprints/README.md#q42026).

Tuần 02–08/11 — boot ([lab](../../linux-kernel/boot-chain/README.md)):
- [ ] Ghi board revision, ecosystem version, image đã flash + checksum.
- [ ] Flash Starter Package vào microSD bằng STM32CubeProgrammer; ghi version + lệnh.
- [ ] Đặt boot switch cho microSD; ghi vị trí switch hoặc chụp ảnh.
- [ ] Mở console qua ST-LINK theo [UART lab](../uart/README.md); capture boot log từ power-on.
- [ ] Chú thích từng stage trong boot log: ROM, TF-A, OP-TEE, U-Boot, kernel, systemd.
- [ ] Login, chạy `system_report.sh` của [sprint 01](../../sprints/2026-10-05_linux-workstation/scripts/README.md) trên board; so sánh host vs target.
- [ ] Network: lấy IP, ping host, SSH; ghi cách cấu hình.

Tuần 09–15/11 — SDK ([lab](../../linux-system/cross-toolchain/README.md)):
- [ ] Cài Developer Package; cross compile app; ghi output `file <binary>`; chạy trên board.
- [ ] Debug từ xa bằng gdbserver trên board + gdb-multiarch trên host.

Tuần 16–22/11 — U-Boot ([lab](../../linux-kernel/u-boot/README.md)):
- [ ] Boot kernel thủ công từ dấu nhắc U-Boot; đổi bootargs.
- [ ] Bảng thời gian boot từng giai đoạn.

Tuần 23–29/11 — device tree ([device tree](../../linux-kernel/device-tree/README.md), [kernel build](../../linux-kernel/kernel-build/README.md)):
- [ ] Kernel + DTB tự build chạy trên board.
- [ ] LED và nút bấm khai báo qua device tree; logic analyzer chụp tín hiệu GPIO.

Evidence lưu theo quy tắc của [project](../../projects/stm32mp257f-dk_jetson-nano/README.md#evidence).

## Câu hỏi tự kiểm tra
- Ai load kernel và device tree? Chúng nằm ở partition nào trên microSD?
- Vì sao TF-A/OP-TEE chạy trước U-Boot?
- Cortex-M33 và Cortex-A35 chia peripheral thế nào; ai cấu hình quyền truy cập?
- Binary build trên host x86_64 có chạy được trên board không? Vì sao?
- So với Jetson Nano: boot chain, BSP và cách build image khác nhau ở đâu?
