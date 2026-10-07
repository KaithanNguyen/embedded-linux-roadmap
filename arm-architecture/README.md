# Arm architecture
Kiến trúc Armv8-A (Cortex-A35 trên MP257F, Cortex-A57 trên Jetson) và Armv8-M (Cortex-M33): nền để hiểu boot, driver, DMA, latency và crash — những chỗ code "chạy được" vẫn có thể sai.
Học vào buổi T5 (MCU và hệ thống), xen với [hardware](../hardware/README.md). Level và evidence theo dõi ở [TRACKING.md](../TRACKING.md#arm-architecture).

| Topic | Nội dung | Dự kiến |
| --- | --- | --- |
| [Exception levels & boot](exception-levels-boot/README.md) | EL0–EL3, TrustZone, SMC, PSCI | 11/2026 |
| [MMU, cache & memory hierarchy](mmu-cache/README.md) | Page table, TLB, Normal/Device memory, cache, false sharing | 12/2026 |
| [Memory ordering & barriers](memory-ordering/README.md) | Weak memory model, LDAR/STLR, DMB/DSB, litmus test | 12/2026 |
| [Interrupt controllers: GIC & NVIC](interrupts-gic-nvic/README.md) | Đường đi ngắt, priority, affinity, latency | 12/2026 |
| [Assembly & ABI](assembly-abi/README.md) | AAPCS64/AAPCS, stack frame, đọc disassembly | 01/2027 |
| [Cortex-M exceptions & faults](cortex-m-faults/README.md) | HardFault, thanh ghi fault, MPU, stack overflow | 06/2027 |

Mỗi topic có README (hướng dẫn, Deep dive, phần làm tay và phần dùng AI) và REPORT.md để ghi kết quả.
Tài liệu gốc: Arm Architecture Reference Manual (Armv8-A), Technical Reference Manual của Cortex-A35, Cortex-A57, Cortex-M33, AAPCS64 — ghi phiên bản mỗi khi trích.
