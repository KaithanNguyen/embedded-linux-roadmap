# IIO subsystem
Status: Not started
## Learning goals
iio_dev, channel, scale/offset, buffer, trigger (data-ready), kfifo, sysfs ABI của IIO, libiio/iio_readdev

## Recall — 10 phút
Không dùng AI: IIO channel mô tả gì? Buffer và trigger phối hợp ra sao? Vì sao scale tách khỏi giá trị raw?

## Experiment — 20 phút/buổi
Chuyển driver ở driver-model sang IIO: channel accel/gyro, buffer + trigger data-ready từ INT1; đọc bằng iio_readdev hoặc chương trình C.

## Cases cần kiểm tra
Đọc raw qua sysfs; buffer ở 104 và 416 Hz; tháo cảm biến khi đang chạy; so sánh dữ liệu với st_lsm6dsx.

## Required artifacts
Driver IIO; output đọc buffer; bảng so sánh với driver upstream.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Dùng FIFO phần cứng của LSM6DSOX với watermark để giảm số ngắt.
2. Gắn timestamp chính xác cho mẫu trong buffer IIO.
3. README so sánh thiết kế của mình với st_lsm6dsx upstream.

## Làm tay vs dùng AI
- Làm tay để hiểu: Ánh xạ cảm biến sang mô hình IIO và ABI.
- Dùng AI rồi kiểm chứng: Khai báo channel lặp lại; kiểm bằng iio_info.

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
