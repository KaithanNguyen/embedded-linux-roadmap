# Pointer
Status: Not started
## Learning goals
Địa chỉ, dereference, array decay, const, lifetime, pointer arithmetic, alignment, strict aliasing

## Recall — 10 phút
Không dùng AI: Vì sao sizeof(pointer) không cho độ dài mảng? Khi nào pointer vẫn có địa chỉ nhưng object hết lifetime? Strict aliasing cấm điều gì?

## Experiment — 20 phút
Viết hàm đảo mảng tại chỗ nhận pointer + length; quy định rõ input null/length=0.

## Cases cần kiểm tra
Mảng 0/1/n phần tử; null với length=0; từ chối null khi length>0 theo contract.

## Required artifacts
src/reverse.c + tests; vẽ vùng nhớ trước/sau.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Cài `container_of` và intrusive list giống kernel; giải thích vì sao phép trừ `offsetof` hợp lệ.
2. Trên board aarch64: so sánh code sinh khi đọc `uint32_t` từ địa chỉ lệch qua cast con trỏ và qua `memcpy`; giải thích khác biệt giữa Normal memory và Device memory.
3. Tái hiện lỗi strict aliasing ở `-O2`, sửa bằng `memcpy` hoặc cách đúng chuẩn; so sánh assembly.

## Làm tay vs dùng AI
- Làm tay để hiểu: Lifetime, aliasing, alignment — nền để phát hiện lỗi trong code AI sinh ra.
- Dùng AI rồi kiểm chứng: Hàm tiện ích xử lý mảng/chuỗi thông thường; tự viết test biên để kiểm.

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
