# Cross toolchain & sysroot
Status: Not started
## Learning goals
Toolchain triplet, sysroot, ABI, glibc và musl, static và dynamic linking, symbol versioning, QEMU user-mode, pkg-config khi cross compile

## Recall — 10 phút
Không dùng AI: Vì sao binary aarch64 build trên host có thể báo `GLIBC_2.xx not found` trên board? Sysroot chứa gì? Khi nào chọn static linking?

## Experiment — 20 phút/buổi
Cross compile một chương trình dùng thư viện (ví dụ libgpiod) cho aarch64 bằng toolchain + sysroot; chạy trên QEMU user-mode rồi trên board; đọc `file`, `readelf -d`, `ldd`.

## Cases cần kiểm tra
Dynamic với sysroot đúng; dynamic với sysroot sai version; static; musl (nếu có toolchain).

## Required artifacts
Lệnh build; output file/readelf; bảng kích thước binary và dependency.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Dùng SDK của OpenSTLinux (Developer Package) và giải thích các biến môi trường nó đặt.
2. Build cho Jetson (glibc 2.27) mà không build native: container Ubuntu 18.04 arm64 hoặc sysroot lấy từ board.
3. Viết toolchain file CMake cho cross compile; kiểm tra find_package trỏ đúng sysroot.

## Làm tay vs dùng AI
- Làm tay để hiểu: Hiểu ABI và sysroot để sửa lỗi build/run trên board.
- Dùng AI rồi kiểm chứng: Toolchain file, Makefile cross compile; kiểm bằng readelf.

## Build guidance
Dùng `-std=c11 -Wall -Wextra -Wpedantic -g`; chạy trên host Linux/WSL và trên board aarch64; ghi kernel, libc, compiler.
Có thể thêm `-fsanitize=address,undefined -fno-omit-frame-pointer` khi toolchain hỗ trợ; ghi rõ nếu không có.
Thí nghiệm có thể làm treo hệ thống (OOM, cắt nguồn, SCHED_FIFO) chỉ chạy trên board hoặc máy ảo, có giới hạn bằng ulimit/cgroup.

## Socratic review — 10 phút
- Dự đoán ban đầu sai ở đâu? Dẫn chứng?
- Kết quả có phụ thuộc kernel, libc, tải hệ thống hoặc host so với board không?
- Áp dụng vào driver/application Linux ở tình huống nào?
- Tôi có thể viết lại và giải thích mà không nhìn đáp án không?

## Conclusions — 5 phút
3 kết luận + 1 câu hỏi còn mở; cập nhật [learning log](../../LEARNING_LOG.md).

## Definition of Done
- [ ] Có source và lệnh build/run.
- [ ] Có expected vs actual cho case liên quan.
- [ ] Có evidence (log, số đo, trace) và phân tích giới hạn.
- [ ] Tự giải thích topic bằng tiếng Việt và 5 câu tiếng Anh.
- [ ] L3: làm lại sau ≥ 7 ngày không ghi chú, không AI, và hoàn thành ít nhất một bài Deep dive.
