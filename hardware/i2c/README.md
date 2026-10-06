# I2C
Status: Not started
## Learning goals
Open-drain + pull-up, địa chỉ 7-bit, ACK/NACK, register read/write, i2c-tools, `/dev/i2c-N`, ioctl

## Recall — 10 phút
Không dùng AI: Vì sao I2C cần pull-up? Datasheet ghi địa chỉ 7-bit hay 8-bit, khác nhau thế nào? NACK cho biết điều gì?

## Experiment — 20 phút/buổi
Nối một sensor I2C 3.3V (ghi model) vào bus trên header; xác định bus bằng `i2cdetect -l`, scan bus đó, đọc register ID bằng `i2cget`; sau đó viết chương trình C dùng `ioctl(I2C_RDWR)`.

## Cases cần kiểm tra
Địa chỉ đúng; địa chỉ sai (NACK → errno gì); tháo SDA; so sánh giá trị ID với datasheet.

## Required artifacts
Wiring; output i2cdetect/i2cget; src/i2c_read.c; logic analyzer capture nếu có.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Safety & setup
- Tắt nguồn khi đấu/tháo dây; đối chiếu pin map của đúng board revision trước khi cấp điện.
- GPIO header dùng logic 3.3V: không đưa tín hiệu 5V vào GPIO; nối GND chung trước khi nối tín hiệu.
- Ghi board revision, image/kernel (`uname -a`) và version tool; rà soát log (MAC, serial, IP) trước khi commit.
- Xem thêm [quy tắc an toàn](../README.md#an-toàn--đọc-trước-mỗi-lab).
- Chỉ scan bus nối ra header; scan bus nội bộ (PMIC, EEPROM...) có thể gây tác dụng phụ.

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
