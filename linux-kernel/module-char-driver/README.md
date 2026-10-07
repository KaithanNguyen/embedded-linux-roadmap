# Kernel module & character driver
Status: Not started
## Learning goals
Module init/exit, misc device/cdev, file_operations (open/read/write/ioctl/poll/release), copy_to_user/copy_from_user, sysfs attribute

## Recall — 10 phút
Không dùng AI: Vì sao không được dereference con trỏ user space trực tiếp? poll cần gì để báo dữ liệu sẵn sàng? rmmod khi còn file mở thì sao?

## Experiment — 20 phút/buổi
Viết misc driver có buffer vòng: write đẩy dữ liệu, read lấy ra, poll báo sẵn sàng, ioctl xóa buffer; test bằng chương trình C.

## Cases cần kiểm tra
Đọc khi rỗng (blocking và O_NONBLOCK); ghi khi đầy; nhiều reader; rmmod khi có fd mở; con trỏ user không hợp lệ.

## Required artifacts
Module source + Makefile; chương trình test; dmesg; checkpatch sạch.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Thêm mmap để chia sẻ buffer với user space.
2. Thêm sysfs attribute cấu hình kích thước buffer, xử lý truy cập đồng thời.
3. Chạy với KASAN và lockdep bật; sửa mọi cảnh báo.

## Làm tay vs dùng AI
- Làm tay để hiểu: Ranh giới user/kernel, locking, lifetime.
- Dùng AI rồi kiểm chứng: Boilerplate file_operations; review từng nhánh lỗi.

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
