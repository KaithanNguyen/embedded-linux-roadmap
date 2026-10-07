# Event loop: epoll & timers
Status: Not started
## Learning goals
Blocking và non-blocking I/O, poll/epoll (level vs edge triggered), timerfd, eventfd, signalfd, backpressure

## Recall — 10 phút
Không dùng AI: Edge-triggered khác level-triggered thế nào và lỗi kinh điển là gì? Vì sao fd non-blocking cần vòng đọc tới EAGAIN?

## Experiment — 20 phút/buổi
Service một luồng dùng epoll: nhận TCP từ nhiều client, timer 100 ms gửi heartbeat, signalfd để thoát sạch.

## Cases cần kiểm tra
10 client cùng lúc; client gửi nửa frame rồi dừng; client ngắt kết nối; SIGTERM khi đang ghi.

## Required artifacts
src/epoll_server.c + client test; strace cho thấy epoll_wait; log tắt sạch.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Đọc IIO buffer bằng poll trong cùng event loop (nền cho sensor-svc).
2. Backpressure: client đọc chậm làm đầy send buffer — xử lý EAGAIN và giới hạn queue.
3. So sánh epoll một luồng với một thread mỗi kết nối về CPU và latency trên MP257F.

## Làm tay vs dùng AI
- Làm tay để hiểu: Thiết kế vòng lặp sự kiện và xử lý partial I/O.
- Dùng AI rồi kiểm chứng: Boilerplate socket; kiểm bằng client cố ý gây lỗi.

## Build guidance
Dùng `-std=c11 -Wall -Wextra -Wpedantic -g`; chạy trên host Linux/WSL và trên board aarch64; ghi kernel, libc, compiler.
Có thể thêm `-fsanitize=address,undefined -fno-omit-frame-pointer` khi toolchain hỗ trợ; ghi rõ nếu không có.
Thí nghiệm có thể làm treo hệ thống (OOM, cắt nguồn, SCHED_FIFO) chỉ chạy trên board hoặc máy ảo, có giới hạn bằng ulimit/cgroup.

## Socratic review — 10 phút
- Dự đoán ban đầu sai ở đâu? Dẫn chứng?
- Kết quả có phụ thuộc kernel, libc, tải hệ thống hoặc host so với board không?
- Áp dụng vào driver/application Linux ở tình huống nào?
- Tôi có thể viết lại và giải thích mà không nhìn đáp án không?

## Conclusions — 5 phút
3 kết luận + 1 câu hỏi còn mở; cập nhật [learning log](../../LEARNING_LOG.md).

## Definition of Done
- [ ] Có source và lệnh build/run.
- [ ] Có expected vs actual cho case liên quan.
- [ ] Có evidence (log, số đo, trace) và phân tích giới hạn.
- [ ] Tự giải thích topic bằng tiếng Việt và 5 câu tiếng Anh.
- [ ] L3: làm lại sau ≥ 7 ngày không ghi chú, không AI, và hoàn thành ít nhất một bài Deep dive.
