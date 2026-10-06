# Pointer
Status: Not started
## Learning goals
Địa chỉ, dereference, array decay, const, lifetime

## Recall — 10 phút
Không dùng AI: Vì sao sizeof(pointer) không cho độ dài mảng? Khi nào pointer vẫn có địa chỉ nhưng object hết lifetime?

## Experiment — 20 phút
Viết hàm đảo mảng tại chỗ nhận pointer + length; quy định rõ input null/length=0.

## Cases cần kiểm tra
Mảng 0/1/n phần tử; null với length=0; từ chối null khi length>0 theo contract.

## Required artifacts
src/reverse.c + tests; vẽ vùng nhớ trước/sau.
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
