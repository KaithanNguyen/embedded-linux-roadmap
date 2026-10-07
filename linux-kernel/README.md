# Linux kernel & BSP
Từ boot chain đến driver: phần lõi của công việc embedded Linux trên STM32MP257F-DK, với LSM6DSOX là thiết bị thật xuyên suốt. Đây là khu vực đầu tư sâu nhất từ 11/2026 đến 03/2027 (Cổng 1).
Level và evidence theo dõi ở [TRACKING.md](../TRACKING.md#boot-bsp--kernel); lịch theo tuần ở [sprints](../sprints/README.md#q42026).

| Topic | Nội dung | Dự kiến |
| --- | --- | --- |
| [Boot chain](boot-chain/README.md) | ROM → TF-A → OP-TEE → U-Boot → kernel, FIP, thời gian boot | 11/2026 |
| [U-Boot](u-boot/README.md) | env, bootargs, FIT, TFTP/NFS | 11/2026 |
| [Device tree](device-tree/README.md) | binding, pinctrl, interrupts, overlay, dtbs_check | 11/2026 |
| [Kernel build & config](kernel-build/README.md) | Kconfig, fragment, module, vermagic | 11/2026 |
| [Interrupts & deferred work](interrupts-deferred-work/README.md) | threaded IRQ, workqueue, hrtimer | 12/2026–01/2027 |
| [Kernel module & character driver](module-char-driver/README.md) | misc device, file_operations, poll, ioctl | 01/2027 |
| [Driver model, I2C/SPI client & regmap](driver-model/README.md) | probe, devm, deferred probe, regmap | 01/2027 |
| [Kernel concurrency](kernel-concurrency/README.md) | spinlock, mutex, completion, RCU, lockdep | 01/2027 |
| [Kernel debugging](kernel-debugging/README.md) | dynamic debug, ftrace, oops, KASAN, pstore | 01/2027 |
| [IIO subsystem](iio-subsystem/README.md) | channel, buffer, trigger, FIFO | 02/2027 |
| [Kernel memory & DMA](kernel-memory-dma/README.md) | GFP, DMA API, cache coherency, CMA | 02/2027 |
| [Power management](power-management/README.md) | runtime PM, suspend/resume, regulator, cpufreq | 02/2027, 06/2027 |
| [Upstream workflow](upstream-workflow/README.md) | checkpatch, git send-email, review | 09/2027 |

Yocto (03/2027) theo dõi ở [TRACKING.md](../TRACKING.md#yocto--build); folder lab tạo khi bắt đầu giai đoạn đó.
Mỗi topic có README (hướng dẫn, Deep dive, phần làm tay và phần dùng AI) và REPORT.md để ghi kết quả.
