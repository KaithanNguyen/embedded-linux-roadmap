# Linux system programming
User space trên Linux nhúng: process, IPC, event loop, bộ nhớ, lưu trữ bền vững, real-time và đo hiệu năng. Mỗi lab chạy cả trên host và trên board aarch64 để thấy khác biệt.
Level và evidence theo dõi ở [TRACKING.md](../TRACKING.md#linux-system-programming); lịch theo tuần ở [sprints](../sprints/README.md#q42026).

| Topic | Nội dung | Dự kiến |
| --- | --- | --- |
| [Process & signals](process-signals/README.md) | fork/exec/wait, signal, mini shell | 10/2026 |
| [Observability & performance](observability-perf/README.md) | strace, perf, flame graph, ftrace, bpftrace | 10/2026 |
| [IPC](ipc/README.md) | pipe, Unix socket, shared memory; chọn theo số đo | 10/2026 |
| [Cross toolchain & sysroot](cross-toolchain/README.md) | ABI, glibc, sysroot, QEMU user-mode | 10/2026 |
| [Virtual memory & mmap](memory-mmap/README.md) | maps/smaps, page fault, page cache, OOM | 11/2026 |
| [Event loop: epoll & timers](event-loop/README.md) | epoll, timerfd, signalfd, backpressure | 12/2026 |
| [Storage & filesystems](storage-fs/README.md) | fsync, rename nguyên tử, ext4/f2fs, flash wear | 01/2027 |
| [Real-time & latency](realtime-latency/README.md) | SCHED_FIFO, PREEMPT_RT, cyclictest | 02/2027 |

Thread, mutex, atomic và memory ordering ở mức C nằm ở [c-cpp-foundation/concurrency](../c-cpp-foundation/concurrency/README.md), không lặp lại ở đây.
Mỗi topic có README (hướng dẫn, Deep dive, phần làm tay và phần dùng AI) và REPORT.md để ghi kết quả.
