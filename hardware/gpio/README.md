# GPIO
Status: Not started
## Learning goals
gpiochip/line, active-high/low, pull-up/down, pinmux, libgpiod (character device), giới hạn dòng

## Recall — 10 phút
Không dùng AI: Vì sao sysfs GPIO (`/sys/class/gpio`) bị deprecated và libgpiod khác gì? Khi nào cần pull-up? Vì sao một pin trên header có thể chưa ở chế độ GPIO?

## Experiment — 20 phút/buổi
Dùng `gpiodetect`/`gpioinfo` liệt kê line; chọn 1 pin trống trên header theo pin map, điều khiển LED qua điện trở hạn dòng, rồi đọc nút bấm; viết lại bằng C với libgpiod.

## Cases cần kiểm tra
Line đang bị kernel driver giữ (busy) → ghi lỗi; active-low; nút có/không pull-up; xác minh mức điện áp bằng multimeter.

## Required artifacts
Wiring (số pin, tên line, gpiochip); lệnh + output; src/gpio_blink.c; số đo.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Safety & setup
- Tắt nguồn khi đấu/tháo dây; đối chiếu pin map của đúng board revision trước khi cấp điện.
- GPIO header dùng logic 3.3V: không đưa tín hiệu 5V vào GPIO; nối GND chung trước khi nối tín hiệu.
- Ghi board revision, image/kernel (`uname -a`) và version tool; rà soát log (MAC, serial, IP) trước khi commit.
- Xem thêm [quy tắc an toàn](../README.md#an-toàn--đọc-trước-mỗi-lab).
- Ghi version libgpiod: cú pháp `gpioset`/`gpioget` của v1 và v2 khác nhau.
- Pinmux: Jetson dùng jetson-io; STM32MP2 cấu hình qua device tree.

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
