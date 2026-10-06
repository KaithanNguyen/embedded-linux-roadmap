# Preprocessor & build
Status: Not started
## Learning goals
Macro pitfalls, include guard, conditional compilation, Make dependency, CMake, cross-compile toolchain

## Recall — 10 phút
Không dùng AI: Macro khác inline function ở đâu? Khi nào cần `#if` thay vì `if`? Make dựa vào gì để quyết định rebuild?

## Experiment — 20 phút
Viết macro SQUARE/MAX bản naive và bản an toàn hơn; xem output `gcc -E`. Tạo Makefile cho 2 module có header dependency (`-MMD -MP`), sửa header rồi build lại; viết CMakeLists.txt tương đương.

## Cases cần kiểm tra
Argument có side effect (`x++`), thiếu ngoặc; sửa header → object nào rebuild; build có/không `-DLOG_LEVEL=2`; out-of-tree build với CMake.

## Required artifacts
src + Makefile + CMakeLists.txt; trích `gcc -E`; rebuild log trước/sau khi sửa header.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Build guidance
Dùng `-std=c11 -Wall -Wextra -Wpedantic -g`; ghi compiler/version và command chính xác.
Có thể thêm `-fsanitize=address,undefined -fno-omit-frame-pointer` khi toolchain hỗ trợ; ghi rõ nếu không có.
Không dùng kết quả sanitizer để kết luận đã bắt được mọi lỗi.
Giai đoạn board: thêm SDK environment/toolchain file để cross compile; ghi output `file <binary>`.

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
