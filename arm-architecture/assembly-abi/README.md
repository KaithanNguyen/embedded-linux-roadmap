# Assembly & ABI
Status: Not started
## Learning goals
AAPCS64 và AAPCS (Armv8-M): thanh ghi tham số/trả về, callee-saved, stack frame, frame pointer; đọc disassembly; inline asm cơ bản

## Recall — 10 phút
Không dùng AI: Hàm aarch64 nhận tham số thứ 9 ở đâu? Thanh ghi nào callee phải giữ nguyên? Frame pointer giúp gì cho backtrace?

## Experiment — 20 phút/buổi
Biên dịch 5 hàm nhỏ (nhiều tham số, trả về struct, đệ quy, varargs, gọi qua con trỏ) cho aarch64 và Cortex-M33 ở -O0/-O2; chú thích prologue/epilogue và cách truyền tham số.

## Cases cần kiểm tra
Struct ≤ 16 byte và > 16 byte khi trả về; hàm leaf và non-leaf; `-fomit-frame-pointer` bật/tắt.

## Required artifacts
src/abi_samples.c; disassembly có chú thích; bảng thanh ghi.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Unwind thủ công một stack từ core dump bằng frame pointer; so với `bt` của GDB.
2. Inline asm đọc counter `CNTVCT_EL0` để đo thời gian; so với `clock_gettime`.
3. Đọc memcpy tối ưu cho aarch64 của glibc hoặc kernel và giải thích kỹ thuật được dùng.

## Làm tay vs dùng AI
- Làm tay để hiểu: Đọc disassembly khi debug crash không có symbol.
- Dùng AI rồi kiểm chứng: Giải thích lệnh lạ; luôn kiểm lại bằng tài liệu ISA.

## Build guidance
Biên dịch cho aarch64 (Cortex-A35, Cortex-A57) và Armv8-M (`-mcpu=cortex-m33 -mthumb`); ghi compiler, flags và lõi chạy thử.
Trích tài liệu kèm phiên bản: Arm Architecture Reference Manual, TRM của lõi, AAPCS64.
Đo trên một core cố định (`taskset`), lặp lại ít nhất 3 lần; ghi tần số CPU và cpufreq governor.

## Socratic review — 10 phút
- Dự đoán ban đầu sai ở đâu? Dẫn chứng?
- Kết quả có phụ thuộc lõi CPU (A35, A57, M33), cấu hình cache/MMU hoặc compiler không?
- Áp dụng vào driver/application Linux ở tình huống nào?
- Tôi có thể viết lại và giải thích mà không nhìn đáp án không?

## Conclusions — 5 phút
3 kết luận + 1 câu hỏi còn mở; cập nhật [learning log](../../LEARNING_LOG.md).

## Definition of Done
- [ ] Có source, lệnh build/run và lõi CPU đã chạy.
- [ ] Có expected vs actual cho case liên quan.
- [ ] Có evidence (số đo, disassembly, log) và trích tài liệu kèm phiên bản.
- [ ] Tự giải thích topic bằng tiếng Việt và 5 câu tiếng Anh.
- [ ] L3: làm lại sau ≥ 7 ngày không ghi chú, không AI, và hoàn thành ít nhất một bài Deep dive.
