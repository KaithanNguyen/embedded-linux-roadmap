# GDB & debugging tools
Status: Not started
## Learning goals
Breakpoint, watchpoint, backtrace, core dump, Valgrind, gdbserver cross-debug, GDB Python

## Recall — 10 phút
Không dùng AI: Vì sao cần `-g`, và vì sao `-O2` làm biến bị "optimized out"? Core dump chứa gì và cần thêm gì để đọc được?

## Experiment — 20 phút
Viết chương trình có lỗi null dereference và một biến bị ghi đè sai; dùng GDB: `bt`, `frame`, `print`, `watch`. Bật core dump và phân tích offline bằng `gdb <binary> <core>`.

## Cases cần kiểm tra
Build `-O0` vs `-O2`; core dump không sinh ra (ghi lý do: ulimit, core_pattern, systemd-coredump, WSL); giai đoạn board: gdbserver trên target + gdb-multiarch trên host.

## Required artifacts
src/crash.c; transcript GDB session; cấu hình core dump đã dùng.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Remote debug sensor-svc trên MP257F bằng gdbserver + gdb-multiarch, có sysroot đúng để thấy symbol thư viện.
2. Watchpoint phần cứng tìm biến bị ghi đè; tìm hiểu giới hạn số watchpoint của lõi Arm.
3. GDB Python: lệnh tự viết in ring buffer/outbox của project dạng dễ đọc.

## Làm tay vs dùng AI
- Làm tay để hiểu: Đặt giả thuyết và chọn điểm dừng — kỹ năng cốt lõi khi debug.
- Dùng AI rồi kiểm chứng: Viết script GDB Python; đọc lại từng dòng trước khi dùng.

## Build guidance
Dùng `-std=c11 -Wall -Wextra -Wpedantic -g`; ghi compiler/version và command chính xác.
Có thể thêm `-fsanitize=address,undefined -fno-omit-frame-pointer` khi toolchain hỗ trợ; ghi rõ nếu không có.
Không dùng kết quả sanitizer để kết luận đã bắt được mọi lỗi.
Deep dive chạy thêm trên board aarch64 (MP257F hoặc Jetson) để thấy khác biệt kiến trúc.
Không commit file core (có thể chứa dữ liệu bộ nhớ); chỉ lưu đoạn backtrace đã rà soát.

## Socratic review — 10 phút
- Dự đoán ban đầu sai ở đâu? Dẫn chứng?
- Kết quả có phụ thuộc compiler, kiến trúc hoặc optimization không?
- Áp dụng vào driver/application Linux ở tình huống nào?
- Tôi có thể viết lại và giải thích mà không nhìn đáp án không?

## Conclusions — 5 phút
3 kết luận + 1 câu hỏi còn mở; cập nhật [learning log](../../LEARNING_LOG.md).

## Definition of Done
- [ ] Có source và lệnh build/run.
- [ ] Có expected vs actual cho case liên quan.
- [ ] Có evidence và phân tích giới hạn.
- [ ] Tự giải thích topic bằng tiếng Việt và 5 câu tiếng Anh.
- [ ] L3: làm lại sau ≥ 7 ngày không ghi chú, không AI, và hoàn thành ít nhất một bài Deep dive.
