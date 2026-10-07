# Memory
Status: Not started
## Learning goals
Automatic/static/allocated storage, ownership, allocation failure, fragmentation, stack usage, memory map của process

## Recall — 10 phút
Không dùng AI: Ai sở hữu buffer? Stack/heap khác lifetime và storage duration thế nào? Stack của một thread mặc định lớn bao nhiêu và tràn thì sao?

## Experiment — 20 phút
Viết buffer cấp phát động, kiểm tra size hợp lệ và lỗi cấp phát; một owner chịu trách nhiệm giải phóng.

## Cases cần kiểm tra
Size=0, size bình thường, input vượt giới hạn; mô phỏng allocation failure bằng allocator wrapper.

## Required artifacts
src/buffer.c + tests; ownership diagram + sanitizer output.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Fixed-block pool allocator không dùng malloc khi chạy; test cấp hết block, double free, block không thuộc pool.
2. Đo stack usage bằng `-fstack-usage` và `-Wstack-usage=`; đọc `/proc/<pid>/maps` để chỉ ra .text, .data, heap, stack, vùng mmap.
3. Theo dõi heap của một service chạy lâu bằng Valgrind massif hoặc heaptrack; tìm và sửa một leak.

## Làm tay vs dùng AI
- Làm tay để hiểu: Ownership, vòng đời buffer, chiến lược cấp phát cho firmware.
- Dùng AI rồi kiểm chứng: Wrapper allocator, code thống kê; kiểm bằng ASan và Valgrind.

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
