# Storage & filesystems
Status: Not started
## Learning goals
Block device, partition, ext4 journaling, page cache và writeback, fsync/fdatasync, rename nguyên tử, flash (SD/eMMC) wear, TRIM, tổng quan f2fs/UBIFS

## Recall — 10 phút
Không dùng AI: write() trả về thành công có nghĩa dữ liệu đã nằm trên thẻ chưa? Vì sao cần fsync cả thư mục sau rename? Thẻ SD hỏng theo kiểu nào khi ghi liên tục?

## Experiment — 20 phút/buổi
Ghi file theo 3 cách (write không fsync; fsync file; ghi tạm + fsync + rename + fsync thư mục); cắt nguồn board trong lúc ghi 20 lần mỗi cách; đếm file hỏng hoặc thiếu.

## Cases cần kiểm tra
Mỗi cách 20 lần; file nhỏ và file lớn; đo thời gian fsync trên microSD.

## Required artifacts
src/durable_write.c + script; bảng kết quả; filesystem và mount options đã dùng.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. So sánh ext4 (data=ordered và data=journal) với f2fs về độ bền và tốc độ trên microSD.
2. Ước lượng tuổi thọ thẻ từ lưu lượng ghi thực tế của recorder; đọc thông số sức khỏe nếu thẻ hỗ trợ.
3. Áp dụng vào recorder của project: ghi clip `.partial` → fsync → rename (RL02).

## Làm tay vs dùng AI
- Làm tay để hiểu: Ngữ nghĩa độ bền dữ liệu — sai là mất dữ liệu thật.
- Dùng AI rồi kiểm chứng: Script cắt nguồn và kiểm tra lặp lại.

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
