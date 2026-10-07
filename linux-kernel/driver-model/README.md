# Driver model, I2C/SPI client & regmap
Status: Not started
## Learning goals
Bus/device/driver, platform driver, I2C/SPI client driver, of_match_table, probe/remove, devm_*, deferred probe, regmap

## Recall — 10 phút
Không dùng AI: probe được gọi khi nào? devm_* giúp gì khi probe lỗi giữa chừng? -EPROBE_DEFER dùng khi nào?

## Experiment — 20 phút/buổi
Viết I2C client driver cho LSM6DSOX: probe từ device tree, đọc WHO_AM_I qua regmap, cấu hình ODR, xuất dữ liệu qua sysfs.

## Cases cần kiểm tra
Probe thành công; WHO_AM_I sai → probe thất bại sạch; unbind/bind qua sysfs; thiếu regulator → defer.

## Required artifacts
Driver source; patch DTS; dmesg; checkpatch sạch.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Hỗ trợ cả I2C và SPI bằng regmap với phần core chung (giống st_lsm6dsx).
2. Khai báo regmap cache và volatile register; đo số giao dịch bus giảm được.
3. Viết driver cho một cảm biến I2C khác (ví dụ BME280) trong 1 tuần, không theo tutorial — tiêu chí Cổng 1, dùng làm bài làm lại L3 của KN08.

## Làm tay vs dùng AI
- Làm tay để hiểu: Kiến trúc driver và xử lý lỗi trong probe.
- Dùng AI rồi kiểm chứng: Khung driver; đối chiếu từng register với datasheet (hardware/register-programming).

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
