# Power management
Status: Not started
## Learning goals
Regulator và clock framework, runtime PM, system suspend/resume, wakeup source, cpufreq/cpuidle, đo điện năng

## Recall — 10 phút
Không dùng AI: Runtime PM khác system suspend thế nào? Driver cần làm gì khi suspend? Wakeup source là gì?

## Experiment — 20 phút/buổi
Thêm runtime PM cho driver LSM6DSOX (tắt cảm biến khi không còn ai đọc); đo dòng cảm biến và board trước/sau; thử suspend/resume board với wakeup từ INT1 nếu SoC hỗ trợ.

## Cases cần kiểm tra
Không có client; có client đang đọc; suspend/resume khi buffer đang bật.

## Required artifacts
Patch runtime PM; số đo dòng; log suspend/resume.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Đổi cpufreq governor, đo điện năng và latency.
2. Thermal zone và trip point trên Jetson (liên kết PW03).
3. Ngân sách điện năng cho thiết bị chạy pin (design study DS01).

## Làm tay vs dùng AI
- Làm tay để hiểu: Quyết định khi nào tắt/bật phần cứng và đo kết quả.
- Dùng AI rồi kiểm chứng: Khung callback runtime PM; kiểm bằng số đo dòng.

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
