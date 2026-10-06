# volatile
Status: Not started
## Learning goals
Observable access, MMIO, atomicity, synchronization

## Recall — 10 phút
Không dùng AI: Vì sao volatile không thay mutex/atomic? Những kết luận nào chỉ đúng với compiler và target đã thử?

## Experiment — 20 phút
Biên dịch hai hàm đọc object volatile/non-volatile ở -O0 và -O2; xem assembly. Chỉ đọc biến host hợp lệ, không giả lập truy cập địa chỉ MMIO tùy ý.

## Cases cần kiểm tra
So sánh generated code, ghi compiler/target; giải thích vì sao volatile không làm read-modify-write atomic.

## Required artifacts
src/access.c; assembly excerpts; limitations note.
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
