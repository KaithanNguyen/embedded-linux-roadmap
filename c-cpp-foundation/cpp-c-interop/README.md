# C/C++ interop & embedded C++
Status: Not started
## Learning goals
extern "C", name mangling, ABI, gọi thư viện C từ C++, callback C → C++, opaque handle, -fno-exceptions/-fno-rtti

## Recall — 10 phút
Không dùng AI: Vì sao C++ mangle tên hàm? Header C cần gì để include được từ C++? Exception đi qua biên C thì sao?

## Experiment — 20 phút
Build module counter (topic build-link) thành thư viện C và gọi từ C++; quan sát symbol bằng `nm` + `c++filt` khi có/không `extern "C"`.

## Cases cần kiểm tra
Thiếu `extern "C"` → undefined reference (lưu lỗi linker); thư viện C nhận callback: dùng static function hoặc lambda không capture + context pointer; so sánh `size` có/không `-fno-exceptions -fno-rtti`.

## Required artifacts
src C + C++ + Makefile; trích nm/c++filt; bảng size.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Opaque handle pattern: thư viện C++ xuất API C ổn định cho code C.
2. Exception đi qua biên C: tái hiện `std::terminate`; đặt quy tắc bắt exception ở biên.
3. So sánh ABI giữa hai version thư viện bằng `nm -D` hoặc abidiff (libabigail).

## Làm tay vs dùng AI
- Làm tay để hiểu: Biên ABI và quy tắc exception.
- Dùng AI rồi kiểm chứng: Wrapper C cho từng hàm; kiểm bằng test link từ C.

## Build guidance
Dùng `-std=c++17 -Wall -Wextra -Wpedantic -g`; ghi compiler/version và command chính xác.
Có thể thêm `-fsanitize=address,undefined -fno-omit-frame-pointer` khi toolchain hỗ trợ; ghi rõ nếu không có.
Không dùng kết quả sanitizer để kết luận đã bắt được mọi lỗi.
Code chạy trên Jetson phải build được bằng GCC 7 (JetPack 4.6): không dùng tính năng C++20.

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
