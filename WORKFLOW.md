# Workflow
Cách làm việc hằng ngày và hằng tuần với repo: nhịp học, vòng verify, quy tắc evidence và quy tắc dùng AI.
Kế hoạch dài hạn ở [ROADMAP.md](ROADMAP.md); level của từng topic ở [TRACKING.md](TRACKING.md).

## Bắt đầu ở đây
1. Xem tuần hiện tại trong [kế hoạch tuần](sprints/README.md#q42026) và mở sprint tương ứng.
2. Mỗi buổi chọn một mục tiêu nhỏ theo [nhịp học](#nhịp-học-hằng-tuần); ghi dự đoán trước khi chạy.
3. Lưu code, lệnh tái hiện và evidence đã rà soát; điền actual output vào REPORT.md.
4. Ghi một dòng vào [log tháng](LEARNING_LOG.md); cập nhật level trong TRACKING.md nếu topic đổi level.
5. Chạy `python tools/repo_check.py check`, rồi commit một thay đổi có ý nghĩa.
6. Chủ nhật: review tuần theo [vòng verify](#vòng-verify), cập nhật cột "Output thực tế" của tuần, tháng, quý.

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
| CN | Chốt output tuần, viết README; review tuần 30 phút | Sprint README + bảng tuần + TRACKING cập nhật | Chọn ba việc quan trọng nhất tuần tới |

Mỗi tối T2–T6, 22:00–22:30: trình bày bằng tiếng Anh đúng chủ đề vừa học — 5 phút ghi 3 ý chính → 15 phút nói và ghi âm → 10 phút nghe lại, ghi lỗi và từ bị bí.

Hai quy tắc: buổi không có output là buổi chưa xong; ngày bị kẹt thì output là bản ghi "đã thử gì, giả thuyết gì", và vẫn được tính.

## Vòng verify
Định nghĩa level L0–L4 và mục tiêu theo cổng: [TRACKING.md](TRACKING.md#mức-verify).

| Khi nào | Việc |
| --- | --- |
| Sau mỗi lab | Điền REPORT.md có kết quả Pass/Fail và link evidence → nâng topic lên L2 trong TRACKING.md |
| Chủ nhật | Làm lại 1–2 topic đã ở L2 được ≥ 7 ngày, không ghi chú, không AI, trong timebox → L3 kèm ngày; chạy `python tools/repo_check.py check` và `python tools/repo_check.py progress --write` |
| Cuối tháng | Spot check: làm lại 2 topic L3 chọn ngẫu nhiên; không đạt thì hạ về L2 và ghi lý do |
| Cuối quý | Audit toàn bộ TRACKING.md: topic trễ hạn, topic cần verify lại, level so với mục tiêu cổng |

## Quy tắc evidence
- `TODO`, `Not run`, `Blocked` là trạng thái hợp lệ. File template không chứng minh đã hoàn thành lab.
- Chỉ đánh dấu Done khi có output thật, cách tái hiện và giải thích được kết quả.
- Trước mỗi kết luận, viết một dòng: bằng chứng là gì?
- Ghi OS, compiler, board/image và commit cho mỗi thí nghiệm.
- Repo công khai: không đưa code hay tài liệu nội bộ của công ty, token, thông tin khách hàng, dữ liệu cá nhân, serial number, MAC hoặc IP nội bộ vào repo, kể cả commit message.
- Không dùng số lượng commit làm tiêu chí năng lực; số commit chỉ đo sự đều đặn.

## Quy tắc dùng AI
- Khái niệm mới: tự làm lần đầu bằng tay; từ lần thứ hai mới dùng AI để tăng tốc.
- Bị kẹt: tự thử 30 phút và ghi lại đã thử gì. Sau đó mới hỏi, kèm triệu chứng, những gì đã thử và giả thuyết hiện tại.
- Output của AI là bản nháp: viết spec + acceptance criteria trước; đối chiếu từng register/bit với datasheet; kiểm tra timing, ownership bộ nhớ, error path; chạy test trên phần cứng thật.
- Lỗi AI đã mắc ghi vào [AI error log](docs/ai-error-log.md).
- Bài verify L3 làm hoàn toàn không AI.
