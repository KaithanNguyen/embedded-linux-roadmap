# IPC
Status: Not started
## Learning goals
pipe/FIFO, Unix domain socket (stream/datagram, truyền fd), shared memory + đồng bộ, message queue; chọn cơ chế theo latency và throughput

## Recall — 10 phút
Không dùng AI: Khi nào pipe block? Shared memory cần gì để an toàn? Unix socket có lợi gì so với TCP localhost?

## Experiment — 20 phút/buổi
Hai process trao đổi 1 triệu message 64 byte qua pipe, Unix socket và shared memory + semaphore; đo throughput và latency trên host và board.

## Cases cần kiểm tra
Message 64 B và 64 KB; reader chậm; writer chết giữa chừng (SIGPIPE, EOF).

## Required artifacts
src/ipc_bench/; bảng số đo host và board; giải thích chênh lệch.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Truyền file descriptor qua Unix socket (SCM_RIGHTS).
2. Ring buffer trong shared memory, báo hiệu bằng eventfd hoặc futex; so với semaphore.
3. Nếu tách pipeline GStreamer khỏi edge-svc thành process con để cô lập lỗi, chọn IPC giữa hai bên bằng số đo; viết ADR.

## Làm tay vs dùng AI
- Làm tay để hiểu: Chọn IPC theo số đo và ngữ nghĩa lỗi.
- Dùng AI rồi kiểm chứng: Boilerplate socket và shared memory; kiểm bằng test lỗi.

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
