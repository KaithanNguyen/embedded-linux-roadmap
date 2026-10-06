# static / extern
Status: Not started
## Learning goals
Scope, linkage, storage duration, declaration vs definition

## Recall — 10 phút
Không dùng AI: Vì sao static local giữ giá trị nhưng không có external linkage? extern declaration có cấp storage không?

## Experiment — 20 phút
Tạo module counter.c/counter.h và main.c; state file-static, API public; thử một biến extern có đúng một definition.

## Cases cần kiểm tra
Tăng/reset counter; build bản cố ý thiếu definition hoặc trùng definition trong thư mục thí nghiệm riêng.

## Required artifacts
src gồm nhiều translation units; build output + nm output.
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
