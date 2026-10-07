# struct / union
Status: Not started
## Learning goals
Layout, padding, alignment, endianness, serialization, bitfield, packed

## Recall — 10 phút
Không dùng AI: Vì sao không gửi trực tiếp struct lên wire? Union khác struct ở storage thế nào? Thứ tự bit của bitfield do ai quyết định?

## Experiment — 20 phút
Tạo struct packet metadata; đo sizeof và offsetof. Viết encode/decode byte buffer bằng shift/mask, không cast raw bytes sang struct.

## Cases cần kiểm tra
Round-trip, buffer quá ngắn, giá trị biên; không suy ra wire format từ sizeof(struct).

## Required artifacts
src/packet.c + tests; layout table và byte dump.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. So sánh `__attribute__((packed))` với encode/decode thủ công: code size và lệnh sinh ra trên aarch64 khi truy cập field lệch.
2. Bitfield và mask/shift: chứng minh thứ tự bit phụ thuộc compiler/ABI; khóa layout bằng `_Static_assert` cho sizeof/offsetof.
3. Áp dụng vào protocol v0 của project: codec + test vector trong docs/protocol.md.

## Làm tay vs dùng AI
- Làm tay để hiểu: Layout, padding, byte order của wire format.
- Dùng AI rồi kiểm chứng: Code encode/decode lặp lại cho nhiều message; kiểm bằng test vector.

## Build guidance
Dùng `-std=c11 -Wall -Wextra -Wpedantic -g`; ghi compiler/version và command chính xác.
Có thể thêm `-fsanitize=address,undefined -fno-omit-frame-pointer` khi toolchain hỗ trợ; ghi rõ nếu không có.
Không dùng kết quả sanitizer để kết luận đã bắt được mọi lỗi.
Deep dive chạy thêm trên board aarch64 (MP257F hoặc Jetson) để thấy khác biệt kiến trúc.

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
