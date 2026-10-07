# Interrupts & deferred work
Status: Not started
## Learning goals
request_threaded_irq, top half/bottom half, workqueue, hrtimer, softirq/tasklet (vì sao hạn chế), IRQ trong device tree, đo latency

## Recall — 10 phút
Không dùng AI: Việc gì không được làm trong hard IRQ handler? Threaded IRQ khác workqueue ở đâu? IRQF_ONESHOT để làm gì?

## Experiment — 20 phút/buổi
Driver nhận ngắt INT1 (data-ready) bằng threaded IRQ, đọc mẫu qua I2C trong thread, đẩy vào kfifo; đếm số ngắt và số mẫu mất.

## Cases cần kiểm tra
ODR 104/416/833 Hz; tải CPU cao; trigger cạnh và mức; handler chậm làm mất ngắt.

## Required artifacts
Driver source; số đo latency (logic analyzer: INT1 → GPIO bật trong handler); bảng mẫu mất.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. So sánh latency hard IRQ → threaded handler giữa kernel thường và PREEMPT_RT.
2. Polling bằng hrtimer thay cho ngắt; so sánh CPU và jitter.
3. Đọc cách st_lsm6dsx xử lý ngắt và FIFO.

## Làm tay vs dùng AI
- Làm tay để hiểu: Chọn đúng context thực thi — sai là treo hệ thống.
- Dùng AI rồi kiểm chứng: Khung driver; kiểm bằng DEBUG_ATOMIC_SLEEP.

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
