# Memory
Status: Not started
## Learning goals
Automatic/static/allocated storage, ownership, allocation failure

## Recall — 10 phút
Không dùng AI: Ai sở hữu buffer? Stack/heap khác lifetime và storage duration thế nào?

## Experiment — 20 phút
Viết buffer cấp phát động, kiểm tra size hợp lệ và lỗi cấp phát; một owner chịu trách nhiệm giải phóng.

## Cases cần kiểm tra
Size=0, size bình thường, input vượt giới hạn; mô phỏng allocation failure bằng allocator wrapper.

## Required artifacts
src/buffer.c + tests; ownership diagram + sanitizer output.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Build guidance
Dùng `-std=c11 -Wall -Wextra -Wpedantic -g`; ghi compiler/version và command chính xác.
Có thể thêm `-fsanitize=address,undefined -fno-omit-frame-pointer` khi toolchain hỗ trợ; ghi rõ nếu không có.
Không dùng kết quả sanitizer để kết luận đã bắt được mọi lỗi.

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
