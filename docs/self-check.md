# Câu hỏi tự kiểm tra
Dùng để verify mức L1 trong [TRACKING.md](../TRACKING.md#mức-verify): trả lời bằng lời hoặc viết ra, không xem ghi chú và không dùng AI, rồi mới đối chiếu với tài liệu gốc.
Chỉ tick `[x]` khi trả lời đúng và đủ ý ở lần không xem tài liệu. Câu trả lời dài viết vào concept note và link về đây.
Mỗi quý trả lời lại một nửa số câu đã tick, chọn ngẫu nhiên; trả lời sai thì bỏ tick.

## C/C++ (CC)
- [ ] `volatile` dùng khi nào, và vì sao không thay được atomic, mutex hay barrier?
- [ ] `const` và `static` (trong hàm, ở file scope, trong class) khác nhau thế nào?
- [ ] Vì sao struct có padding; làm sao serialize struct an toàn để gửi qua mạng hoặc UART?
- [ ] Vì sao firmware hạn chế `malloc` khi đang chạy; thay bằng gì?
- [ ] Ring buffer một producer một consumer: điều kiện đầy/rỗng là gì, khi nào cần memory barrier?
- [ ] Kiểm tra endianness của máy và chuyển byte order mà không vi phạm alignment/strict aliasing thế nào?
- [ ] Đếm bit 1, bật/tắt/đảo một bit; vì sao nên dùng kiểu unsigned khi shift?
- [ ] Con trỏ hàm + context pointer khác gì virtual function của C++?
- [ ] RAII là gì; unique_ptr và shared_ptr khác nhau ở ownership và chi phí nào?
- [ ] Move semantics giải quyết vấn đề gì; object nguồn sau khi move ở trạng thái nào?
- [ ] Gọi hàm virtual tốn gì; vtable và vptr nằm ở đâu?
- [ ] Nêu ba ví dụ undefined behavior và cách phát hiện từng loại; vì sao `-O2` có thể xóa một phép kiểm tra null?
- [ ] Declaration, definition, linkage khác nhau thế nào; lỗi "undefined reference" do đâu?
- [ ] Linker script đặt .data và .bss ở đâu; ai khởi tạo chúng trước main?

## Arm architecture (AR)
- [ ] TF-A, OP-TEE, U-Boot và Linux chạy ở exception level nào, ở Secure hay Non-secure world?
- [ ] PSCI dùng để làm gì; Linux gọi nó bằng lệnh nào?
- [ ] Normal memory và Device memory khác nhau thế nào; vì sao register phải map là Device?
- [ ] Cache line bao nhiêu byte trên Cortex-A35; false sharing xảy ra khi nào?
- [ ] DMB, DSB, ISB khác nhau thế nào; acquire/release sinh lệnh gì trên aarch64?
- [ ] GIC phân biệt SPI, PPI, SGI ra sao; interrupt affinity là gì?
- [ ] Theo AAPCS64, tham số và giá trị trả về nằm ở thanh ghi nào; thanh ghi nào callee phải giữ?
- [ ] Khi Cortex-M vào exception, phần cứng đẩy gì lên stack; tìm PC gây HardFault thế nào?

## Linux system programming (LS)
- [ ] User space và kernel space tách nhau thế nào; điều gì xảy ra khi gọi một system call?
- [ ] Process và thread khác nhau ở tài nguyên nào; fork, exec, wait làm gì?
- [ ] Có những cơ chế IPC nào; khi nào chọn pipe, shared memory, Unix socket, message queue?
- [ ] Mutex, semaphore, spinlock khác nhau thế nào; dùng cái nào trong user space?
- [ ] Deadlock xảy ra khi nào; priority inversion là gì?
- [ ] Virtual memory, page fault, OOM killer hoạt động thế nào?
- [ ] `mmap` dùng để làm gì; khác `read`/`write` ở đâu?
- [ ] Signal được xử lý ra sao; hàm nào an toàn để gọi trong signal handler?
- [ ] write() trả về thành công có nghĩa dữ liệu đã nằm trên thẻ chưa; ghi file bền vững qua mất điện thế nào?
- [ ] PREEMPT_RT thay đổi gì; đo worst-case latency thế nào cho đáng tin?
- [ ] Vì sao binary chạy trên board báo `GLIBC_2.xx not found`; sửa bằng cách nào?

## Hardware & bench (HW)
- [ ] Tính điện trở hạn dòng cho LED từ GPIO 3.3V; giới hạn dòng của một chân GPIO lấy ở đâu?
- [ ] Open-drain khác push-pull thế nào; vì sao I2C cần pull-up và chọn giá trị pull-up ra sao?
- [ ] UART 8N1 nghĩa là gì; sai baud thì quan sát thấy gì?
- [ ] SPI mode 0–3 khác nhau ở đâu; I2C ACK/NACK cho biết điều gì?
- [ ] Đọc schematic: lần theo một tín hiệu từ header 40 chân đến chân SoC thế nào?
- [ ] Read-modify-write register có rủi ro gì; vì sao phải truy cập đúng độ rộng?
- [ ] Với ODR 104 Hz, tín hiệu nào bị aliasing; bias và noise của cảm biến khác nhau thế nào?

## Boot, BSP & kernel (KN)
- [ ] Luồng boot ROM → TF-A → OP-TEE → U-Boot → kernel → systemd trên STM32MP257F-DK: mỗi stage làm gì?
- [ ] Device tree mô tả gì; kernel ghép driver với node qua `compatible` thế nào?
- [ ] `dtbs_check` kiểm tra gì; overlay khác sửa trực tiếp DTS ở đâu?
- [ ] Top half và bottom half; khi nào dùng tasklet, workqueue, threaded IRQ?
- [ ] Character driver đăng ký thế nào; `file_operations` gồm những gì; vì sao cần `copy_to_user`?
- [ ] Sleep trong atomic context là gì và vì sao gây lỗi?
- [ ] Spinlock và mutex trong kernel dùng ở context nào?
- [ ] GFP_KERNEL và GFP_ATOMIC khác nhau thế nào?
- [ ] DMA coherent và streaming khác nhau thế nào; cache coherency ảnh hưởng gì?
- [ ] Đọc một kernel oops: tìm hàm và dòng gây lỗi bằng cách nào?
- [ ] IIO: channel, buffer, trigger là gì?
- [ ] Probe và remove của driver được gọi khi nào; devm_* giúp gì?
- [ ] Gửi một patch lên mailing list của kernel gồm những bước nào?

## Yocto & build (YC)
- [ ] Layer, recipe, bbappend, image khác nhau thế nào?
- [ ] Bitbake chạy các task nào để ra một package; sstate cache để làm gì?
- [ ] Làm sao để build tái hiện được và kiểm tra license của image?
- [ ] SBOM và báo cáo CVE của image dùng để làm gì?

## Power & thermal (PW)
- [ ] Runtime PM khác system suspend thế nào?
- [ ] Ước tính thời gian chạy pin từ dòng tiêu thụ của từng khối thế nào?
- [ ] Thermal zone, trip point, cooling device là gì?

## Networking (NW)
- [ ] TCP và UDP khác nhau thế nào; mô tả bắt tay ba bước.
- [ ] Điều gì xảy ra khi thiết bị kết nối Wi-Fi: scan, authentication, association, 4-way handshake, DHCP, DNS.
- [ ] Trình tự socket API phía server và phía client.
- [ ] Bắt tay TLS diễn ra thế nào; mTLS khác gì TLS một chiều?
- [ ] MTU và fragmentation ảnh hưởng gì đến video?
- [ ] Vì sao video thời gian thực hay dùng UDP/RTP?
- [ ] MQTT QoS 0, 1, 2 khác nhau thế nào?
- [ ] Nagle và delayed ACK kết hợp gây latency thế nào; TCP_NODELAY làm gì?

## Camera & video (VD)
- [ ] Pipeline V4L2 từ sensor đến buffer user space gồm những bước nào?
- [ ] Frame I, P, B trong H.264 là gì; GOP ảnh hưởng gì đến độ trễ và khả năng phục hồi lỗi?
- [ ] Bitrate và chất lượng liên quan thế nào; CBR và VBR dùng khi nào?
- [ ] Một pipeline GStreamer cơ bản gồm những element nào?

## Reliability & update (RL)
- [ ] Mất điện khi đang ghi: làm sao để file đã đóng không bị hỏng?
- [ ] Watchdog phần cứng và watchdog phần mềm khác nhau thế nào?
- [ ] OTA A/B hoạt động ra sao; khi nào và bằng cơ chế gì thì rollback?
- [ ] Log và dữ liệu khi mất mạng: lưu tạm, giới hạn, gửi lại thế nào?

## Security (SC)
- [ ] Chain of trust của secure boot là gì; khóa gốc nằm ở đâu?
- [ ] Lưu khóa bí mật trên thiết bị ở đâu cho an toàn?
- [ ] Làm sao chứng minh một file video không bị chỉnh sửa sau khi ghi?
- [ ] STRIDE gồm những loại mối đe dọa nào?

## Testing & CI (TS)
- [ ] Test pyramid cho firmware: unit, integration, system, HIL khác nhau thế nào?
- [ ] Mock phần cứng thế nào để unit test logic driver trên host?
- [ ] Fuzzing tìm được loại lỗi nào mà unit test thường bỏ sót?

## MCU & RTOS (MC)
- [ ] Bare-metal superloop, RTOS và Linux: chọn cái nào cho bài toán real-time nào?
- [ ] Priority inversion xảy ra thế nào; priority inheritance giải quyết ra sao?
- [ ] RPMsg/OpenAMP truyền dữ liệu giữa Cortex-A35 và Cortex-M33 thế nào?

## Debugging (DB)
- [ ] Phân biệt observed fact, hypothesis và confirmed cause bằng một ví dụ của chính mình.
- [ ] Khoanh vùng lỗi bằng cách chia đôi (bisect) áp dụng cho commit, cấu hình và phần cứng thế nào?
- [ ] Khi lỗi chỉ xảy ra một lần, cần thu những evidence gì trước khi reboot?
- [ ] Công cụ nào dùng cho từng tầng: user space, kernel, bus phần cứng, MCU?

## AI-assisted engineering (AI)
- [ ] Ba loại lỗi AI hay mắc khi sinh code driver hoặc code register là gì, và bắt bằng cách nào?
- [ ] Spec tốt trước khi nhờ AI viết code gồm những phần nào?
- [ ] Khi nào không nên dùng AI trong quá trình học, và vì sao?
