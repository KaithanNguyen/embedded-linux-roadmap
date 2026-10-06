# Linker
Status: Not started
## Learning goals
Translation units, symbols, sections, relocation, link order

## Recall — 10 phút
Không dùng AI: Declaration, definition, compile và link khác nhau ở đâu? Vì sao symbol tồn tại trong source nhưng link vẫn lỗi?

## Experiment — 20 phút
Build main.c + module.c riêng thành object rồi link; đọc nm/readelf/map; tái hiện undefined symbol và sửa.

## Cases cần kiểm tra
Build thành công; thiếu object; duplicate definition; lưu lỗi compiler khác lỗi linker.

## Required artifacts
src files + Makefile; symbol/section/map excerpts.
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
