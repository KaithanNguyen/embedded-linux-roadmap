# Observability & performance
Status: Not started
## Learning goals
strace/ltrace, perf (stat/record/report), flame graph, ftrace (function_graph, trace event), eBPF/bpftrace, phương pháp USE

## Recall — 10 phút
Không dùng AI: Khi CPU 100% nên bắt đầu từ công cụ nào? perf record lấy mẫu thế nào? Vì sao strace làm chương trình chậm đi nhiều?

## Experiment — 20 phút/buổi
Lấy một chương trình có bottleneck cố ý (hàm tính toán nặng + nhiều syscall nhỏ); dùng perf stat, perf record + flame graph và `strace -c` để tìm nguyên nhân; sửa và đo lại.

## Cases cần kiểm tra
Trên host và trên board; build có và không frame pointer; số liệu trước và sau khi sửa.

## Required artifacts
Flame graph trước/sau; bảng perf stat; giải thích.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. ftrace function_graph đo thời gian một syscall đi qua kernel.
2. bpftrace (nếu kernel của board hỗ trợ BPF): histogram latency đọc IIO buffer.
3. Đặt ngân sách CPU cho sensor-svc và kiểm bằng perf trong 24 giờ.

## Làm tay vs dùng AI
- Làm tay để hiểu: Diễn giải profile và chọn chỗ đáng tối ưu.
- Dùng AI rồi kiểm chứng: Script thu và vẽ flame graph.

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
