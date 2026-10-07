# SPI
Status: Not started
## Learning goals
Mode CPOL/CPHA, chip select, clock speed, full-duplex, spidev, DMA cho transfer lớn, device tree/pinmux

## Recall — 10 phút
Không dùng AI: SPI mode 0–3 khác nhau ở đâu? Vì sao SPI không có ACK như I2C? Ai quyết định tốc độ clock tối đa?

## Experiment — 20 phút/buổi
Bước 1: loopback MOSI→MISO trên header, gửi/nhận buffer bằng chương trình C `ioctl(SPI_IOC_MESSAGE)`, thử đổi mode và speed. Bước 2: chuyển LSM6DSOX sang SPI, đọc WHO_AM_I, so sánh thời gian đọc I2C và SPI bằng logic analyzer.

## Cases cần kiểm tra
Có/không nối loopback; speed thấp/cao; sai SPI mode với LSM6DSOX; spidev chưa được bật trong device tree/pinmux → ghi blocker và cách bật.

## Required artifacts
src/spi_loopback.c, src/lsm6dsox_spi.c; output; ảnh logic analyzer I2C vs SPI; cấu hình device tree/pinmux đã dùng.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Đo throughput spidev với transfer nhỏ và lớn; giải thích overhead mỗi transfer và khi nào driver dùng DMA.
2. Cố ý sai SPI mode và tốc độ, nhận diện lỗi từ waveform.
3. Đọc FIFO của LSM6DSOX theo burst qua SPI; so sánh với đọc từng mẫu.

## Làm tay vs dùng AI
- Làm tay để hiểu: Timing và mode của bus — đọc từ waveform thật.
- Dùng AI rồi kiểm chứng: Code spidev mẫu; kiểm bằng logic analyzer.

## Safety & setup
- Tắt nguồn khi đấu/tháo dây; đối chiếu pin map của đúng board revision trước khi cấp điện.
- GPIO header dùng logic 3.3V: không đưa tín hiệu 5V vào GPIO; nối GND chung trước khi nối tín hiệu.
- Ghi board revision, image/kernel (`uname -a`) và version tool; rà soát log (MAC, serial, IP) trước khi commit.
- Xem thêm [quy tắc an toàn](../README.md#an-toàn--đọc-trước-mỗi-lab).

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
