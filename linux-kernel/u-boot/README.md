# U-Boot
Status: Not started
## Learning goals
Biến môi trường, bootcmd/bootargs, boot script, extlinux, FIT image, load kernel qua TFTP/NFS, lệnh md/mw/i2c để debug phần cứng

## Recall — 10 phút
Không dùng AI: bootcmd và bootargs khác nhau thế nào? FIT image có lợi gì so với Image + DTB rời? Vì sao boot qua TFTP/NFS giúp phát triển driver nhanh hơn?

## Experiment — 20 phút/buổi
Dừng ở prompt U-Boot, load kernel + DTB bằng lệnh tay và boot; đổi bootargs (loglevel, console, root) và quan sát.

## Cases cần kiểm tra
Boot tay thành công; bootargs sai root → kernel panic; khôi phục env mặc định.

## Required artifacts
Chuỗi lệnh U-Boot; log; bảng biến env quan trọng.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Boot kernel qua TFTP và rootfs qua NFS từ host để rút ngắn vòng lặp phát triển driver.
2. Tạo FIT image chứa kernel + DTB (ký image ở 07/2027).
3. Dùng lệnh `i2c` của U-Boot đọc WHO_AM_I của LSM6DSOX trước khi kernel chạy.

## Làm tay vs dùng AI
- Làm tay để hiểu: Sửa lỗi boot từ console U-Boot.
- Dùng AI rồi kiểm chứng: Viết boot script; kiểm từng lệnh trên board.

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
