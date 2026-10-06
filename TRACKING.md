# Tracking & verification
Ma trận năng lực của toàn bộ repo. Mỗi topic có một kết quả kiểm chứng được ("Verify — làm được"), nơi làm, thời điểm dự kiến, level hiện tại và evidence.
File này là nguồn duy nhất cho level của topic: REPORT.md giữ chi tiết kết quả, TRACKING.md giữ level và link evidence.
Mọi claim ở đây được kiểm tra bằng `python tools/repo_check.py check` (xem [kiểm tra tự động](#kiểm-tra-tự-động)).

## Mức verify
| Level | Ý nghĩa | Điều kiện | Evidence bắt buộc |
| --- | --- | --- | --- |
| L0 | Chưa bắt đầu | — | — |
| L1 | Hiểu | Trả lời được [câu hỏi tự kiểm tra](docs/self-check.md) và câu recall của topic mà không xem ghi chú, không dùng AI | Không bắt buộc |
| L2 | Làm được | Lab hoặc bài có source, lệnh tái hiện, expected vs actual; test normal/boundary/error phù hợp | Link tới REPORT.md có ít nhất một kết quả Pass/Fail, hoặc file evidence trong repo |
| L3 | Kiểm chứng | Làm lại từ đầu sau ≥ 7 ngày, không xem ghi chú, không AI, trong timebox; test pass; giải thích 5 phút bằng tiếng Anh | Như L2, kèm ngày verify |
| L4 | Vận dụng | Dùng trên phần cứng thật trong project, trong một ca debug thật, hoặc viết thành bài | Link vào projects/, debug-logs/, docs/ hoặc sprints/ |

Topic ở L3/L4 được verify lại sau 90 ngày. Làm lại không đạt thì hạ về L2 và ghi lý do vào weekly review.

## Cách verify theo loại topic
| Loại | Cách verify |
| --- | --- |
| Code (C/C++, LeetCode, live coding) | Unit test + sanitizer pass; làm lại từ đầu trong timebox; giải thích độ phức tạp và edge case |
| Linux, kernel, BSP | Tái hiện trên board từ lệnh đã ghi; boot log hoặc dmesg chú thích được từng dòng quan trọng |
| Phần cứng | Sơ đồ đấu dây, số đo đồng hồ, ảnh logic analyzer; nối lại từ pin map mà không xem ghi chú |
| Mạng, video | Số đo tái hiện được bằng script (latency p50/p99, mất gói, bitrate) kèm capture |
| Độ bền, bảo mật | Fault injection có đếm (kill, rút nguồn, image hỏng, sai chữ ký); threat model được review lại |
| Thiết kế | Bản nháp 45 phút + design doc; tự review theo checklist trong [design studies](docs/design-studies/README.md) |
| Giao tiếp | Bài viết trong repo; bản ghi âm không commit, chỉ ghi lỗi và từ bị bí |

## Nhịp verify
| Chu kỳ | Việc |
| --- | --- |
| Sau mỗi lab | Điền REPORT.md; nâng level lên L2 kèm link evidence |
| Hằng tuần (Chủ nhật) | Làm lại 1–2 topic đã ở L2 được ≥ 7 ngày để lên L3; chạy `python tools/repo_check.py check` và `progress --write` |
| Hằng tháng | Spot check: làm lại 2 topic L3 chọn ngẫu nhiên; xử lý các topic trễ hạn |
| Hằng quý | Audit toàn bộ ma trận: topic trễ hạn, topic cần verify lại, level so với mục tiêu cổng |

## Mục tiêu level theo cổng
| Mốc | Mục tiêu |
| --- | --- |
| Cổng 1 — 03/2027 | Mọi topic có hạn đến 03/2027 đạt ≥ L2; CC01–CC13, KN05, KN08, KN09 đạt L3 |
| Cổng 2 — 06/2027 | Mọi topic có hạn đến 06/2027 đạt ≥ L2; topic dùng trong project (NW01, NW05, VD04, RL01–RL03, MC04) đạt L4 |
| 09/2027 | Mọi topic không tùy chọn đạt ≥ L2; ít nhất một nửa đạt L3 |

## Kiểm tra tự động
`python tools/repo_check.py check` (chạy cả trong CI) báo **lỗi** khi:
- link hoặc anchor nội bộ bị hỏng;
- topic thiếu README.md/REPORT.md, hoặc Status không thuộc bộ giá trị chuẩn;
- REPORT.md ghi Done nhưng không có kết quả Pass/Fail và link evidence;
- topic trong ma trận ghi L2+ mà không có evidence tồn tại, L3+ mà thiếu ngày verify, L4 mà không có evidence vận dụng;
- log ngày sai định dạng;
- nội dung khớp danh sách từ riêng tư cục bộ, nếu đã cấu hình (xem [tools](tools/README.md)).

**Cảnh báo** (không chặn): topic trễ hạn, topic cần verify lại, bảng progress chưa cập nhật.

## Ma trận năng lực
Cột Verified ghi ngày làm lại đạt L3 (YYYY-MM-DD). "Tùy chọn" = không tính vào mục tiêu cổng.

### C/C++
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| CC01 | Pointer | Hàm thao tác mảng qua pointer + length đúng contract; giải thích array decay, const, lifetime | [lab](c-cpp-foundation/pointer/README.md) | 10/2026 | L0 | — | — |
| CC02 | Memory | Buffer cấp phát động có một owner rõ ràng, xử lý allocation failure; ASan sạch | [lab](c-cpp-foundation/memory/README.md) | 10/2026 | L0 | — | — |
| CC03 | static / extern | Giải thích scope, linkage, storage duration; tái hiện và sửa lỗi thiếu/trùng definition | [lab](c-cpp-foundation/static-extern/README.md) | 10/2026 | L0 | — | — |
| CC04 | volatile | Chỉ ra bằng assembly khi nào volatile đổi code sinh ra; giải thích vì sao không thay được atomic/mutex | [lab](c-cpp-foundation/volatile/README.md) | 11/2026 | L0 | — | — |
| CC05 | struct / union | Encode/decode byte buffer không cast struct; giải thích padding, alignment, endianness | [lab](c-cpp-foundation/struct-union/README.md) | 11/2026 | L0 | — | — |
| CC06 | Function pointer | Dispatcher callback + context pointer; định nghĩa hành vi khi callback null | [lab](c-cpp-foundation/function-pointer/README.md) | 11/2026 | L0 | — | — |
| CC07 | Linker | Đọc nm/readelf/map; phân biệt lỗi compile với lỗi link và sửa được | [lab](c-cpp-foundation/linker/README.md) | 11/2026 | L0 | — | — |
| CC08 | Undefined behavior | Tái hiện UB bằng sanitizer, sửa, có regression test; phân biệt UB, implementation-defined, unspecified | [lab](c-cpp-foundation/undefined-behavior/README.md) | 11/2026 | L0 | — | — |
| CC09 | Integer & bitwise | API bit/field trên uint32_t; dự đoán đúng kết quả integer promotion | [lab](c-cpp-foundation/integer-bitwise/README.md) | 12/2026 | L0 | — | — |
| CC10 | Preprocessor & build | Makefile có header dependency + CMakeLists tương đương; macro an toàn | [lab](c-cpp-foundation/preprocessor-build/README.md) | 12/2026 | L0 | — | — |
| CC11 | Error handling | copy_file xử lý short write, EINTR, cleanup đúng ở mọi nhánh lỗi | [lab](c-cpp-foundation/error-handling/README.md) | 12/2026 | L0 | — | — |
| CC12 | Concurrency | Counter đúng bằng mutex và atomic; bounded queue sạch dưới ThreadSanitizer | [lab](c-cpp-foundation/concurrency/README.md) | 12/2026 | L0 | — | — |
| CC13 | GDB & debugging tools | Tìm lỗi bằng breakpoint/watchpoint; phân tích core dump offline; gdbserver trên board | [lab](c-cpp-foundation/gdb-debugging/README.md) | 01/2027 | L0 | — | — |
| CC14 | C++ RAII & ownership | `UniqueFd` move-only; giải thích rule of 0/3/5 và khi nào dùng shared_ptr | [lab](c-cpp-foundation/cpp-raii-ownership/README.md) | 01/2027 | L0 | — | — |
| CC15 | C++ classes & polymorphism | So sánh virtual dispatch với ops table của C bằng sizeof và assembly | [lab](c-cpp-foundation/cpp-oop-polymorphism/README.md) | 01/2027 | L0 | — | — |
| CC16 | C++ templates & STL | `RingBuffer<T, N>` không dùng heap; đo code size khi instantiate nhiều kiểu | [lab](c-cpp-foundation/cpp-templates-stl/README.md) | 01/2027 | L0 | — | — |
| CC17 | C/C++ interop | Gọi thư viện C từ C++ đúng `extern "C"`; đo ảnh hưởng của -fno-exceptions/-fno-rtti | [lab](c-cpp-foundation/cpp-c-interop/README.md) | 02/2027 | L0 | — | — |

### Linux system programming
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| LS01 | Shell, filesystem, permission | Dùng thành thạo 50 lệnh trong cheat sheet; phân biệt disk, partition, filesystem, mount | [cheat sheet](docs/linux-cheatsheet.md) | 10/2026 | L0 | — | — |
| LS02 | Process: fork, exec, wait, signal | Mini shell chạy lệnh và pipe, xử lý Ctrl-C, valgrind không rò bộ nhớ hay fd | [tuần 12–18/10](sprints/README.md#q42026) | 10/2026 | L0 | — | — |
| LS03 | Thread & đồng bộ | Producer–consumer đúng dưới ThreadSanitizer; giải thích deadlock và priority inversion | [tuần 19–25/10](sprints/README.md#q42026) | 10/2026 | L0 | — | — |
| LS04 | IPC | Hai process trao đổi qua pipe và shared memory có đồng bộ; biết khi nào dùng socket, message queue | [tuần 26/10–01/11](sprints/README.md#q42026) | 10/2026 | L0 | — | — |
| LS05 | System call, file I/O, mmap | Giải thích đường đi của một system call; dùng strace chỉ ra syscall của chương trình; mmap một file | [sprints](sprints/README.md#q42026) | 10/2026 | L0 | — | — |
| LS06 | Cross compile & QEMU | Binary aarch64 chạy trên QEMU; giải thích toolchain, sysroot, ABI bằng file/readelf | [tuần 26/10–01/11](sprints/README.md#q42026) | 10/2026 | L0 | — | — |
| LS07 | Profiling & tracing | Tìm bottleneck bằng perf, có số đo trước/sau | [tuần 19–25/10](sprints/README.md#q42026) | 10/2026 | L0 | — | — |
| LS08 | Event loop | Service đơn luồng xử lý socket + timer bằng epoll và timerfd | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 04/2027 | L0 | — | — |

### Hardware & bench
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| HW01 | Electrical basics & datasheet | Pin map 40 chân của hai board kèm số đo; tính điện trở hạn dòng LED | [lab](hardware/electrical-basics/README.md) | 11/2026 | L0 | — | — |
| HW02 | UART & serial console | Console qua ST-LINK và USB-UART; nhận ra lỗi sai baud hoặc đấu dây từ triệu chứng | [lab](hardware/uart/README.md) | 11/2026 | L0 | — | — |
| HW03 | GPIO | Điều khiển LED, đọc nút bằng libgpiod; giải thích pull-up, active-low, pinmux | [lab](hardware/gpio/README.md) | 11/2026 | L0 | — | — |
| HW04 | I2C | Đọc WHO_AM_I và dữ liệu LSM6DSOX qua /dev/i2c; giải mã gói bằng logic analyzer | [lab](hardware/i2c/README.md) | 12/2026 | L0 | — | — |
| HW05 | SPI | Loopback + LSM6DSOX qua SPI; so sánh timing với I2C | [lab](hardware/spi/README.md) | 12/2026 | L0 | — | — |
| HW06 | Đo đạc | Bảng dòng tiêu thụ cảm biến theo chế độ; đo độ trễ INT1 → GPIO user space bằng logic analyzer | [tuần 07–27/12](sprints/README.md#q42026) | 12/2026 | L0 | — | — |

### Boot, BSP & kernel
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| KN01 | Boot flow | Chú thích boot log thật từ ROM, TF-A, OP-TEE, U-Boot đến systemd; giải thích vai trò từng stage | [STM32MP257F-DK](hardware/boards/stm32mp257f-dk.md) | 11/2026 | L0 | — | — |
| KN02 | U-Boot | Boot kernel thủ công, đổi bootargs; bảng thời gian boot từng stage | [STM32MP257F-DK](hardware/boards/stm32mp257f-dk.md) | 11/2026 | L0 | — | — |
| KN03 | Device tree | Thêm/sửa node gpio-leds, gpio-keys, I2C client; giải thích compatible, reg, interrupts, pinctrl | [STM32MP257F-DK](hardware/boards/stm32mp257f-dk.md) | 11/2026 | L0 | — | — |
| KN04 | Build kernel + DTB | Kernel + DTB tự build boot được; giải thích defconfig và cách bật một driver | [STM32MP257F-DK](hardware/boards/stm32mp257f-dk.md) | 11/2026 | L0 | — | — |
| KN05 | Kernel module & character driver | Module load/unload sạch; file_operations, copy_to_user/copy_from_user, ioctl | [roadmap](ROADMAP.md#theo-tháng) | 01/2027 | L0 | — | — |
| KN06 | Interrupt: top half, bottom half | Threaded IRQ cho INT1; giải thích khi nào dùng tasklet, workqueue, threaded IRQ | [roadmap](ROADMAP.md#theo-tháng) | 12/2026–01/2027 | L0 | — | — |
| KN07 | Đồng bộ trong kernel | Chọn spinlock, mutex hay atomic theo context; giải thích vì sao không được sleep trong atomic context | [roadmap](ROADMAP.md#theo-tháng) | 01/2027 | L0 | — | — |
| KN08 | I2C/SPI client driver + regmap | Driver probe từ device tree, đọc WHO_AM_I qua regmap, xuất dữ liệu qua sysfs | [roadmap](ROADMAP.md#theo-tháng) | 01/2027 | L0 | — | — |
| KN09 | IIO subsystem | Driver IIO tự viết: channels, buffer, trigger, data-ready IRQ; so sánh với st_lsm6dsx | [roadmap](ROADMAP.md#theo-tháng) | 02/2027 | L0 | — | — |
| KN10 | Kernel debugging | Dùng printk, dynamic debug, ftrace; giải mã một kernel oops về dòng source | [roadmap](ROADMAP.md#theo-tháng) | 01/2027 | L0 | — | — |
| KN11 | Bộ nhớ: virtual memory, mmap, DMA | Giải thích page fault và OOM killer; mmap buffer từ driver sang user space; DMA coherent và streaming | [roadmap](ROADMAP.md#theo-tháng) | 02/2027 | L0 | — | — |
| KN12 | Coding style & upstream | Patch sạch checkpatch.pl, gửi bằng git format-patch/send-email theo quy trình mailing list | [roadmap](ROADMAP.md#theo-tháng) | 09/2027 | L0 | — | — |

### Yocto & build
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| YC01 | Bitbake, layer, recipe | Giải thích luồng bitbake, layer, recipe, bbappend; build Distribution Package sạch | [roadmap](ROADMAP.md#theo-tháng) | 03/2027 | L0 | — | — |
| YC02 | Layer riêng | Image riêng boot trên board, có app, driver module và bản vá device tree | [roadmap](ROADMAP.md#theo-tháng) | 03/2027 | L0 | — | — |
| YC03 | devtool & SDK | Sửa recipe bằng devtool; build app bằng SDK sinh từ image | [roadmap](ROADMAP.md#theo-tháng) | 03/2027 | L0 | — | — |
| YC04 | Build tái hiện & license | Clean build lại cho cùng image (giải thích được khác biệt nếu có); liệt kê license của image | [roadmap](ROADMAP.md#theo-tháng) | 03/2027 | L0 | — | — |

### Power & thermal
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| PW01 | Regulator & power domain | Đọc regulator trong device tree; giải thích supply/consumer và thứ tự bật nguồn | [STM32MP257F-DK](hardware/boards/stm32mp257f-dk.md) | 02/2027 | L0 | — | — |
| PW02 | Runtime PM & suspend | Driver hỗ trợ runtime PM; đo dòng trước và sau suspend | [roadmap](ROADMAP.md#theo-tháng) | 06/2027 | L0 | — | — |
| PW03 | cpufreq, cpuidle, thermal | Đọc thermal zone và trip point; đo nhiệt độ và điện năng khi chạy tải | [Jetson Nano](hardware/boards/jetson-nano.md) | 08/2027 | L0 | — | — |
| PW04 | Power budget thiết bị chạy pin | Ước tính thời gian chạy pin từ dòng tiêu thụ đo được của từng khối | [design studies](docs/design-studies/README.md) | 05/2027 | L0 | — | — |

### Networking
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| NW01 | Socket TCP/UDP | Server/client TCP và UDP; xử lý partial read/write, timeout, reconnect | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 04/2027 | L0 | — | — |
| NW02 | TCP/IP qua capture | Giải thích bằng Wireshark capture thật: 3-way handshake, retransmission, MTU, fragmentation | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 04/2027 | L0 | — | — |
| NW03 | DHCP, DNS, routing | Lần theo capture DHCP và DNS khi thiết bị vào mạng; đọc bảng route | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 04/2027 | L0 | — | — |
| NW04 | Wi-Fi | Kết nối MP257F bằng wpa_supplicant/iw; giải thích scan, authentication, association, 4-way handshake | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 04/2027 | L0 | — | — |
| NW05 | TLS & certificate | Kênh mTLS giữa hai board; giải thích handshake và chuỗi certificate | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 04/2027 | L0 | — | — |
| NW06 | MQTT | Pub/sub qua Mosquitto; so sánh QoS 0/1/2 và TCP thuần bằng số đo | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 04/2027 | L0 | — | — |
| NW07 | Đo đạc mạng | Script đo latency p50/p99, mất gói, throughput (iperf3) tái hiện được | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 04/2027 | L0 | — | — |
| NW08 | Service bằng Go | Service Go nhận dữ liệu IMU, có test, cross compile cho arm64 | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 04/2027 | L0 | — | — |
| NW09 | Bluetooth LE | Giải thích GAP/GATT; quét và đọc một characteristic bằng bluetoothctl | — | Tùy chọn | L0 | — | — |
| NW10 | Kết nối di động | ModemManager và AT command cơ bản | — | Tùy chọn | L0 | — | — |

### Camera & video
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| VD01 | V4L2 | Liệt kê format, capture frame bằng v4l2-ctl; giải thích buffer mmap/dmabuf | [Jetson Nano](hardware/boards/jetson-nano.md) | 05/2027 | L0 | — | — |
| VD02 | Camera pipeline | Vẽ và giải thích sensor → CSI → ISP → memory trên Jetson với IMX219 | [Jetson Nano](hardware/boards/jetson-nano.md) | 05/2027 | L0 | — | — |
| VD03 | H.264 | Giải thích I/P/B frame, GOP, CBR/VBR; đo bitrate và chất lượng với hai cấu hình | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 05/2027 | L0 | — | — |
| VD04 | GStreamer | Pipeline capture → encode phần cứng → mux; debug bằng GST_DEBUG | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 05/2027 | L0 | — | — |
| VD05 | Ghi file chịu mất điện | Ghi segment hoặc fragmented MP4 để clip đã đóng không hỏng khi mất điện | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 05/2027 | L0 | — | — |
| VD06 | Streaming RTP/RTSP | Stream video qua RTP; giải thích vì sao video thời gian thực hay dùng UDP | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 05/2027 | L0 | — | — |
| VD07 | Đồng bộ video và sensor | Timestamp video và dữ liệu IMU đồng bộ, có số đo sai lệch | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 05/2027 | L0 | — | — |

### Reliability & update
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| RL01 | systemd service & watchdog | Unit có Restart và WatchdogSec; test treo/crash có log | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 06/2027 | L0 | — | — |
| RL02 | An toàn khi mất điện | Rút nguồn 500 lần khi đang ghi, đếm file hỏng; giải thích fsync, rename nguyên tử, journaling | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 06/2027 | L0 | — | — |
| RL03 | OTA A/B + rollback | Cập nhật A/B bằng RAUC hoặc SWUpdate; image lỗi tự rollback | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 06/2027 | L0 | — | — |
| RL04 | Chẩn đoán sau crash | Core dump, pstore/ramoops, log giữ qua reboot | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 06/2027 | L0 | — | — |
| RL05 | Logging & telemetry | Buffer có giới hạn khi mất mạng, gửi lại theo thứ tự, không làm đầy storage | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 06/2027 | L0 | — | — |
| RL06 | Boot time | Đo và giảm thời gian boot, có số liệu trước/sau | [STM32MP257F-DK](hardware/boards/stm32mp257f-dk.md) | 06/2027 | L0 | — | — |
| RL07 | Chạy dài hạn | Test 24 giờ: memory, CPU, fd không rò; giới hạn tài nguyên bằng cgroups/ulimit | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 06/2027 | L0 | — | — |
| RL08 | Kiểm thử sản xuất | Script kiểm tra board mới: console, sensor, mạng; báo cáo pass/fail | — | Tùy chọn | L0 | — | — |

### Security
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| SC01 | Threat model | Threat model một trang theo STRIDE cho project | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 07/2027 | L0 | — | — |
| SC02 | Secure boot | Giải thích chain of trust ROM → TF-A → OP-TEE → U-Boot → kernel; bật xác thực image trên MP257F hoặc mô phỏng | [STM32MP257F-DK](hardware/boards/stm32mp257f-dk.md) | 07/2027 | L0 | — | — |
| SC03 | Ký firmware & cập nhật an toàn | Image OTA được ký; image sai chữ ký bị từ chối | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 07/2027 | L0 | — | — |
| SC04 | dm-verity & rootfs chỉ đọc | Rootfs dùng dm-verity; sửa một byte thì bị từ chối khi mount | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 07/2027 | L0 | — | — |
| SC05 | Mã hóa & lưu khóa | Mã hóa dữ liệu lưu trữ; giải thích nơi lưu khóa (OP-TEE, secure element) | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 07/2027 | L0 | — | — |
| SC06 | Toàn vẹn dữ liệu ghi hình | Clip + metadata có hash và chữ ký; phát hiện được chỉnh sửa | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 07/2027 | L0 | — | — |
| SC07 | Hardening Linux | Service chạy quyền tối thiểu: user riêng, capabilities, systemd sandboxing | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 07/2027 | L0 | — | — |

### Testing & CI
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| TS01 | Unit test C + fake HAL | Test logic driver trên host với register giả lập (Unity hoặc CMocka) | [C/C++](c-cpp-foundation/README.md) | 11/2026 | L0 | — | — |
| TS02 | GoogleTest | Test C++ bằng GoogleTest, có fixture và mock | [C/C++](c-cpp-foundation/README.md) | 01/2027 | L0 | — | — |
| TS03 | pytest + test trên board | pytest điều khiển board qua serial/SSH, assert theo log | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 03/2027 | L0 | — | — |
| TS04 | CI | GitHub Actions build, cross compile, chạy test; nhánh main luôn xanh | [workflow](.github/workflows/ci.yml) | 11/2026 | L0 | — | — |
| TS05 | Coverage & static analysis | gcov/lcov, cppcheck, clang-tidy hoặc -fanalyzer; sửa ít nhất một lỗi thật tìm được | [C/C++](c-cpp-foundation/README.md) | 01/2027 | L0 | — | — |
| TS06 | Fuzzing | Fuzz frame parser bằng libFuzzer hoặc AFL; tìm, sửa, thêm regression test | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 04/2027 | L0 | — | — |
| TS07 | Test plan & fault injection | Test plan map requirement ↔ test, đủ normal/boundary/error/recovery | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 06/2027 | L0 | — | — |

### MCU & RTOS
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| MC01 | Firmware Cortex-M33 | Build và load firmware M33 qua remoteproc bằng STM32CubeMP2; điều khiển LED/buzzer | [STM32MP257F-DK](hardware/boards/stm32mp257f-dk.md) | 06/2027 | L0 | — | — |
| MC02 | Interrupt, timer, low-power trên MCU | Ngắt GPIO và timer trên M33; đo latency ngắt | [STM32MP257F-DK](hardware/boards/stm32mp257f-dk.md) | 06/2027 | L0 | — | — |
| MC03 | RTOS | Task, queue, semaphore; tái hiện priority inversion và sửa bằng priority inheritance | [STM32MP257F-DK](hardware/boards/stm32mp257f-dk.md) | 06/2027 | L0 | — | — |
| MC04 | RPMsg/OpenAMP | M33 gửi mẫu IMU lên Linux qua RPMsg; đo jitter lấy mẫu | [project](projects/stm32mp257f-dk_jetson-nano/README.md) | 06/2027 | L0 | — | — |
| MC05 | Zephyr | Build ứng dụng Zephyr cho một board được hỗ trợ; đọc driver model | — | Tùy chọn | L0 | — | — |

### Algorithms & timed coding
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| AL01 | LeetCode | 100 bài Easy–Medium, ít nhất 30 bài Verified | [leetcode](leetcode/README.md) | 06/2027 | L0 | — | — |
| AL02 | Live coding embedded C | 20 bài, mỗi bài đạt ≥ 11/14 không gợi ý | [livecoding](livecoding/README.md) | 06/2027 | L0 | — | — |
| AL03 | Mini project cùng AI | Mỗi tháng một mini project 90 phút; lỗi của AI ghi vào AI error log | [livecoding](livecoding/README.md#mini-project-90-phút-cùng-ai--mỗi-tháng) | 06/2027 | L0 | — | — |

### Design & communication
| ID | Topic | Verify — làm được | Nơi làm | Dự kiến | Level | Verified | Evidence |
| --- | --- | --- | --- | --- | --- | --- | --- |
| DS01 | Thiết kế: thiết bị camera chạy pin | Design doc: ghi liên tục, buffer trước sự kiện, tải lên khi cắm dock, ngân sách pin | [design studies](docs/design-studies/README.md) | 05/2027 | L0 | — | — |
| DS02 | Thiết kế: OTA cho đội thiết bị lớn | Design doc: rollout theo đợt, rollback, theo dõi lỗi | [design studies](docs/design-studies/README.md) | 06/2027 | L0 | — | — |
| DS03 | Thiết kế: logging & telemetry khi mạng chập chờn | Design doc: lưu tạm, nén, gửi lại, giới hạn bộ nhớ | [design studies](docs/design-studies/README.md) | 04/2027 | L0 | — | — |
| DS04 | Thiết kế: đồng bộ thời gian giữa nhiều thiết bị | Design doc: nguồn thời gian, sai số, gắn sự kiện giữa các thiết bị | [design studies](docs/design-studies/README.md) | 05/2027 | L0 | — | — |
| DS05 | ADR | 10 ADR có bối cảnh, phương án, số đo | [ADR](docs/adr/README.md) | 06/2027 | L0 | — | — |
| DS06 | Debug journal | 30 bản ghi root cause, ít nhất 10 bản có ảnh logic analyzer | [debug journal](debug-logs/README.md) | 06/2027 | L0 | — | — |
| DS07 | Viết kỹ thuật tiếng Anh | 20 bài viết, có link evidence | [write-ups](docs/writeups/README.md) | 06/2027 | L0 | — | — |
| DS08 | Trình bày tiếng Anh | Giải thích trong 5 phút luồng boot và đường đi một mẫu dữ liệu, không đọc ghi chú | [workflow](WORKFLOW.md#nhịp-học-hằng-tuần) | 12/2026 | L0 | — | — |
