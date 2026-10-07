# Electrical basics & datasheet
Status: Not started
## Learning goals
Điện áp/dòng/công suất, logic level, pull-up/pull-down, push-pull vs open-drain, điện trở hạn dòng, đọc schematic/datasheet

## Recall — 10 phút
Không dùng AI: Tính điện trở hạn dòng cho LED từ GPIO 3.3V thế nào? Vì sao không lấy dòng lớn trực tiếp từ GPIO? Open-drain khác push-pull ở đâu?

## Experiment — 20 phút/buổi
Từ user manual/schematic, lập pin map 40-pin header của cả hai board (số pin, tên tín hiệu, mức điện áp, chức năng mặc định). Đo rail 3.3V, 5V và GND trên header bằng multimeter khi board đang chạy.

## Cases cần kiểm tra
Đối chiếu tài liệu vs số đo; đánh dấu pin 5V cần tránh khi nối tín hiệu; tính điện trở LED với dòng nằm trong giới hạn datasheet.

## Required artifacts
Pin map cho mỗi board (kèm tên + version tài liệu); bảng số đo; ảnh setup đo.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Tính thời gian lên của đường I2C từ điện trở pull-up và điện dung bus; suy ra tốc độ tối đa và chọn pull-up.
2. Lần theo cây nguồn trên schematic DK: PMIC → rail → 3V3 của header; ghi dòng tối đa được phép lấy.
3. Đo dòng tiêu thụ của LSM6DSOX ở power-down, low-power, high-performance và so với datasheet.

## Làm tay vs dùng AI
- Làm tay để hiểu: Đọc schematic, tính dòng/áp — sai ở đây làm hỏng phần cứng.
- Dùng AI rồi kiểm chứng: Tra nhanh thông số linh kiện; luôn mở datasheet gốc để xác nhận.

## Safety & setup
- Tắt nguồn khi đấu/tháo dây; đối chiếu pin map của đúng board revision trước khi cấp điện.
- GPIO header dùng logic 3.3V: không đưa tín hiệu 5V vào GPIO; nối GND chung trước khi nối tín hiệu.
- Ghi board revision, image/kernel (`uname -a`) và version tool; rà soát log (MAC, serial, IP) trước khi commit.
- Xem thêm [quy tắc an toàn](../README.md#an-toàn--đọc-trước-mỗi-lab).
- Đo áp ở chế độ V; không để que đo chạm hai pin cạnh nhau.

## Socratic review — 10 phút
- Dự đoán ban đầu sai ở đâu? Dẫn chứng?
- Kết quả có phụ thuộc board revision, device tree/pinmux hoặc kernel version không?
- Áp dụng vào driver/application Linux ở tình huống nào?
- Tôi có thể viết lại và giải thích mà không nhìn đáp án không?

## Conclusions — 5 phút
3 kết luận + 1 câu hỏi còn mở; cập nhật [learning log](../../LEARNING_LOG.md).

## Definition of Done
- [ ] Có wiring/pin map và lệnh tái hiện.
- [ ] Có expected vs actual cho case liên quan.
- [ ] Có evidence thật (log/số đo/ảnh) và phân tích giới hạn.
- [ ] Tự giải thích topic bằng tiếng Việt và 5 câu tiếng Anh.
- [ ] L3: làm lại sau ≥ 7 ngày không ghi chú, không AI, và hoàn thành ít nhất một bài Deep dive.
