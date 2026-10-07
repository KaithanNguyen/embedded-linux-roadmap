# Debug drills
Bài tập debug với lỗi được cài sẵn: triệu chứng → giả thuyết → đo → khoanh vùng → nguyên nhân → sửa → regression test.
Đây là kỹ năng giá trị nhất của kỹ sư nhúng và là phần AI không làm thay được: lỗi thật nằm ở chỗ giao nhau giữa phần cứng, timing và cấu hình, chỉ tìm ra được bằng cách đo trên board.
Level theo dõi ở [TRACKING.md](../TRACKING.md#debugging). Mục tiêu: 12 drill đến 06/2027, mỗi tầng ít nhất hai drill.

## Cách chạy một drill
1. **Cài lỗi mà không biết trước vị trí:** nhờ AI tạo một nhánh có bug từ code đang chạy tốt (chỉ cho xem mô tả triệu chứng), hoặc dùng script chọn ngẫu nhiên một dòng trong bảng bên dưới. Với lỗi phần cứng, nhờ người khác thay đổi đấu dây.
2. **Timebox 90 phút;** 30 phút đầu không dùng AI.
3. **Ghi theo [debug template](../templates/debug-report.md)** vào [debug journal](../debug-logs/README.md): observed fact, giả thuyết, thí nghiệm phân biệt, root cause.
4. **Viết regression test** hoặc bước kiểm tra tự động để lỗi không quay lại.
5. **Ghi thời gian tìm ra lỗi và công cụ quyết định;** sau vài drill sẽ thấy mình hay bỏ sót loại lỗi nào.

## Danh sách drill
Status: Not started / Done. Chỉ ghi Done khi có bản ghi trong debug journal.

| ID | Tầng | Lỗi được cài | Triệu chứng | Công cụ gợi ý | Sẵn sàng từ | Status |
| --- | --- | --- | --- | --- | --- | --- |
| DR01 | User space | Race trong producer–consumer (thiếu khóa) | Dữ liệu sai, hiếm gặp | ThreadSanitizer, stress test | 10/2026 | Not started |
| DR02 | User space | Memory leak trong service chạy lâu | RSS tăng dần | heaptrack hoặc Valgrind, smaps | 11/2026 | Not started |
| DR03 | User space | Use-after-free khi callback chạy sau khi context bị giải phóng | Crash ngẫu nhiên | ASan, GDB | 11/2026 | Not started |
| DR04 | Boot | bootargs sai `root=` | Kernel panic không mount được rootfs | Console U-Boot, boot log | 11/2026 | Not started |
| DR05 | Device tree | Sai `reg` hoặc `compatible` của cảm biến | Driver không probe | dmesg, /proc/device-tree, dtc | 11/2026 | Not started |
| DR06 | Pinmux | Chân I2C bị gán chức năng khác | Timeout I2C | debugfs pinctrl, DTS | 12/2026 | Not started |
| DR07 | Phần cứng | Thiếu pull-up hoặc lỏng dây SDA | NACK, bus treo | Logic analyzer, i2cdetect | 12/2026 | Not started |
| DR08 | Phần cứng | Sai SPI mode | WHO_AM_I sai | Logic analyzer | 12/2026 | Not started |
| DR09 | Ngắt | Sai kiểu trigger (cạnh/mức) của INT1 | Mất ngắt hoặc bão ngắt | /proc/interrupts, logic analyzer | 12/2026 | Not started |
| DR10 | Kernel | NULL dereference trong probe | Oops | decode_stacktrace.sh, addr2line | 01/2027 | Not started |
| DR11 | Kernel | Dùng mutex trong hard IRQ | `BUG: scheduling while atomic` | CONFIG_DEBUG_ATOMIC_SLEEP | 01/2027 | Not started |
| DR12 | Kernel | Đảo thứ tự hai khóa | Deadlock | lockdep | 01/2027 | Not started |
| DR13 | AI | Driver do AI sinh có offset hoặc bit field register sai | Giá trị đọc vô nghĩa | Datasheet, regmap debugfs | 01/2027 | Not started |
| DR14 | Lưu trữ | Thiếu fsync trước rename | File rỗng sau khi mất điện | Test cắt nguồn | 01/2027 | Not started |
| DR15 | Hiệu năng | Regression nằm đâu đó trong 20 commit | Latency tăng | git bisect + benchmark | 02/2027 | Not started |
| DR16 | DMA/cache | Thiếu `dma_sync_*` | Thỉnh thoảng đọc dữ liệu cũ | Review DMA API, KASAN | 02/2027 | Not started |
| DR17 | Mạng | Nagle kết hợp delayed ACK | Latency nhảy khoảng 40 ms | Wireshark, TCP_NODELAY | 04/2027 | Not started |
| DR18 | Thời gian | Đồng hồ hai board lệch | Thứ tự event sai trong metadata | chronyc, sync GPIO | 05/2027 | Not started |
| DR19 | Video | Pipeline GStreamer sai caps | Không negotiate được | GST_DEBUG | 05/2027 | Not started |
| DR20 | MCU | Stack overflow trên M33 | HardFault | Fault handler, MPU | 06/2027 | Not started |
