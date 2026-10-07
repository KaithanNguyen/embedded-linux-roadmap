# Upstream workflow
Status: Not started
## Learning goals
Kernel coding style, checkpatch, sparse, MAINTAINERS và get_maintainer.pl, git format-patch/send-email, b4, patch series, phản hồi review

## Recall — 10 phút
Không dùng AI: Một patch tốt gồm những gì? Gửi cho ai và bằng cách nào? Vì sao chia nhỏ patch series?

## Experiment — 20 phút/buổi
Tìm một lỗi nhỏ có thật (typo trong tài liệu, cảnh báo build, binding thiếu) trong subsystem IIO hoặc device tree; chuẩn bị patch sạch checkpatch, commit message đúng chuẩn, gửi thử cho chính mình bằng git send-email.

## Cases cần kiểm tra
Patch đơn; patch series hai phần có cover letter; áp dụng lại bằng b4 hoặc git am.

## Required artifacts
File patch; output checkpatch; email thử.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Gửi patch thật lên mailing list và xử lý phản hồi (09/2027).
2. Review một patch của người khác trên mailing list IIO và ghi nhận xét.
3. Chạy sparse trên driver của mình và sửa cảnh báo.

## Làm tay vs dùng AI
- Làm tay để hiểu: Viết commit message và trả lời review.
- Dùng AI rồi kiểm chứng: Kiểm tra chính tả tiếng Anh của commit message; nội dung kỹ thuật tự viết.

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
