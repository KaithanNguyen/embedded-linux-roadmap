# Memory ordering & barriers
Status: Not started
## Learning goals
Weak memory model của Arm, acquire/release (LDAR/STLR), DMB/DSB/ISB, ánh xạ C11 atomics sang lệnh, barrier trong kernel (smp_mb, dma_wmb)

## Recall — 10 phút
Không dùng AI: Vì sao code đúng trên x86 có thể sai trên Arm? DMB khác DSB thế nào? `memory_order_acquire` sinh lệnh gì trên aarch64?

## Experiment — 20 phút/buổi
Viết litmus test message passing (flag + data) không barrier, chạy hàng triệu lần trên MP257F và Jetson; đếm số lần quan sát được reorder; thêm release/acquire rồi chạy lại.

## Cases cần kiểm tra
Không barrier; chỉ compiler barrier; release/acquire; hai thread ghim ở hai core khác nhau; so sánh Cortex-A35 (in-order) với Cortex-A57 (out-of-order).

## Required artifacts
src/litmus_mp.c; bảng số lần reorder; assembly của từng biến thể.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Kiểm tra mô hình bằng herd7/litmus7 (bộ diy) và so với kết quả đo.
2. Đọc cách một driver mạng dùng `dma_wmb()` trước khi giao descriptor cho thiết bị.
3. Chứng minh vì sao từng memory_order trong SPSC ring (c-cpp-foundation/concurrency) là đủ.

## Làm tay vs dùng AI
- Làm tay để hiểu: Lập luận về thứ tự bộ nhớ — AI thường sai tinh vi ở đây.
- Dùng AI rồi kiểm chứng: Harness chạy litmus lặp và thu số liệu.

## Build guidance
Biên dịch cho aarch64 (Cortex-A35, Cortex-A57) và Armv8-M (`-mcpu=cortex-m33 -mthumb`); ghi compiler, flags và lõi chạy thử.
Trích tài liệu kèm phiên bản: Arm Architecture Reference Manual, TRM của lõi, AAPCS64.
Đo trên một core cố định (`taskset`), lặp lại ít nhất 3 lần; ghi tần số CPU và cpufreq governor.

## Socratic review — 10 phút
- Dự đoán ban đầu sai ở đâu? Dẫn chứng?
- Kết quả có phụ thuộc lõi CPU (A35, A57, M33), cấu hình cache/MMU hoặc compiler không?
- Áp dụng vào driver/application Linux ở tình huống nào?
- Tôi có thể viết lại và giải thích mà không nhìn đáp án không?

## Conclusions — 5 phút
3 kết luận + 1 câu hỏi còn mở; cập nhật [learning log](../../LEARNING_LOG.md).

## Definition of Done
- [ ] Có source, lệnh build/run và lõi CPU đã chạy.
- [ ] Có expected vs actual cho case liên quan.
- [ ] Có evidence (số đo, disassembly, log) và trích tài liệu kèm phiên bản.
- [ ] Tự giải thích topic bằng tiếng Việt và 5 câu tiếng Anh.
- [ ] L3: làm lại sau ≥ 7 ngày không ghi chú, không AI, và hoàn thành ít nhất một bài Deep dive.
