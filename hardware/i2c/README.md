# I2C
Status: Not started
## Learning goals
Open-drain + pull-up, địa chỉ 7-bit, ACK/NACK, repeated start, clock stretching, register read/write, i2c-tools, `/dev/i2c-N`, ioctl

## Recall — 10 phút
Không dùng AI: Vì sao I2C cần pull-up? Datasheet ghi địa chỉ 7-bit hay 8-bit, khác nhau thế nào? NACK cho biết điều gì?

## Experiment — 20 phút/buổi
Đo 3.3V trên header bằng multimeter trước khi nối LSM6DSOX; xác định bus bằng `i2cdetect -l`, scan bus đó, đọc WHO_AM_I bằng `i2cget` và giải mã gói bằng logic analyzer. Sau đó viết chương trình C qua `/dev/i2c-N` (`ioctl(I2C_RDWR)`) đọc gia tốc và con quay ở 104 Hz.

## Cases cần kiểm tra
Địa chỉ đúng; địa chỉ sai (NACK → errno gì); tháo SDA; WHO_AM_I so với datasheet (LSM6DSOX: 0x6C); board nằm yên → trục Z xấp xỉ 1 g.

## Required artifacts
Wiring; output i2cdetect/i2cget; ảnh logic analyzer; src/lsm6dsox_i2c.c + mẫu dữ liệu đọc được.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Bus recovery: giả lập SDA bị giữ thấp, phục hồi bằng 9 xung SCL; xem driver I2C của kernel xử lý ra sao.
2. Quan sát repeated start và clock stretching trên logic analyzer; giải thích từng pha của giao dịch đọc register.
3. Chuyển từ /dev/i2c sang driver kernel (linux-kernel/driver-model); giải thích lỗi `Device or resource busy`.

## Làm tay vs dùng AI
- Làm tay để hiểu: Đọc waveform và giải thích lỗi bus.
- Dùng AI rồi kiểm chứng: Code ioctl I2C_RDWR mẫu; kiểm bằng logic analyzer.

## Safety & setup
- Tắt nguồn khi đấu/tháo dây; đối chiếu pin map của đúng board revision trước khi cấp điện.
- GPIO header dùng logic 3.3V: không đưa tín hiệu 5V vào GPIO; nối GND chung trước khi nối tín hiệu.
- Ghi board revision, image/kernel (`uname -a`) và version tool; rà soát log (MAC, serial, IP) trước khi commit.
- Xem thêm [quy tắc an toàn](../README.md#an-toàn--đọc-trước-mỗi-lab).
- Chỉ scan bus nối ra header; scan bus nội bộ (PMIC, EEPROM...) có thể gây tác dụng phụ.
- Lab này truy cập từ user space: không bind driver kernel `st_lsm6dsx` vào cùng địa chỉ (bước IIO làm sau).

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
