# C++ RAII & ownership
Status: Not started
## Learning goals
Constructor/destructor, RAII, rule of 0/3/5, move semantics, unique_ptr/shared_ptr

## Recall — 10 phút
Không dùng AI: RAII tự động hóa điều gì mà `goto cleanup` trong C làm thủ công? Sau khi move, object nguồn ở trạng thái nào? Khi nào cần shared_ptr thay vì unique_ptr?

## Experiment — 20 phút
Viết class `UniqueFd` bọc file descriptor: đóng trong destructor, cấm copy, cho phép move; viết lại `copy_file` của topic error-handling bằng RAII và so sánh.

## Cases cần kiểm tra
Move constructor/assignment, self-move, return sớm và exception giữa chừng vẫn đóng fd; log ctor/dtor để chứng minh thứ tự hủy.

## Required artifacts
src/unique_fd.cpp + tests; trace ctor/dtor; bảng so sánh C goto vs RAII.
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
