# Virtual memory & mmap
Status: Not started
## Learning goals
Address space của process, /proc/<pid>/maps và smaps, page fault (minor/major), mmap file và anonymous, page cache, mlock, overcommit, OOM killer

## Recall — 10 phút
Không dùng AI: Minor và major page fault khác nhau thế nào? RSS và PSS khác nhau ra sao? OOM killer chọn process theo tiêu chí nào?

## Experiment — 20 phút/buổi
Đọc file 100 MB bằng read() và bằng mmap(); đếm page fault (`/usr/bin/time -v` hoặc perf) và đo thời gian; xóa page cache giữa các lần chạy (trên board hoặc máy ảo).

## Cases cần kiểm tra
Cache nóng và nguội; truy cập tuần tự và ngẫu nhiên; file lớn hơn RAM còn trống (trên board).

## Required artifacts
src/mmap_vs_read.c; bảng số đo; trích smaps.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. mlock vùng nhớ cho tác vụ real-time và đo ảnh hưởng tới latency.
2. Gây OOM có kiểm soát trong cgroup giới hạn bộ nhớ; đọc log của OOM killer.
3. Shared mapping (MAP_SHARED) giữa hai process làm kênh dữ liệu; so với các cơ chế ở topic IPC.

## Làm tay vs dùng AI
- Làm tay để hiểu: Giải thích số liệu bộ nhớ của hệ thống thật.
- Dùng AI rồi kiểm chứng: Script thu smaps theo thời gian.

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
