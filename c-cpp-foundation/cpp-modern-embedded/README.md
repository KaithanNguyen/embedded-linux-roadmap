# Modern C++ cho embedded
Status: Not started
## Learning goals
RAII, ownership, move semantics, rule of 0/3/5, unique_ptr, constexpr, std::array, template và code size, -fno-exceptions/-fno-rtti

## Recall — 10 phút
Không dùng AI: RAII tự động hóa điều gì mà `goto cleanup` trong C làm thủ công? Object nguồn sau khi move ở trạng thái nào? Template ảnh hưởng code size thế nào?

## Experiment — 20 phút
Viết class `UniqueFd` move-only bọc file descriptor; viết `RingBuffer<T, N>` dùng std::array (không heap); đo code size bằng `size`.

## Cases cần kiểm tra
Move constructor/assignment, self-move, return sớm vẫn đóng fd; ring đầy/rỗng/wrap-around; instantiate 1 kiểu và 3 kiểu T.

## Required artifacts
src/unique_fd.cpp, src/ring_buffer.hpp + tests; trace ctor/dtor; bảng code size.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Static polymorphism (CRTP) so với virtual: code size, khả năng inline, khi nào chọn.
2. Build với `-fno-exceptions -fno-rtti`; thiết kế xử lý lỗi bằng `std::optional` hoặc mã lỗi; đo size.
3. Bảng tra `constexpr` tính lúc compile (hệ số chuyển đổi LSM6DSOX); khóa bằng `static_assert`.

## Làm tay vs dùng AI
- Làm tay để hiểu: Ownership, vòng đời object, chi phí runtime của từng tính năng C++.
- Dùng AI rồi kiểm chứng: Code template lặp lại, boilerplate class; kiểm bằng test và đo size.

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
