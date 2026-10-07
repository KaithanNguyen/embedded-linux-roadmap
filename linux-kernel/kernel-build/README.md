# Kernel build & config
Status: Not started
## Learning goals
Kconfig, defconfig, config fragment, menuconfig, build in-tree và out-of-tree, modules_install, vermagic, cross compile kernel

## Recall — 10 phút
Không dùng AI: defconfig khác .config thế nào? Built-in (=y) và module (=m) khác nhau ra sao lúc boot? Vì sao module phải khớp version kernel?

## Experiment — 20 phút/buổi
Build kernel + DTB + modules từ source của ecosystem; bật một option (driver IIO của LSM6DSOX dạng module); cài lên thẻ và boot.

## Cases cần kiểm tra
Kernel tự build boot được; module load được; module build cho kernel khác bị từ chối (vermagic).

## Required artifacts
Lệnh build; config fragment; `uname -a` + `modinfo`; thời gian build.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Giảm kích thước kernel bằng cách tắt driver không dùng; đo kích thước image và thời gian boot.
2. Lưu config dưới dạng fragment và áp dụng lại cho ra cùng kết quả.
3. Build out-of-tree module bằng kbuild và đóng gói để cài đặt.

## Làm tay vs dùng AI
- Làm tay để hiểu: Hiểu option nào ảnh hưởng tới điều gì.
- Dùng AI rồi kiểm chứng: Tìm tên option Kconfig; kiểm lại bằng phần help của menuconfig.

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
