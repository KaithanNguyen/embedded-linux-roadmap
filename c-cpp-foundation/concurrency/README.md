# Concurrency
Status: Not started
## Learning goals
pthread, data race, mutex, condition variable, C11 atomics, memory ordering, priority inversion

## Recall — 10 phút
Không dùng AI: Data race khác race condition thế nào? Vì sao `counter++` từ 2 thread vẫn sai dù khai báo volatile? Vì sao chờ condition variable phải nằm trong vòng while?

## Experiment — 20 phút
Hai thread cùng tăng counter: bản không khóa, bản mutex, bản `atomic_fetch_add`; ghi kết quả và thời gian. Sau đó viết bounded queue producer/consumer bằng mutex + condvar.

## Cases cần kiểm tra
Chạy lặp nhiều lần với số vòng lớn; queue đầy/rỗng; shutdown khi consumer đang chờ; chạy với ThreadSanitizer.

## Required artifacts
src/counter.c, src/queue.c + tests; TSan report; bảng thời gian kèm số core và flags.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. SPSC lock-free ring bằng C11 acquire/release; stress trên board aarch64 (weak memory model) và TSan trên host.
2. Priority inversion với SCHED_FIFO; sửa bằng mutex `PTHREAD_PRIO_INHERIT`; đo bằng timestamp.
3. Tìm deadlock thứ tự khóa bằng TSan hoặc helgrind; vẽ lock order graph.

## Làm tay vs dùng AI
- Làm tay để hiểu: Memory ordering, thứ tự khóa, invariant — không giao cho AI.
- Dùng AI rồi kiểm chứng: Harness stress test, script chạy lặp.

## Build guidance
Dùng `-std=c11 -Wall -Wextra -Wpedantic -g`; ghi compiler/version và command chính xác.
Có thể thêm `-fsanitize=address,undefined -fno-omit-frame-pointer` khi toolchain hỗ trợ; ghi rõ nếu không có.
Không dùng kết quả sanitizer để kết luận đã bắt được mọi lỗi.
Deep dive chạy thêm trên board aarch64 (MP257F hoặc Jetson) để thấy khác biệt kiến trúc.
Link với `-pthread`. ThreadSanitizer (`-fsanitize=thread`) không dùng chung với AddressSanitizer: build riêng.
Timing phụ thuộc máy và tải; không khái quát từ một lần chạy.

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
