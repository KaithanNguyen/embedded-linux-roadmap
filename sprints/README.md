# Sprints — kế hoạch theo tuần
Mỗi tuần là một sprint. Tên folder: `YYYY-MM-DD_topic` (ngày thứ Hai đầu tuần); tạo folder khi bắt đầu tuần, dùng [sprint template](../templates/sprint-report.md).
Mỗi sprint có README, exercises, scripts, debug và evidence khi cần.

## Output bắt buộc mỗi tuần
- 2 commit có ý nghĩa.
- 1 bản ghi [debug journal](../debug-logs/README.md) (hoặc "đã thử gì, giả thuyết gì").
- 1–2 bài [LeetCode](../leetcode/README.md) hoặc 1 bài [live coding](../livecoding/README.md), vừa làm vừa nói to cách nghĩ.
- 1 bản ghi âm tiếng Anh tổng hợp tuần (bài viết: khoảng một bài mỗi tháng).
- Verify: làm lại 1–2 topic đã ở L2 được ≥ 7 ngày, kèm một bài Deep dive; cập nhật level trong [TRACKING.md](../TRACKING.md).
- Review Chủ nhật 30 phút: cập nhật cột "Output thực tế" và "Trạng thái" bên dưới, chọn ba việc quan trọng nhất tuần tới.

## Q4/2026
Từ 01/2027, Chủ nhật cuối mỗi tháng thêm các dòng tuần của tháng mới theo [bảng tháng](../ROADMAP.md#theo-tháng).

| Tuần | Giai đoạn | Output mục tiêu | Lab | Sprint | Output thực tế | Trạng thái |
| --- | --- | --- | --- | --- | --- | --- |
| 05–11/10 | Linux trên laptop | Cài Ubuntu (WSL2 hoặc máy ảo); repo học có README và log; cheat sheet các lệnh đã dùng thật trong lab; bản ghi debug đầu tiên về thẻ microSD | [exercises](2026-10-05_linux-workstation/exercises/README.md) | [Linux workstation](2026-10-05_linux-workstation/README.md) | | Đang làm |
| 12–18/10 | Linux trên laptop | Mini shell bằng C với fork, exec, wait; có test; valgrind không rò bộ nhớ | [process-signals](../linux-system/process-signals/README.md) | — | | Chưa bắt đầu |
| 19–25/10 | Linux trên laptop | Producer–consumer đa luồng với mutex và condition variable; phân tích bằng strace và perf | [concurrency](../c-cpp-foundation/concurrency/README.md), [observability-perf](../linux-system/observability-perf/README.md) | — | | Chưa bắt đầu |
| 26/10–01/11 | Linux trên laptop | Hai process trao đổi qua pipe và shared memory; binary aarch64 cross compile chạy được trên QEMU | [ipc](../linux-system/ipc/README.md), [cross-toolchain](../linux-system/cross-toolchain/README.md) | — | | Chưa bắt đầu |
| 02–08/11 | MP257F: boot | Flash Starter Package bằng STM32CubeProgrammer; console qua ST-LINK; log boot lưu vào repo, chú thích từng giai đoạn từ ROM đến systemd | [boot-chain](../linux-kernel/boot-chain/README.md), [uart](../hardware/uart/README.md), [exception-levels-boot](../arm-architecture/exception-levels-boot/README.md) | — | | Chưa bắt đầu |
| 09–15/11 | MP257F: SDK | Cài Developer Package; app tự cross compile chạy trên board; debug từ xa bằng gdbserver | [cross-toolchain](../linux-system/cross-toolchain/README.md), [memory-mmap](../linux-system/memory-mmap/README.md) | — | | Chưa bắt đầu |
| 16–22/11 | MP257F: U-Boot | Boot kernel thủ công từ dấu nhắc U-Boot; đổi bootargs; bảng thời gian boot từng giai đoạn | [u-boot](../linux-kernel/u-boot/README.md), [electrical-basics](../hardware/electrical-basics/README.md) | — | | Chưa bắt đầu |
| 23–29/11 | MP257F: device tree | Kernel + DTB tự build chạy trên board; LED và nút bấm khai báo qua device tree; logic analyzer chụp tín hiệu GPIO | [device-tree](../linux-kernel/device-tree/README.md), [kernel-build](../linux-kernel/kernel-build/README.md), [gpio](../hardware/gpio/README.md) | — | | Chưa bắt đầu |
| 30/11–06/12 | LSM6DSOX: I2C | Đo 3.3V bằng đồng hồ rồi mới nối dây; i2cdetect thấy cảm biến; WHO_AM_I đọc ra 0x6C; logic analyzer giải mã gói I2C | [i2c](../hardware/i2c/README.md), [register-programming](../hardware/register-programming/README.md) | — | | Chưa bắt đầu |
| 07–13/12 | LSM6DSOX: user space | Chương trình C qua `/dev/i2c` đọc gia tốc và con quay ở 104 Hz, trục Z khoảng 1 g khi nằm yên; đo dòng cảm biến ở hai chế độ | [sensor-signal](../hardware/sensor-signal/README.md), [mmu-cache](../arm-architecture/mmu-cache/README.md) | — | | Chưa bắt đầu |
| 14–20/12 | LSM6DSOX: IIO + IRQ | Bật driver `st_lsm6dsx` qua device tree; đọc dữ liệu qua IIO sysfs và buffer; chân INT1 làm ngắt data-ready | [interrupts-deferred-work](../linux-kernel/interrupts-deferred-work/README.md), [interrupts-gic-nvic](../arm-architecture/interrupts-gic-nvic/README.md), [event-loop](../linux-system/event-loop/README.md) | — | | Chưa bắt đầu |
| 21–27/12 | LSM6DSOX: SPI | Chuyển sang SPI; so sánh thời gian đọc I2C và SPI bằng logic analyzer; đo độ trễ từ cạnh INT1 đến lúc user space bật một GPIO | [spi](../hardware/spi/README.md), [memory-ordering](../arm-architecture/memory-ordering/README.md) | — | | Chưa bắt đầu |
| 28/12–03/01 | Tổng kết quý | Bài viết tiếng Anh "Bringing up LSM6DSOX on STM32MP257F-DK"; 10 bản ghi debug | [write-ups](../docs/writeups/README.md), [debug drills](../debug-drills/README.md) | — | | Chưa bắt đầu |

Topic C/C++ chạy song song vào tối T2 theo [c-cpp-foundation](../c-cpp-foundation/README.md); board profile: [STM32MP257F-DK](../hardware/boards/stm32mp257f-dk.md).
