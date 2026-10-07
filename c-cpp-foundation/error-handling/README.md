# Error handling
Status: Not started
## Learning goals
Return code, errno, goto cleanup, short read/write, EINTR/EAGAIN, chiến lược lỗi xuyên tầng

## Recall — 10 phút
Không dùng AI: Khi nào được đọc errno? Vì sao phải lưu errno ngay sau call lỗi? Linux kernel dùng `goto err_*` để giải quyết vấn đề gì?

## Experiment — 20 phút
Viết `copy_file(src, dst)` bằng open/read/write/close: xử lý short write và EINTR, cleanup theo thứ tự ngược bằng goto; contract trả về 0 hoặc -errno.

## Cases cần kiểm tra
Nguồn không tồn tại; dst không có quyền ghi (trong folder lab); file rỗng; file lớn hơn buffer; chèn lỗi bằng wrapper để đi qua mọi nhánh cleanup.

## Required artifacts
src/copy_file.c + tests; bảng error path → tài nguyên được giải phóng; strace excerpt nếu có.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. `read_full`/`write_full` xử lý EINTR và EAGAIN với fd non-blocking; test bằng pipe đầy.
2. Chèn lỗi bằng `LD_PRELOAD` (giả lập malloc/write thất bại) để đi qua mọi nhánh cleanup.
3. Chiến lược lỗi cho sensor-svc: mã lỗi, log, counter, khi nào thoát để systemd restart.

## Làm tay vs dùng AI
- Làm tay để hiểu: Đường xử lý lỗi và thứ tự giải phóng — phần AI hay bỏ sót.
- Dùng AI rồi kiểm chứng: Code log và format thông điệp lỗi.

## Build guidance
Dùng `-std=c11 -Wall -Wextra -Wpedantic -g`; ghi compiler/version và command chính xác.
Có thể thêm `-fsanitize=address,undefined -fno-omit-frame-pointer` khi toolchain hỗ trợ; ghi rõ nếu không có.
Không dùng kết quả sanitizer để kết luận đã bắt được mọi lỗi.
Deep dive chạy thêm trên board aarch64 (MP257F hoặc Jetson) để thấy khác biệt kiến trúc.
Cần Linux/WSL (POSIX API); kiểm tra fd leak bằng `ls -l /proc/<pid>/fd` hoặc `valgrind --track-fds=yes`.

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
