# Register-level programming
Status: Not started
## Learning goals
Đọc datasheet/reference manual, register map, bit field, giá trị reset, read-modify-write, độ rộng truy cập, đối chiếu code AI sinh với tài liệu

## Recall — 10 phút
Không dùng AI: Read-modify-write có rủi ro gì khi có interrupt hoặc thread khác? Vì sao phải truy cập đúng độ rộng (8/16/32-bit)? Giá trị reset của register dùng để làm gì khi debug?

## Experiment — 20 phút/buổi
Lập bảng register LSM6DSOX cần dùng (WHO_AM_I, CTRL1_XL, CTRL2_G, CTRL3_C, INT1_CTRL, STATUS_REG, thanh ghi dữ liệu): địa chỉ, bit field, giá trị reset; cấu hình ODR và full scale bằng read-modify-write qua /dev/i2c. Nhờ AI sinh cùng bảng rồi đối chiếu từng bit, ghi sai lệch vào AI error log.

## Cases cần kiểm tra
Giá trị reset khớp datasheet; đổi ODR rồi đo tần số INT1 bằng logic analyzer; read-modify-write không làm hỏng bit khác; bảng do AI sinh: sai lệch được tìm ra hoặc xác nhận không có.

## Required artifacts
Bảng register (nguồn: datasheet + revision); src/lsm6dsox_regs.h; ảnh logic analyzer tần số INT1; mục trong docs/ai-error-log.md.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Firmware M33 (06/2027): điều khiển GPIO và timer của STM32MP25 trực tiếp bằng register theo reference manual.
2. Khai báo `regmap_config` cho LSM6DSOX (readable, writeable, volatile register) trong driver ở linux-kernel/driver-model.
3. Đối chiếu header register do vendor cung cấp (CMSIS/HAL) với reference manual cho một peripheral.

## Làm tay vs dùng AI
- Làm tay để hiểu: Đối chiếu từng bit với tài liệu — chính là kỹ năng kiểm chứng output AI.
- Dùng AI rồi kiểm chứng: Sinh bảng/header register ban đầu; bắt buộc kiểm từng dòng.

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
