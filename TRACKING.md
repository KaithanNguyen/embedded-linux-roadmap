# Tracking & verification
Ma trận năng lực của toàn bộ repo. Mỗi topic có một kết quả kiểm chứng được ("Verify — làm được"), nơi làm, thời điểm dự kiến, cổng, level hiện tại và evidence.
File này là nguồn duy nhất cho level của topic: REPORT.md giữ chi tiết kết quả, TRACKING.md giữ level và link evidence.
Mọi claim ở đây được kiểm tra bằng `python tools/repo_check.py check` (xem [kiểm tra tự động](#kiểm-tra-tự-động)).
Cách chọn chỗ đầu tư sâu và chỗ giao cho AI: [AI-assisted engineering](docs/ai-assisted-engineering.md).

## Mức verify
| Level | Ý nghĩa | Điều kiện | Evidence bắt buộc |
| --- | --- | --- | --- |
| L0 | Chưa bắt đầu | — | — |
| L1 | Hiểu | Trả lời được [câu hỏi tự kiểm tra](docs/self-check.md) và câu recall của topic mà không xem ghi chú, không dùng AI | Không bắt buộc |
| L2 | Làm được | Lab hoặc bài có source, lệnh tái hiện, expected vs actual; test normal/boundary/error phù hợp | Link tới REPORT.md có ít nhất một kết quả Pass/Fail, hoặc file evidence trong repo |
| L3 | Kiểm chứng | Làm lại từ đầu sau ≥ 7 ngày, không xem ghi chú, không AI, trong timebox; test pass; giải thích 5 phút bằng tiếng Anh; hoàn thành ít nhất một bài Deep dive của topic | Như L2, kèm ngày verify |
| L4 | Vận dụng | Dùng trên phần cứng thật trong project, trong một ca debug thật, hoặc viết thành bài | Link vào projects/, debug-logs/, docs/ hoặc sprints/ |

Topic ở L3/L4 được verify lại sau 90 ngày. Làm lại không đạt thì hạ về L2 và ghi lý do vào weekly review.

## Cách verify theo loại topic
| Loại | Cách verify |
| --- | --- |
| Code (C/C++, LeetCode, live coding) | Unit test + sanitizer pass; làm lại từ đầu trong timebox; giải thích độ phức tạp và edge case |
| Kiến trúc Arm | Số đo trên lõi thật (benchmark, litmus test), disassembly có chú thích, trích tài liệu kèm phiên bản |
| Linux, kernel, BSP | Tái hiện trên board từ lệnh đã ghi; boot log hoặc dmesg chú thích được từng dòng quan trọng; checkpatch sạch |
| Phần cứng | Sơ đồ đấu dây, số đo đồng hồ, ảnh logic analyzer; nối lại từ pin map mà không xem ghi chú |
| Mạng, video | Số đo tái hiện được bằng script (latency p50/p99, mất gói, bitrate) kèm capture |
| Độ bền, bảo mật | Fault injection có đếm (kill, rút nguồn, image hỏng, sai chữ ký); threat model được review lại |
| Debug drill | Bản ghi root cause trong debug journal, có thời gian tìm ra lỗi và regression test |
| Làm việc với AI | Spec viết trước; AI error log; checklist review đã áp dụng cho từng PR |
| Thiết kế | Bản nháp 45 phút + design doc; tự review theo checklist trong [design studies](docs/design-studies/README.md) |
| Giao tiếp | Bài viết trong repo; bản ghi âm không commit, chỉ ghi lỗi và từ bị bí |

## Nhịp verify
| Chu kỳ | Việc |
| --- | --- |
| Sau mỗi lab | Điền REPORT.md; nâng level lên L2 kèm link evidence |
| Hằng tuần (Chủ nhật) | Làm lại 1–2 topic đã ở L2 được ≥ 7 ngày, kèm một bài Deep dive, để lên L3; chạy `python tools/repo_check.py check` và `progress --write` |
| Hằng tháng | Spot check: làm lại 2 topic L3 chọn ngẫu nhiên; một debug drill; xử lý các topic trễ hạn |
| Hằng quý | Audit toàn bộ ma trận: topic trễ hạn, topic cần verify lại, level so với mục tiêu cổng |

## Phân loại cổng
Mỗi topic thuộc đúng một nhóm ở cột Cổng. Chỉ Cổng 1 và Cổng 2 là bắt buộc: thiếu một topic Mở rộng vẫn phải qua được cổng.

| Cổng | Gồm | Bắt buộc | Cảnh báo trễ hạn |
| --- | --- | --- | --- |
| Cổng 1 | Nền C, Linux, phần cứng, boot, kernel, driver, Yocto cơ bản và walking skeleton (LSM6DSOX → driver → sensor-svc → TCP → laptop) có test crash, timeout, restart, cleanup | Trước 03/2027 | Có |
| Cổng 2 | Đường chính chạy ổn: Linux IIO → sensor-svc → mạng (mTLS) → edge-svc → recorder, có test cắt nguồn, test 24 giờ và số đo | Trước 06/2027 | Có |
| Mở rộng | Nâng cấp sau khi đường chính ổn định: M33/RPMsg, OTA kèm ký image, secure boot, Wi-Fi, MQTT, phần đào sâu kiến trúc và kernel | Không | Không; cột Dự kiến là thời điểm sớm nhất nên làm |
| Luyện tập | Kỹ năng đo bằng số lượng, chạy song song: debug drill, LeetCode, live coding, design study, bài viết | Chỉ tiêu số lượng ở [mục tiêu cổng](#mục-tiêu-level-theo-cổng) và [chỉ số](ROADMAP.md#chỉ-số) | Không |
| Tùy chọn | Chỉ làm khi có nhu cầu thật | Không | Không |

Đổi cổng của một topic thì ghi lý do vào monthly review, ví dụ nâng HW05 (SPI) lên Cổng 2 nếu số đo cho thấy I2C không đủ băng thông.
Không hạ topic Cổng 1/Cổng 2 xuống Mở rộng chỉ để tắt cảnh báo trễ hạn: dời tháng và ghi lý do.

## Mục tiêu level theo cổng
| Mốc | Mục tiêu |
| --- | --- |
| Cổng 1 — 03/2027 | Mọi topic Cổng 1 đạt ≥ L2; CC12, KN03, KN08, KN09 đạt L3 (bài làm lại L3 của KN08 là driver cho một cảm biến I2C mới trong 1 tuần, không theo tutorial); NW01 và RL01 có evidence trong project; ít nhất 6 debug drill |
| Cổng 2 — 06/2027 | Mọi topic Cổng 1 và Cổng 2 đạt ≥ L2; NW01, NW05, VD04, RL01, RL02 đạt L4 trong project; 12 debug drill. Không yêu cầu M33/RPMsg, OTA hay detector GPU |
| 09/2027 | Ít nhất một nửa topic Cổng 1 + Cổng 2 đạt L3; topic Mở rộng đã làm đạt ≥ L2, chọn theo thời gian còn lại, ưu tiên OTA kèm ký image (RL03 + SC03) |

## Kiểm tra tự động
`python tools/repo_check.py check` (chạy cả trong CI) báo **lỗi** khi:
- link hoặc anchor nội bộ bị hỏng;
- topic thiếu README.md/REPORT.md, hoặc Status không thuộc bộ giá trị chuẩn;
- REPORT.md ghi Done nhưng không có kết quả Pass/Fail và link evidence;
- topic trong ma trận ghi L2+ mà không có evidence tồn tại, L3+ mà thiếu ngày verify, L4 mà không có evidence vận dụng;
- cột Cổng không thuộc bộ giá trị ở [phân loại cổng](#phân-loại-cổng);
- log ngày sai định dạng;
- nội dung khớp danh sách từ riêng tư cục bộ, nếu đã cấu hình (xem [tools](tools/README.md)).

**Cảnh báo** (không chặn): topic Cổng 1/Cổng 2 trễ hạn, topic cần verify lại, bảng progress chưa cập nhật, folder lab chưa có dòng trong ma trận.

## Ma trận năng lực
Cột Verified ghi ngày làm lại đạt L3 (YYYY-MM-DD). Cột Cổng theo [phân loại cổng](#phân-loại-cổng).
ID không bao giờ tái sử dụng. ID đã gộp hoặc bỏ: CC03 và CC10 → CC07; CC15 → CC06; CC16 → CC14; LS03 → CC12; AL03 → AI04; AI02 → HW07; NW08 (service bằng Go) bỏ, phần application dùng một service C++ là edge-svc.

### C/C++
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Cổng | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| CC01 | Pointer | Hàm thao tác mảng qua pointer + length đúng contract; giải thích lifetime, aliasing, alignment | [lab](c-cpp-foundation/pointer/README.md) | 10/2026 | Cổng 1 | L0 | — | — |
| CC02 | Memory | Buffer có một owner rõ ràng, xử lý allocation failure; pool allocator không malloc lúc chạy | [lab](c-cpp-foundation/memory/README.md) | 10/2026 | Cổng 1 | L0 | — | — |
| CC04 | volatile | Chỉ ra bằng assembly khi nào volatile đổi code sinh ra; giải thích vì sao không thay được atomic, mutex hay barrier | [lab](c-cpp-foundation/volatile/README.md) | 10/2026 | Cổng 1 | L0 | — | — |
| CC05 | struct / union | Encode/decode byte buffer không cast struct; khóa layout bằng static assert | [lab](c-cpp-foundation/struct-union/README.md) | 11/2026 | Cổng 1 | L0 | — | — |
| CC06 | Function pointer | Dispatcher callback + context; ops table kiểu kernel; so sánh với virtual dispatch C++ | [lab](c-cpp-foundation/function-pointer/README.md) | 11/2026 | Cổng 1 | L0 | — | — |
| CC07 | Build & link | Đọc nm/readelf/map file; linker script + startup code tối thiểu; sửa lỗi glibc version | [lab](c-cpp-foundation/build-link/README.md) | 11/2026 | Cổng 1 | L0 | — | — |
| CC08 | Undefined behavior | Tái hiện UB và tối ưu dựa trên UB; sửa có regression test | [lab](c-cpp-foundation/undefined-behavior/README.md) | 11/2026 | Cổng 1 | L0 | — | — |
| CC09 | Integer & bitwise | API bit/field trên uint32_t; dự đoán đúng integer promotion; fixed-point Q15 | [lab](c-cpp-foundation/integer-bitwise/README.md) | 11/2026 | Cổng 1 | L0 | — | — |
| CC11 | Error handling | copy_file xử lý short write, EINTR, cleanup đúng ở mọi nhánh lỗi | [lab](c-cpp-foundation/error-handling/README.md) | 12/2026 | Cổng 1 | L0 | — | — |
| CC12 | Concurrency | Bounded queue sạch dưới ThreadSanitizer; SPSC lock-free đúng trên Arm | [lab](c-cpp-foundation/concurrency/README.md) | 12/2026 | Cổng 1 | L0 | — | — |
| CC13 | GDB & debugging tools | Watchpoint, phân tích core dump, gdbserver trên board | [lab](c-cpp-foundation/gdb-debugging/README.md) | 12/2026 | Cổng 1 | L0 | — | — |
| CC14 | Modern C++ cho embedded | `UniqueFd` move-only; `RingBuffer<T, N>` không heap; đo code size | [lab](c-cpp-foundation/cpp-modern-embedded/README.md) | 01/2027 | Cổng 2 | L0 | — | — |
| CC17 | C/C++ interop | Gọi thư viện C từ C++ đúng `extern "C"`; API C ổn định cho thư viện C++ | [lab](c-cpp-foundation/cpp-c-interop/README.md) | 02/2027 | Cổng 2 | L0 | — | — |

### Arm architecture
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Cổng | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| AR01 | Exception levels & boot | Bảng stage boot → EL → world; giải thích PSCI khi hotplug CPU | [lab](arm-architecture/exception-levels-boot/README.md) | 11/2026 | Cổng 1 | L0 | — | — |
| AR02 | MMU, cache & memory hierarchy | Đồ thị latency theo working set trên A35 và A57; suy ra kích thước L1/L2 | [lab](arm-architecture/mmu-cache/README.md) | 12/2026 | Mở rộng | L0 | — | — |
| AR03 | Memory ordering & barriers | Litmus test quan sát reorder trên Arm; sửa bằng acquire/release và giải thích | [lab](arm-architecture/memory-ordering/README.md) | 12/2026 | Mở rộng | L0 | — | — |
| AR04 | Interrupt controllers: GIC & NVIC | Lần theo đường đi ngắt INT1 tới handler; đổi affinity và đo | [lab](arm-architecture/interrupts-gic-nvic/README.md) | 12/2026 | Cổng 1 | L0 | — | — |
| AR05 | Assembly & ABI | Chú thích disassembly aarch64 và M33; unwind stack bằng tay | [lab](arm-architecture/assembly-abi/README.md) | 01/2027 | Mở rộng | L0 | — | — |
| AR06 | Cortex-M exceptions & faults | Fault handler giải mã CFSR và tìm ra dòng gây lỗi | [lab](arm-architecture/cortex-m-faults/README.md) | 08/2027 | Mở rộng | L0 | — | — |

### Linux system programming
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Cổng | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LS01 | Shell, filesystem, permission | Hiểu mô hình file, process, permission; tra lệnh bằng man hoặc AI khi cần; cheat sheet chỉ ghi lệnh đã dùng thật | [cheat sheet](docs/linux-cheatsheet.md) | 10/2026 | Cổng 1 | L0 | — | — |
| LS02 | Process & signals | Mini shell chạy lệnh và pipe, xử lý Ctrl-C, không rò fd | [lab](linux-system/process-signals/README.md) | 10/2026 | Cổng 1 | L0 | — | — |
| LS04 | IPC | Số đo throughput/latency của pipe, Unix socket, shared memory; chọn cơ chế theo số đo | [lab](linux-system/ipc/README.md) | 10/2026 | Mở rộng | L0 | — | — |
| LS05 | Virtual memory & mmap | Giải thích page fault, page cache, RSS/PSS bằng số đo thật | [lab](linux-system/memory-mmap/README.md) | 11/2026 | Mở rộng | L0 | — | — |
| LS06 | Cross toolchain & sysroot | Binary aarch64 chạy trên QEMU và board; sửa được lỗi glibc/sysroot | [lab](linux-system/cross-toolchain/README.md) | 10/2026 | Cổng 1 | L0 | — | — |
| LS07 | Observability & performance | Tìm bottleneck bằng perf + flame graph, có số đo trước/sau | [lab](linux-system/observability-perf/README.md) | 10/2026 | Cổng 1 | L0 | — | — |
| LS08 | Event loop | Service epoll một luồng xử lý socket, timer, signal và tắt sạch | [lab](linux-system/event-loop/README.md) | 12/2026 | Cổng 1 | L0 | — | — |
| LS09 | Storage & filesystems | Cách ghi đúng qua 20 lần cắt nguồn không hỏng file; giải thích fsync và rename | [lab](linux-system/storage-fs/README.md) | 01/2027 | Cổng 1 | L0 | — | — |
| LS10 | Real-time & latency | Histogram cyclictest có và không tải; giải thích nguồn latency lớn nhất | [lab](linux-system/realtime-latency/README.md) | 02/2027 | Mở rộng | L0 | — | — |

### Hardware & bench
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Cổng | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| HW01 | Electrical basics & datasheet | Pin map hai board kèm số đo; tính pull-up và điện trở hạn dòng | [lab](hardware/electrical-basics/README.md) | 11/2026 | Cổng 1 | L0 | — | — |
| HW02 | UART & serial console | Console qua ST-LINK và USB-UART; chương trình termios raw mode | [lab](hardware/uart/README.md) | 11/2026 | Cổng 1 | L0 | — | — |
| HW03 | GPIO | LED, nút, edge event bằng libgpiod; gpio-leds/gpio-keys qua device tree | [lab](hardware/gpio/README.md) | 11/2026 | Cổng 1 | L0 | — | — |
| HW04 | I2C | Đọc LSM6DSOX qua /dev/i2c; giải mã gói và phục hồi bus bị treo | [lab](hardware/i2c/README.md) | 12/2026 | Cổng 1 | L0 | — | — |
| HW05 | SPI | LSM6DSOX qua SPI; so sánh timing với I2C | [lab](hardware/spi/README.md) | 02/2027 | Mở rộng | L0 | — | — |
| HW06 | Đo đạc | Bảng dòng tiêu thụ theo chế độ; latency INT1 → GPIO user space bằng logic analyzer | [tuần 07–27/12](sprints/README.md#q42026) | 12/2026 | Cổng 1 | L0 | — | — |
| HW07 | Register-level programming | Bảng register LSM6DSOX từ datasheet; đối chiếu bảng do AI sinh, ghi sai lệch | [lab](hardware/register-programming/README.md) | 12/2026 | Cổng 1 | L0 | — | — |
| HW08 | Sensor data & signal basics | Bias, noise, calibration 6 mặt; bộ lọc fixed-point | [lab](hardware/sensor-signal/README.md) | 12/2026 | Cổng 2 | L0 | — | — |

### Boot, BSP & kernel
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Cổng | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| KN01 | Boot chain | Boot log chú thích từng stage, có thời gian từng stage | [lab](linux-kernel/boot-chain/README.md) | 11/2026 | Cổng 1 | L0 | — | — |
| KN02 | U-Boot | Boot kernel thủ công; boot qua TFTP/NFS | [lab](linux-kernel/u-boot/README.md) | 11/2026 | Cổng 1 | L0 | — | — |
| KN03 | Device tree | Node LSM6DSOX và gpio-leds/gpio-keys probe đúng; dtbs_check sạch | [lab](linux-kernel/device-tree/README.md) | 11/2026 | Cổng 1 | L0 | — | — |
| KN04 | Kernel build & config | Kernel + DTB + module tự build boot được; config fragment tái hiện được | [lab](linux-kernel/kernel-build/README.md) | 11/2026 | Cổng 1 | L0 | — | — |
| KN05 | Kernel module & character driver | Misc driver có read/write/poll/ioctl; checkpatch và KASAN sạch | [lab](linux-kernel/module-char-driver/README.md) | 01/2027 | Cổng 1 | L0 | — | — |
| KN06 | Interrupts & deferred work | Threaded IRQ cho INT1, đếm mẫu mất, đo latency | [lab](linux-kernel/interrupts-deferred-work/README.md) | 12/2026–01/2027 | Cổng 1 | L0 | — | — |
| KN07 | Kernel concurrency | Khóa đúng giữa IRQ thread và read(); lockdep sạch | [lab](linux-kernel/kernel-concurrency/README.md) | 02/2027 | Cổng 1 | L0 | — | — |
| KN08 | Driver model, I2C/SPI & regmap | I2C client driver probe từ device tree qua regmap; unbind/bind sạch | [lab](linux-kernel/driver-model/README.md) | 01/2027 | Cổng 1 | L0 | — | — |
| KN09 | IIO subsystem | Driver IIO tự viết có buffer + trigger data-ready | [lab](linux-kernel/iio-subsystem/README.md) | 02/2027 | Cổng 1 | L0 | — | — |
| KN10 | Kernel debugging | Giải mã oops về dòng source; ftrace đường gọi | [lab](linux-kernel/kernel-debugging/README.md) | 01/2027 | Cổng 1 | L0 | — | — |
| KN11 | Kernel memory & DMA | dmatest, buffer coherent/streaming, mmap buffer sang user space | [lab](linux-kernel/kernel-memory-dma/README.md) | 02/2027 | Mở rộng | L0 | — | — |
| KN12 | Upstream workflow | Patch sạch checkpatch, gửi bằng git send-email | [lab](linux-kernel/upstream-workflow/README.md) | 09/2027 | Mở rộng | L0 | — | — |

### Yocto & build
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Cổng | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| YC01 | Bitbake, layer, recipe | Giải thích luồng bitbake, layer, recipe, bbappend; build Distribution Package sạch | [roadmap](ROADMAP.md#theo-tháng) | 03/2027 | Cổng 1 | L0 | — | — |
| YC02 | Layer riêng | Image riêng boot trên board, có driver IIO tự viết, sensor-svc và bản vá device tree | [roadmap](ROADMAP.md#theo-tháng) | 03/2027 | Cổng 1 | L0 | — | — |
| YC03 | devtool & SDK | Sửa recipe bằng devtool; build app bằng SDK sinh từ image | [roadmap](ROADMAP.md#theo-tháng) | 03/2027 | Mở rộng | L0 | — | — |
| YC04 | Build tái hiện & license | Clean build lại cho cùng image (giải thích được khác biệt nếu có); liệt kê license của image | [roadmap](ROADMAP.md#theo-tháng) | 03/2027 | Cổng 1 | L0 | — | — |
| YC05 | SBOM & CVE | Sinh SBOM (SPDX) và báo cáo CVE của image bằng công cụ của Yocto; xử lý một CVE | [roadmap](ROADMAP.md#theo-tháng) | 07/2027 | Mở rộng | L0 | — | — |

### Power & thermal
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Cổng | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| PW01 | Regulator & power domain | Đọc regulator trong device tree; giải thích supply/consumer và thứ tự bật nguồn | [lab](linux-kernel/power-management/README.md) | 02/2027 | Mở rộng | L0 | — | — |
| PW02 | Runtime PM & suspend | Runtime PM cho driver LSM6DSOX; số đo dòng trước và sau | [lab](linux-kernel/power-management/README.md) | 08/2027 | Mở rộng | L0 | — | — |
| PW03 | cpufreq, cpuidle, thermal | Đọc thermal zone và trip point; đo nhiệt độ và điện năng khi chạy tải | [Jetson Nano](hardware/boards/jetson-nano.md) | 08/2027 | Mở rộng | L0 | — | — |
| PW04 | Power budget thiết bị chạy pin | Ước tính thời gian chạy pin từ dòng tiêu thụ đo được của từng khối | [design studies](docs/design-studies/README.md) | 05/2027 | Mở rộng | L0 | — | — |

### Networking
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Cổng | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| NW01 | Socket TCP/UDP | Walking skeleton: sensor-svc gửi dữ liệu IMU qua TCP tới receiver; xử lý partial read/write, timeout, mất kết nối, buffer đầy, shutdown sạch | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 12/2026–01/2027 | Cổng 1 | L0 | — | — |
| NW02 | TCP/IP qua capture | Giải thích bằng Wireshark capture của chính hệ thống: 3-way handshake, retransmission, MTU, cửa sổ TCP | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 02/2027 | Cổng 2 | L0 | — | — |
| NW03 | DHCP, DNS, routing | Lần theo capture DHCP và DNS khi thiết bị vào mạng; đọc bảng route | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 04/2027 | Mở rộng | L0 | — | — |
| NW04 | Wi-Fi | Kết nối MP257F bằng wpa_supplicant/iw; giải thích scan, authentication, association, 4-way handshake | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 04/2027 | Mở rộng | L0 | — | — |
| NW05 | TLS & certificate | Kênh mTLS giữa hai board; giải thích handshake và chuỗi certificate | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 04/2027 | Cổng 2 | L0 | — | — |
| NW06 | MQTT | Pub/sub qua Mosquitto; so sánh QoS 0/1/2 và TCP thuần bằng số đo | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 04/2027 | Mở rộng | L0 | — | — |
| NW07 | Đo đạc mạng | Script đo latency p50/p99, mất gói, throughput chạy được trên skeleton và lặp lại sau mỗi thay đổi | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 02/2027 | Cổng 2 | L0 | — | — |
| NW09 | Bluetooth LE | Giải thích GAP/GATT; quét và đọc một characteristic bằng bluetoothctl | — | — | Tùy chọn | L0 | — | — |
| NW10 | Kết nối di động | ModemManager và AT command cơ bản | — | — | Tùy chọn | L0 | — | — |
| NW11 | TCP cho latency thấp | Giải thích Nagle, delayed ACK, keepalive, socket buffer; đo ảnh hưởng của TCP_NODELAY | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 02/2027 | Cổng 2 | L0 | — | — |

### Camera & video
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Cổng | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| VD01 | V4L2 | Liệt kê format, capture frame bằng v4l2-ctl; giải thích buffer mmap/dmabuf | [Jetson Nano](hardware/boards/jetson-nano.md) | 05/2027 | Mở rộng | L0 | — | — |
| VD02 | Camera pipeline | Vẽ và giải thích sensor → CSI → ISP → memory trên Jetson với IMX219 | [Jetson Nano](hardware/boards/jetson-nano.md) | 05/2027 | Mở rộng | L0 | — | — |
| VD03 | H.264 | Giải thích I/P/B frame, GOP, CBR/VBR; đo bitrate và chất lượng với hai cấu hình | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 05/2027 | Cổng 2 | L0 | — | — |
| VD04 | GStreamer | Pipeline capture → encode phần cứng → mux; debug bằng GST_DEBUG | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 05/2027 | Cổng 2 | L0 | — | — |
| VD05 | Ghi file chịu mất điện | Ghi segment hoặc fragmented MP4 để clip đã đóng không hỏng khi mất điện | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 05/2027 | Cổng 2 | L0 | — | — |
| VD06 | Streaming RTP/RTSP | Stream video qua RTP; giải thích vì sao video thời gian thực hay dùng UDP | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | — | Tùy chọn | L0 | — | — |
| VD07 | Đồng bộ video và sensor | Timestamp video và dữ liệu IMU đồng bộ, có số đo sai lệch | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 05/2027 | Cổng 2 | L0 | — | — |

### Reliability & update
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Cổng | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| RL01 | systemd service & watchdog | Service đầu tiên chạy bằng systemd có Restart và WatchdogSec; test crash, treo, timeout và cleanup có log | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 01/2027 | Cổng 1 | L0 | — | — |
| RL02 | An toàn khi mất điện | Test cắt nguồn ngay khi bắt đầu ghi dữ liệu trên thiết bị: bắt đầu 04/2027 trên Jetson, 500 lần với recorder; giải thích fsync, rename nguyên tử, journaling | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 04–05/2027 | Cổng 2 | L0 | — | — |
| RL03 | OTA A/B + rollback | Cập nhật A/B bằng RAUC hoặc SWUpdate; image phải được ký và bị từ chối khi sai chữ ký ngay trong milestone này; image lỗi tự rollback | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 07/2027 | Mở rộng | L0 | — | — |
| RL04 | Chẩn đoán sau crash | Core dump và log giữ qua reboot (journald persistent, pstore) cho service; phân tích một crash thật | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 02/2027 | Cổng 1 | L0 | — | — |
| RL05 | Logging & telemetry | Outbox có giới hạn khi mất mạng, gửi lại theo thứ tự, đếm phần bị bỏ; không làm đầy bộ nhớ | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 01/2027 | Cổng 1 | L0 | — | — |
| RL06 | Boot time | Đo và giảm thời gian boot, có số liệu trước/sau | [STM32MP257F-DK](hardware/boards/stm32mp257f-dk.md) | 03/2027 | Mở rộng | L0 | — | — |
| RL07 | Chạy dài hạn | Test 24 giờ: memory, CPU, fd không rò; giới hạn tài nguyên bằng cgroups/ulimit | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 05/2027 | Cổng 2 | L0 | — | — |
| RL08 | Kiểm thử sản xuất | Script kiểm tra board mới: console, sensor, mạng; báo cáo pass/fail | — | — | Tùy chọn | L0 | — | — |

### Security
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Cổng | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| SC01 | Threat model | Threat model một trang (STRIDE) viết cùng thiết kế skeleton v0, trước khi code; cập nhật khi thêm Jetson, recorder, OTA | [threat model](projects/stm32mp257f-dk_jetson-nano/docs/threat-model.md) | 12/2026–01/2027 | Cổng 1 | L0 | — | — |
| SC02 | Secure boot | Giải thích chain of trust ROM → TF-A → OP-TEE → U-Boot → kernel; bật xác thực image trên MP257F hoặc mô phỏng | [STM32MP257F-DK](hardware/boards/stm32mp257f-dk.md) | 07/2027 | Mở rộng | L0 | — | — |
| SC03 | Ký firmware & cập nhật an toàn | Image OTA được ký; image sai chữ ký bị từ chối — làm trong cùng milestone với RL03 | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 07/2027 | Mở rộng | L0 | — | — |
| SC04 | dm-verity & rootfs chỉ đọc | Rootfs dùng dm-verity; sửa một byte thì bị từ chối khi mount | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 07/2027 | Mở rộng | L0 | — | — |
| SC05 | Mã hóa & lưu khóa | Mã hóa dữ liệu lưu trữ; giải thích nơi lưu khóa (OP-TEE, secure element) | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 07/2027 | Mở rộng | L0 | — | — |
| SC06 | Toàn vẹn dữ liệu ghi hình | Clip + metadata có SHA-256 và được kiểm khi đọc lại; chữ ký số thuộc phần mở rộng | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 05/2027 | Cổng 2 | L0 | — | — |
| SC07 | Hardening Linux | sensor-svc không chạy bằng root ngay từ skeleton v0; từ v1 chạy bằng user riêng, có systemd sandboxing, kiểm bằng `systemd-analyze security` | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 01/2027 | Cổng 1 | L0 | — | — |

### Testing & CI
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Cổng | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| TS01 | Unit test C + fake HAL | Test logic driver trên host với register giả lập (Unity hoặc CMocka) | [C/C++](c-cpp-foundation/README.md) | 11/2026 | Cổng 1 | L0 | — | — |
| TS02 | GoogleTest | Test C++ bằng GoogleTest, có fixture và mock | [C/C++](c-cpp-foundation/README.md) | 01/2027 | Cổng 2 | L0 | — | — |
| TS03 | pytest + test trên board | pytest điều khiển board qua serial/SSH, assert theo log | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 04/2027 | Cổng 2 | L0 | — | — |
| TS04 | CI | GitHub Actions build, cross compile, chạy test; nhánh main luôn xanh | [workflow](.github/workflows/ci.yml) | 11/2026 | Cổng 1 | L0 | — | — |
| TS05 | Coverage & static analysis | gcov/lcov, cppcheck, clang-tidy hoặc -fanalyzer; sửa ít nhất một lỗi thật tìm được | [C/C++](c-cpp-foundation/README.md) | 01/2027 | Mở rộng | L0 | — | — |
| TS06 | Fuzzing | Fuzz frame parser của protocol bằng libFuzzer hoặc AFL ngay khi có codec; tìm, sửa, thêm regression test | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 02/2027 | Cổng 2 | L0 | — | — |
| TS07 | Test plan & fault injection | Test plan map requirement ↔ test từ skeleton đầu tiên, đủ normal/boundary/error/recovery; cập nhật ở mỗi phần | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 01/2027 | Cổng 1 | L0 | — | — |

### MCU & RTOS
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Cổng | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| MC01 | Firmware Cortex-M33 | Build và load firmware M33 qua remoteproc bằng STM32CubeMP2; điều khiển LED/buzzer | [STM32MP257F-DK](hardware/boards/stm32mp257f-dk.md) | 08/2027 | Mở rộng | L0 | — | — |
| MC02 | Interrupt, timer, low-power trên MCU | Ngắt GPIO và timer trên M33; đo latency ngắt | [STM32MP257F-DK](hardware/boards/stm32mp257f-dk.md) | 08/2027 | Mở rộng | L0 | — | — |
| MC03 | RTOS | Task, queue, semaphore; tái hiện priority inversion và sửa bằng priority inheritance | [STM32MP257F-DK](hardware/boards/stm32mp257f-dk.md) | 08/2027 | Mở rộng | L0 | — | — |
| MC04 | RPMsg/OpenAMP | M33 gửi mẫu IMU lên Linux qua RPMsg; đo jitter lấy mẫu | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 08/2027 | Mở rộng | L0 | — | — |
| MC05 | Zephyr | Build ứng dụng Zephyr cho một board được hỗ trợ; đọc driver model | — | — | Tùy chọn | L0 | — | — |

### Debugging
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Cổng | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| DB01 | Debug drills | 12 drill có bản ghi root cause, mỗi tầng ít nhất hai drill | [debug drills](debug-drills/README.md) | 06/2027 | Luyện tập | L0 | — | — |
| DB02 | JTAG/SWD với OpenOCD | Dừng Cortex-M33 tại breakpoint và tại fault qua ST-LINK | [Cortex-M faults](arm-architecture/cortex-m-faults/README.md) | 08/2027 | Mở rộng | L0 | — | — |
| DB03 | git bisect & regression | Tìm commit gây regression bằng git bisect chạy script tự động | [debug drills](debug-drills/README.md) | 02/2027 | Mở rộng | L0 | — | — |

### AI-assisted engineering
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Cổng | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| AI01 | Spec trước khi dùng AI | Spec một trang có acceptance criteria đo được cho từng component của project, viết trước khi nhờ AI | [AI-assisted engineering](docs/ai-assisted-engineering.md) | 12/2026 | Luyện tập | L0 | — | — |
| AI03 | Kiểm chứng bằng test | Code do AI viết có test normal/boundary/error, sanitizer và chạy trên board trước khi merge | [AI-assisted engineering](docs/ai-assisted-engineering.md) | 01/2027 | Luyện tập | L0 | — | — |
| AI04 | Mini project cùng AI | Mỗi tháng một mini project 90 phút; review từng dòng, lỗi của AI có trong log | [livecoding](livecoding/README.md#mini-project-90-phút-cùng-ai--mỗi-tháng) | 06/2027 | Luyện tập | L0 | — | — |
| AI05 | Khuôn mẫu lỗi của AI | AI error log có ≥ 10 mục và khuôn mẫu theo tháng; checklist review được cập nhật từ đó | [AI error log](docs/ai-error-log.md) | 06/2027 | Luyện tập | L0 | — | — |

### Algorithms & timed coding
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Cổng | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| AL01 | LeetCode | 60 bài pattern cốt lõi, ít nhất 30 bài Verified | [leetcode](leetcode/README.md) | 06/2027 | Luyện tập | L0 | — | — |
| AL02 | Live coding embedded C | 15 bài, mỗi bài đạt ≥ 11/14 không gợi ý | [livecoding](livecoding/README.md) | 06/2027 | Luyện tập | L0 | — | — |

### Design & communication
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Cổng | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| DS01 | Thiết kế: thiết bị camera chạy pin | Design doc: ghi liên tục, buffer trước sự kiện, tải lên khi cắm dock, ngân sách pin | [design studies](docs/design-studies/README.md) | 05/2027 | Luyện tập | L0 | — | — |
| DS02 | Thiết kế: OTA cho đội thiết bị lớn | Design doc: rollout theo đợt, rollback, theo dõi lỗi | [design studies](docs/design-studies/README.md) | 06/2027 | Luyện tập | L0 | — | — |
| DS03 | Thiết kế: logging & telemetry khi mạng chập chờn | Design doc: lưu tạm, nén, gửi lại, giới hạn bộ nhớ | [design studies](docs/design-studies/README.md) | 04/2027 | Luyện tập | L0 | — | — |
| DS04 | Thiết kế: đồng bộ thời gian giữa nhiều thiết bị | Design doc: nguồn thời gian, sai số, gắn sự kiện giữa các thiết bị | [design studies](docs/design-studies/README.md) | 05/2027 | Luyện tập | L0 | — | — |
| DS05 | ADR | ADR cho mọi quyết định đã chốt của đường chính (ít nhất 5), có bối cảnh, phương án, số đo | [ADR](docs/adr/README.md) | 06/2027 | Cổng 2 | L0 | — | — |
| DS06 | Debug journal | 30 bản ghi root cause, ít nhất 10 bản có ảnh logic analyzer | [debug journal](debug-logs/README.md) | 06/2027 | Luyện tập | L0 | — | — |
| DS07 | Viết kỹ thuật tiếng Anh | 12 bài viết (khoảng một bài mỗi tháng), có link evidence | [write-ups](docs/writeups/README.md) | 06/2027 | Luyện tập | L0 | — | — |
| DS08 | Trình bày tiếng Anh | Giải thích trong 5 phút luồng boot và đường đi một mẫu dữ liệu, không đọc ghi chú | [workflow](WORKFLOW.md#nhịp-học-hằng-tuần) | 12/2026 | Cổng 1 | L0 | — | — |
