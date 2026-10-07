# Build & link
Status: Not started
## Learning goals
Storage duration và linkage (static/extern), preprocessor, translation unit, symbol resolution, section, relocation, linker script, startup code, shared library

## Recall — 10 phút
Không dùng AI: Declaration, definition, linkage khác nhau thế nào? `static` ở file scope làm gì với symbol? .data và .bss được khởi tạo ở đâu trước main?

## Experiment — 20 phút
Build counter.c + main.c thành object riêng rồi link; đọc `nm`, `readelf -s` và map file; tái hiện undefined và duplicate symbol rồi sửa.

## Cases cần kiểm tra
Build thành công; thiếu object; duplicate definition; biến static ở file scope không thành symbol global; phân biệt lỗi compiler và lỗi linker.

## Required artifacts
src nhiều translation unit + Makefile; trích nm/readelf/map file.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Bare-metal: viết linker script + startup code tối thiểu cho Cortex-M (QEMU hoặc M33): vector table, copy .data, xóa .bss; đọc map file.
2. Shared library: `-fPIC`, `-fvisibility=hidden`, soname, rpath; dùng `LD_DEBUG=bindings` xem symbol được resolve thế nào.
3. Tái hiện lỗi `GLIBC_2.xx not found` khi binary build với glibc mới chạy trên rootfs cũ (như Jetson glibc 2.27); sửa bằng sysroot đúng.

## Làm tay vs dùng AI
- Làm tay để hiểu: Linker script, section, quá trình khởi động trước main.
- Dùng AI rồi kiểm chứng: Makefile/CMake boilerplate; đọc lại và giải thích được từng flag.

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
