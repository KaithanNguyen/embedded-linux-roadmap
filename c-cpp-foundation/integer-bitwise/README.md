# Integer & bitwise
Status: Not started
## Learning goals
Fixed-width types, integer promotion, usual arithmetic conversions, signed/unsigned, shift, mask, bitfield

## Recall — 10 phút
Không dùng AI: Vì sao `uint8_t a = 0xFF; ~a` không bằng 0? `1 << 31` với `int` có vấn đề gì? `-1 < 0u` cho kết quả gì và vì sao?

## Experiment — 20 phút
Viết API set/clear/toggle/test bit và get/set field (mask + shift) trên `uint32_t` mô phỏng giá trị register (biến thường). Trước khi chạy, ghi dự đoán cho 5 biểu thức promotion/conversion.

## Cases cần kiểm tra
Bit 0, bit 31, field sát biên trên, field width = 32; shift ≥ độ rộng kiểu bị từ chối theo contract; so sánh signed/unsigned với `-Wsign-compare`.

## Required artifacts
src/bits.c + tests; bảng dự đoán vs actual cho biểu thức promotion.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Build guidance
Dùng `-std=c11 -Wall -Wextra -Wpedantic -g`; ghi compiler/version và command chính xác.
Có thể thêm `-fsanitize=address,undefined -fno-omit-frame-pointer` khi toolchain hỗ trợ; ghi rõ nếu không có.
Không dùng kết quả sanitizer để kết luận đã bắt được mọi lỗi.
Thêm `-Wconversion -Wsign-conversion`; ghi lại cảnh báo nhận được và cách sửa.

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
