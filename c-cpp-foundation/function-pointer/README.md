# Function pointer
Status: Not started
## Learning goals
Callback signature, dispatch, context pointer, ownership, ops table (file_operations), so sánh với virtual dispatch của C++

## Recall — 10 phút
Không dùng AI: Tại sao gọi qua function pointer sai signature là lỗi? Ai sở hữu context? Vtable của C++ và ops table của kernel giống và khác nhau ở đâu?

## Experiment — 20 phút
Tạo dispatcher gọi callback kèm void* context với prototype thống nhất; định nghĩa hành vi khi callback null.

## Cases cần kiểm tra
Callback hợp lệ, null callback, event không hỗ trợ; xác minh context còn sống khi callback chạy.

## Required artifacts
src/dispatch.c + tests; call-flow note.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Ops table kiểu `file_operations` cho nguồn mẫu của sensor-svc, chọn lúc chạy: IIO và file replay (thêm RPMsg khi làm phần mở rộng M33).
2. So sánh với virtual dispatch của C++: sizeof object, vtable, assembly của lời gọi.
3. Hủy đăng ký callback khi context bị giải phóng: tái hiện use-after-free bằng ASan rồi sửa bằng quy tắc unregister.

## Làm tay vs dùng AI
- Làm tay để hiểu: Lifetime của context và thứ tự đăng ký/hủy đăng ký.
- Dùng AI rồi kiểm chứng: Boilerplate đăng ký handler; kiểm bằng ASan.

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
