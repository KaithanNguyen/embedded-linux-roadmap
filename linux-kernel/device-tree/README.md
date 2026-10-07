# Device tree
Status: Not started
## Learning goals
Cấu trúc DTS/DTSI, binding (YAML schema), compatible, reg, interrupts, clocks, pinctrl, regulator, status, overlay, dtc, /proc/device-tree

## Recall — 10 phút
Không dùng AI: Kernel ghép driver với node bằng gì? `#address-cells` và `reg` liên quan thế nào? Overlay khác sửa trực tiếp DTS ở đâu?

## Experiment — 20 phút/buổi
Thêm node LSM6DSOX (I2C, INT1) và gpio-leds/gpio-keys vào DTS của board; build DTB, boot, kiểm tra node trong /proc/device-tree và driver probe.

## Cases cần kiểm tra
Node đúng → driver probe; sai compatible; sai địa chỉ reg; pinctrl xung đột; status = disabled.

## Required artifacts
Patch DTS; trích `dtc -I fs /proc/device-tree`; dmesg lúc probe.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Kiểm DTS bằng `make dtbs_check` với schema YAML; sửa hết cảnh báo.
2. Viết device tree overlay cho cảm biến và áp dụng lúc boot.
3. Đọc binding của `st,lsm6dsx` và giải thích từng property tùy chọn.

## Làm tay vs dùng AI
- Làm tay để hiểu: Đọc binding và sửa DTS theo tài liệu — AI hay bịa property.
- Dùng AI rồi kiểm chứng: Phác node ban đầu; luôn chạy dtbs_check và đối chiếu binding.

## Build guidance
Build bằng kernel source và config đúng của board: `make -C <kernel-dir> M=$PWD modules`; ghi kernel version, config, toolchain.
Code kernel theo kernel coding style; chạy `scripts/checkpatch.pl --no-tree -f` trước khi commit.
Thí nghiệm gây oops/panic chỉ chạy trên board; giữ sẵn thẻ microSD dự phòng có image đã kiểm tra.
Bật debug config khi cần (KASAN, lockdep, DEBUG_ATOMIC_SLEEP) và ghi lại trong REPORT.

## Socratic review — 10 phút
- Dự đoán ban đầu sai ở đâu? Dẫn chứng?
- Kết quả có phụ thuộc kernel version, config hoặc device tree không?
- Áp dụng vào driver/application Linux ở tình huống nào?
- Tôi có thể viết lại và giải thích mà không nhìn đáp án không?

## Conclusions — 5 phút
3 kết luận + 1 câu hỏi còn mở; cập nhật [learning log](../../LEARNING_LOG.md).

## Definition of Done
- [ ] Có source, lệnh build và cách nạp lên board.
- [ ] Có expected vs actual (dmesg, sysfs, số đo) cho case liên quan.
- [ ] checkpatch sạch với code kernel; không có cảnh báo khi bật debug config.
- [ ] Tự giải thích topic bằng tiếng Việt và 5 câu tiếng Anh.
- [ ] L3: làm lại sau ≥ 7 ngày không ghi chú, không AI, và hoàn thành ít nhất một bài Deep dive.
