# volatile
Status: Not started
## Learning goals
Observable access, MMIO, compiler reordering, atomicity, READ_ONCE/WRITE_ONCE, khác biệt với memory barrier

## Recall — 10 phút
Không dùng AI: Vì sao volatile không thay mutex/atomic? Volatile có ngăn CPU reorder không? Những kết luận nào chỉ đúng với compiler và target đã thử?

## Experiment — 20 phút
Biên dịch hai hàm đọc object volatile/non-volatile ở -O0 và -O2; xem assembly. Chỉ đọc biến host hợp lệ, không giả lập truy cập địa chỉ MMIO tùy ý.

## Cases cần kiểm tra
So sánh generated code, ghi compiler/target; giải thích vì sao volatile không làm read-modify-write atomic.

## Required artifacts
src/access.c; assembly excerpts; limitations note.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Trong kernel module, đọc/ghi register bằng `readl`/`writel` và so với con trỏ volatile; giải thích barrier nằm trong accessor.
2. Đọc assembly aarch64 ở `-O2` của vòng chờ cờ volatile và non-volatile; chỉ ra lệnh load bị gom hay được giữ.
3. Chứng minh volatile không đủ: hai thread cùng tăng một biến; chuyển sang C11 atomic và đo lại.

## Làm tay vs dùng AI
- Làm tay để hiểu: Phân biệt khi nào cần volatile, atomic hay barrier — AI hay đặt volatile sai chỗ.
- Dùng AI rồi kiểm chứng: Code mẫu đọc/ghi register; luôn đối chiếu độ rộng truy cập và kiểu bộ nhớ với datasheet.

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
