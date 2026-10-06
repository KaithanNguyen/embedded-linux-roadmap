# UART & serial console
Status: Not started
## Learning goals
Baud rate, 8N1, nối chéo TX/RX, GND chung, logic level, serial console, /dev/tty*

## Recall — 10 phút
Không dùng AI: Vì sao TX nối RX và bắt buộc GND chung? Sai baud thì output trông như thế nào? Dùng USB-UART 5V với board 3.3V có an toàn không?

## Experiment — 20 phút/buổi
Mở serial console STM32MP257F-DK qua ST-LINK virtual COM port và capture log từ power-on đến login. Với Jetson Nano, dùng USB-UART 3.3V vào debug UART theo tài liệu carrier board.

## Cases cần kiểm tra
Baud đúng; baud sai (lưu output rác); rút cáp giữa chừng; ghi device node (`/dev/ttyACM*`, `/dev/ttyUSB*`) và quyền truy cập (group dialout).

## Required artifacts
Boot log thật đã rà soát; sơ đồ/ảnh đấu dây; lệnh picocom/minicom/screen đã dùng.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

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
