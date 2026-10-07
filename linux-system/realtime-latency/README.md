# Real-time & latency
Status: Not started
## Learning goals
Scheduling policy (SCHED_OTHER/FIFO/RR/DEADLINE), priority, preemption model, PREEMPT_RT, cyclictest, IRQ thread priority, CPU isolation, nguồn gây latency

## Recall — 10 phút
Không dùng AI: PREEMPT_RT thay đổi gì trong kernel? Vì sao SCHED_FIFO có thể làm treo hệ thống? Worst-case latency đo thế nào để đáng tin?

## Experiment — 20 phút/buổi
Chạy cyclictest trên MP257F 30 phút, không tải và có tải (stress-ng CPU + I/O); vẽ histogram, ghi latency lớn nhất.

## Cases cần kiểm tra
SCHED_OTHER và SCHED_FIFO; có và không mlockall; ghim CPU (taskset hoặc isolcpus).

## Required artifacts
Lệnh cyclictest; histogram; bảng max/avg; preemption model của kernel.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Build kernel PREEMPT_RT cho MP257F (nếu ecosystem hỗ trợ) và so sánh histogram.
2. Đặt priority cho IRQ thread của INT1 và ứng dụng đọc cảm biến; đo latency đầu-cuối bằng logic analyzer.
3. Tìm nguồn latency lớn nhất bằng ftrace (wakeup_rt tracer hoặc trace event).

## Làm tay vs dùng AI
- Làm tay để hiểu: Đo và giải thích worst-case latency trên phần cứng thật.
- Dùng AI rồi kiểm chứng: Script chạy cyclictest và vẽ histogram.

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
