# embedded-linux-roadmap
Hands-on Embedded Linux and Embedded C/C++ engineering roadmap with experiments, debugging logs and projects.

Portfolio của Nguyen Minh Khai: học bằng thí nghiệm, giải thích bằng evidence, hướng đến vị trí Embedded Linux / Platform Engineer.
Hai cổng: 03/2027 BSP + driver + Yocto trên STM32MP257F-DK; 06/2027 hệ thống STM32MP257F-DK + Jetson Nano chạy end-to-end, người khác clone và chạy được theo README. Chi tiết: [roadmap](ROADMAP.md).

## Bắt đầu ở đây
1. Xem tuần hiện tại trong [kế hoạch tuần](sprints/README.md) và mở sprint tương ứng.
2. Mỗi buổi chọn một mục tiêu nhỏ theo [nhịp học](#nhịp-học-hằng-tuần); ghi dự đoán trước khi chạy.
3. Lưu code, lệnh tái hiện và evidence đã rà soát; điền actual output.
4. Ghi một dòng vào [log tháng](LEARNING_LOG.md), rồi commit một thay đổi có ý nghĩa.
5. Chủ nhật: review tuần, cập nhật cột "Output thực tế" của tuần, tháng, quý.

## Dashboard
| Mục | Nội dung | Trạng thái |
| --- | --- | --- |
| [Roadmap](ROADMAP.md) | Lộ trình 10/2026–09/2027: quý, tháng, cổng, chỉ số | Kế hoạch |
| [Sprints](sprints/README.md) | Output mục tiêu và thực tế theo tuần | Tuần 1 đang làm |
| [Learning log](LEARNING_LOG.md) | Log một dòng mỗi ngày, theo tháng | Bắt đầu 10/2026 |
| [C/C++](c-cpp-foundation/README.md) | 17 chủ đề: C core, C cho Linux/embedded, C++ | Chưa đánh giá |
| [LeetCode](leetcode/README.md) | 102 bài gợi ý theo 15 chủ đề, mục tiêu 100 bài | Chưa bắt đầu |
| [Live coding](livecoding/README.md) | 20 bài embedded C có timebox + mini project cùng AI | Chưa bắt đầu |
| [Hardware](hardware/README.md) | Board profile, an toàn, UART/GPIO/I2C/SPI labs | Chưa đánh giá |
| [Projects](projects/README.md) | STM32MP257F-DK + Jetson Nano: network + camera | Planned |
| [Debug logs](debug-logs/README.md) | Debug journal, mục tiêu 30 bản ghi root cause | Template sẵn sàng |
| [Docs](docs/README.md) | Cheat sheet, concept notes, ADR, bài viết, AI error log, tài liệu đọc | Chờ kết quả lab |
| [Templates](templates/README.md) | Báo cáo ngày/tuần/tháng/quý, lab, debug, project | Sẵn sàng |

## Quy tắc evidence
- `TODO`, `Not run`, `Blocked` là trạng thái hợp lệ. File template không chứng minh đã hoàn thành lab.
- Chỉ đánh dấu Done khi có output thật, cách tái hiện và giải thích được kết quả.
- Trước mỗi kết luận, viết một dòng: bằng chứng là gì?
- Ghi OS, compiler, board/image và commit cho mỗi thí nghiệm.
- Repo công khai: không đưa code/tài liệu nội bộ của công ty, token, thông tin khách hàng hoặc log chứa dữ liệu riêng tư.
- Không dùng số lượng commit làm tiêu chí năng lực; số commit chỉ đo sự đều đặn.

## Quy tắc dùng AI
- Khái niệm mới: tự làm lần đầu bằng tay; từ lần thứ hai mới dùng AI để tăng tốc.
- Bị kẹt: tự thử 30 phút và ghi lại đã thử gì. Sau đó mới hỏi, kèm triệu chứng, những gì đã thử và giả thuyết hiện tại.
- Output của AI là bản nháp: viết spec + acceptance criteria trước; đối chiếu từng register/bit với datasheet; kiểm tra timing, ownership bộ nhớ, error path; chạy test trên phần cứng thật.
- Lỗi AI đã mắc ghi vào [AI error log](docs/ai-error-log.md).

## Nhịp học hằng tuần
Buổi tối T2–T6 từ 18:30, mỗi tối một chủ đề chính. Mỗi khối 45 phút: 10 phút recall không AI → 20 phút code/thí nghiệm → 10 phút review Socratic → 5 phút kết luận.

| Buổi | Trọng tâm | Output tối thiểu | Ví dụ |
| --- | --- | --- | --- |
| T2 | C/C++ ([foundation](c-cpp-foundation/README.md), [LeetCode](leetcode/README.md)) | 1 bài tập có unit test | Ring buffer cho mẫu dữ liệu IMU kèm 5 test |
| T3 | Embedded Linux — lý thuyết | 1 concept note hoặc 1 trang ghi chú | Luồng boot ROM → TF-A → U-Boot → kernel |
| T4 | Ngoại ngữ | 1 bản ghi âm 2–3 phút giải thích một chủ đề kỹ thuật bằng tiếng Anh | Giải thích luồng boot của MP257F |
| T5 | MCU và hệ thống ([hardware](hardware/README.md)) | 1 sơ đồ hoặc 1 trang ghi chú | Đường đi của một mẫu dữ liệu từ cảm biến đến user space |
| T6 | Embedded Linux — lab nhỏ | 1 commit hoặc 1 kết quả chạy được, kèm 3 dòng ghi chú | Tháng 10: mini shell; tháng 12: đọc WHO_AM_I của LSM6DSOX |
| T7 | Embedded Linux — lab chính; 13:00–14:00 việc nhẹ: ôn log tuần, đọc datasheet/reference manual | 1 kết quả chạy được có evidence | Boot kernel thủ công từ U-Boot |
| CN | Chốt output tuần, viết README; review tuần 30 phút | Sprint README + bảng tuần cập nhật | Chọn ba việc quan trọng nhất tuần tới |

Mỗi tối T2–T6, 22:00–22:30: trình bày bằng tiếng Anh đúng chủ đề vừa học — 5 phút ghi 3 ý chính → 15 phút nói và ghi âm → 10 phút nghe lại, ghi lỗi và từ bị bí.

Hai quy tắc: buổi không có output là buổi chưa xong; ngày bị kẹt thì output là bản ghi "đã thử gì, giả thuyết gì", và vẫn được tính.
