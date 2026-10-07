# Sensor data & signal basics
Status: Not started
## Learning goals
Sampling, Nyquist/aliasing, noise và bias, calibration, đơn vị vật lý, bộ lọc moving average và IIR low-pass, fixed-point, timestamp mẫu

## Recall — 10 phút
Không dùng AI: Với ODR 104 Hz, tín hiệu tần số nào bị aliasing? Bias và noise khác nhau thế nào và đo ra sao? Moving average N mẫu làm trễ tín hiệu bao nhiêu?

## Experiment — 20 phút/buổi
Ghi 60 s dữ liệu LSM6DSOX khi nằm yên; tính bias và độ lệch chuẩn từng trục; xác nhận trục Z xấp xỉ 1 g; vẽ histogram.

## Cases cần kiểm tra
Nằm yên ở 6 hướng; lắc ở tần số khác nhau; so sánh ODR 104 Hz và 416 Hz.

## Required artifacts
CSV dữ liệu thật; script phân tích; bảng bias/noise; đồ thị.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Calibration 6 mặt cho accelerometer: tính offset và scale từng trục; áp dụng và đo mức cải thiện.
2. IIR low-pass fixed-point (Q15) chạy được trên M33; so với bản float về sai số và chu kỳ CPU.
3. Dùng dữ liệu đã ghi để chọn ngưỡng detector của project bằng số liệu báo đúng/báo nhầm.

## Làm tay vs dùng AI
- Làm tay để hiểu: Hiểu sampling, noise và độ trễ bộ lọc để đặt ngưỡng đúng.
- Dùng AI rồi kiểm chứng: Script vẽ đồ thị, phân tích CSV; kiểm kết quả bằng dữ liệu thật.

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
