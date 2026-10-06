# C++ classes & polymorphism
Status: Not started
## Learning goals
Object layout, virtual dispatch, vtable, virtual destructor, override/final, so sánh với bảng function pointer trong C

## Recall — 10 phút
Không dùng AI: Virtual call tốn gì so với gọi trực tiếp? Vì sao base class đa hình cần virtual destructor? Linux kernel làm "đa hình" bằng C như thế nào?

## Experiment — 20 phút
Viết interface `Sensor` (`read()`) với 2 implementation; viết bản C tương đương bằng struct ops chứa function pointer (giống `file_operations`). So sánh `sizeof` object và assembly của lời gọi.

## Cases cần kiểm tra
Gọi qua base pointer/reference; delete qua base pointer khi thiếu virtual destructor (bản lỗi tách riêng, chạy ASan); sai signature khi có/không dùng `override`.

## Required artifacts
src/sensor.cpp, src/sensor_ops.c; bảng sizeof; assembly excerpts.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Build guidance
Dùng `-std=c++17 -Wall -Wextra -Wpedantic -g`; ghi compiler/version và command chính xác.
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
