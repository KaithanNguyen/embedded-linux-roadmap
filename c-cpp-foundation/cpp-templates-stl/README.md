# C++ templates & STL
Status: Not started
## Learning goals
Function/class template, constexpr, std::array/std::vector, iterator invalidation, heap allocation, code size

## Recall — 10 phút
Không dùng AI: Template được instantiate khi nào và ảnh hưởng code size thế nào? Thao tác nào làm iterator/reference của vector mất hiệu lực?

## Experiment — 20 phút
Viết `RingBuffer<T, N>` dùng std::array (không heap) với push/pop/size; đo code size bằng `size` khi instantiate 1 kiểu và 3 kiểu T.

## Cases cần kiểm tra
Full/empty/wrap-around, N=1, `static_assert` cho N=0; vector `reserve` vs `push_back` gây reallocation (in `data()` trước/sau); không giữ reference qua `push_back`.

## Required artifacts
src/ring_buffer.hpp + tests; output `size`; ghi chú iterator invalidation đã quan sát.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Build guidance
Dùng `-std=c++17 -Wall -Wextra -Wpedantic -g`; ghi compiler/version và command chính xác.
Có thể thêm `-fsanitize=address,undefined -fno-omit-frame-pointer` khi toolchain hỗ trợ; ghi rõ nếu không có.
Không dùng kết quả sanitizer để kết luận đã bắt được mọi lỗi.
Nếu dùng tính năng C++20 (ví dụ std::span), ghi `-std=c++20`; GCC 7 trên Jetson Nano (Ubuntu 18.04) không hỗ trợ C++20.

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
