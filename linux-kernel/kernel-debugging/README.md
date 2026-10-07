# Kernel debugging
Status: Not started
## Learning goals
printk và dynamic debug, ftrace (function_graph, trace event), kprobe, giải mã oops (decode_stacktrace.sh, addr2line), KASAN, lockdep, pstore/ramoops

## Recall — 10 phút
Không dùng AI: Oops cho biết những gì? Vì sao cần vmlinux có debug info? Dynamic debug bật thế nào lúc đang chạy?

## Experiment — 20 phút/buổi
Cố ý gây NULL dereference trong driver; giải mã oops về dòng source bằng decode_stacktrace.sh; dùng ftrace function_graph xem đường gọi tới probe.

## Cases cần kiểm tra
Oops trong probe; oops trong IRQ thread; bật/tắt dynamic debug cho một module.

## Required artifacts
Oops gốc + bản giải mã; trace ftrace; ghi chú quy trình.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. pstore/ramoops: giữ log panic qua reboot.
2. Trace event tự định nghĩa trong driver (TRACE_EVENT).
3. kgdb hoặc debug kernel qua JTAG nếu thiết lập được.

## Làm tay vs dùng AI
- Làm tay để hiểu: Đọc oops và lần ra nguyên nhân.
- Dùng AI rồi kiểm chứng: Giải thích ký hiệu lạ trong log; luôn kiểm trên source thật.

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
