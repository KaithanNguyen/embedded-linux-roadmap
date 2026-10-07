# Boot chain
Status: Not started
## Learning goals
ROM code, TF-A BL2/BL31, OP-TEE, U-Boot, FIP, partition boot, kernel + DTB, initramfs, systemd; thời gian từng stage

## Recall — 10 phút
Không dùng AI: Ai load ai và từ đâu? FIP chứa gì? Thiếu DTB đúng thì kernel dừng ở đâu?

## Experiment — 20 phút/buổi
Capture boot log đầy đủ của MP257F từ power-on; chú thích từng stage (ai chạy, ở EL nào, đọc gì từ đâu); đo thời gian từng stage bằng timestamp.

## Cases cần kiểm tra
Boot từ microSD; liệt kê partition và vai trò từng partition; trên thẻ dự phòng, đổi tên DTB để quan sát lỗi.

## Required artifacts
Boot log có chú thích; bảng partition; bảng thời gian stage.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Build lại TF-A hoặc U-Boot từ source của ecosystem, thay vào FIP và boot được.
2. Rút ngắn thời gian boot: đo bằng `systemd-analyze` và log, cắt một nguồn chậm có số liệu trước/sau.
3. So sánh boot chain MP257F với Jetson Nano (bootloader trong QSPI, extlinux).

## Làm tay vs dùng AI
- Làm tay để hiểu: Đọc boot log và định vị lỗi boot.
- Dùng AI rồi kiểm chứng: Tóm tắt tài liệu ecosystem; đối chiếu với log thật.

## Build guidance
Build bằng kernel source và config đúng của board: `make -C <kernel-dir> M=$PWD modules`; ghi kernel version, config, toolchain.
Code kernel theo kernel coding style; chạy `scripts/checkpatch.pl --no-tree -f` trước khi commit.
Thí nghiệm gây oops/panic chỉ chạy trên board; giữ sẵn thẻ microSD dự phòng có image đã kiểm tra.
Bật debug config khi cần (KASAN, lockdep, DEBUG_ATOMIC_SLEEP) và ghi lại trong REPORT.

## Socratic review — 10 phút
- Dự đoán ban đầu sai ở đâu? Dẫn chứng?
- Kết quả có phụ thuộc kernel version, config hoặc device tree không?
- Áp dụng vào driver/application Linux ở tình huống nào?
- Tôi có thể viết lại và giải thích mà không nhìn đáp án không?

## Conclusions — 5 phút
3 kết luận + 1 câu hỏi còn mở; cập nhật [learning log](../../LEARNING_LOG.md).

## Definition of Done
- [ ] Có source, lệnh build và cách nạp lên board.
- [ ] Có expected vs actual (dmesg, sysfs, số đo) cho case liên quan.
- [ ] checkpatch sạch với code kernel; không có cảnh báo khi bật debug config.
- [ ] Tự giải thích topic bằng tiếng Việt và 5 câu tiếng Anh.
- [ ] L3: làm lại sau ≥ 7 ngày không ghi chú, không AI, và hoàn thành ít nhất một bài Deep dive.
