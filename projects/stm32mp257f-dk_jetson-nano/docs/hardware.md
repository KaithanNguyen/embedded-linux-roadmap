# Hardware & wiring
Status: Bản nháp. Mọi số chân phải đối chiếu user manual UM3385 (STM32MP257F-DK), tài liệu carrier board Jetson Nano và datasheet LSM6DSOX trước khi nối dây.
Chỉ tick cột "Đã xác minh" sau khi kiểm bằng tài liệu đúng revision **và** bằng đồng hồ đo. Quy tắc an toàn chung: [hardware](../../../hardware/README.md#an-toàn--đọc-trước-mỗi-lab).

## BOM
| Hạng mục | SL | Vai trò | Ghi chú |
| --- | --- | --- | --- |
| STM32MP257F-DK | 1 | Sensor node | Nguồn USB-C PD 5V/3A; console qua ST-LINK |
| Jetson Nano Developer Kit 4GB | 1 | Gateway + camera | DC 5V/4A + jumper J48; nên gắn quạt |
| LSM6DSOX breakout | 1 | IMU 6 trục | Kiểm tra breakout có sẵn pull-up I2C và mạch chọn địa chỉ |
| Camera Raspberry Pi v2 (IMX219) | 1 | Video | Cáp CSI 15 chân; webcam USB dự phòng |
| microSD | 2 | Rootfs | Jetson ≥ 64 GB, loại chịu ghi tốt |
| SSD USB (tùy chọn) | 1 | Lưu clip | Nếu microSD không đủ bền khi ghi liên tục |
| Switch GbE 5 cổng + 3 cáp | 1 | LAN lab | Không nối vào mạng khác |
| USB-UART 3.3 V | 1 | Console Jetson, UART thứ hai của MP257F | Chỉ dùng loại mức 3.3 V |
| Logic analyzer 8 kênh | 1 | Giải mã bus, đo latency | sigrok / PulseView |
| Đồng hồ vạn năng | 1 | Điện áp, thông mạch, dòng | — |
| LED đỏ + điện trở 330 Ω | 1 | Báo sự kiện | — |
| Buzzer chủ động 5 V + NPN (S8050/2N2222) + 1 kΩ + 1N4148 | 1 | Báo âm | Đóng ngắt phía thấp, GPIO không chạm 5 V |
| Module relay USB, tiếp điểm ≥ 5 A DC | 1 | Cắt nguồn Jetson trong test R11 | Chỉ đóng ngắt phía DC 5 V |
| Điện trở 1 kΩ | 2 | Bảo vệ đường sync GPIO giữa hai board | — |
| Breadboard, dây jumper | — | Đấu nối | Chụp ảnh mỗi lần thay đổi |

## Pin map LSM6DSOX ↔ STM32MP257F-DK
Header 40 chân của DK có bố cục kiểu Raspberry Pi. Cột "Chân đề xuất" dùng vị trí chuẩn của bố cục đó; phải xác minh tên tín hiệu SoC, instance I2C/SPI và chức năng mặc định trong device tree trước khi dùng.

### Chế độ I2C (mặc định)
| Chân LSM6DSOX | Nối tới | Chân đề xuất | Tín hiệu SoC | Đã xác minh? |
| --- | --- | --- | --- | --- |
| VDD, VDDIO | 3V3 | 1 | — | ☐ |
| GND | GND | 6 | — | ☐ |
| SCL | I2C SCL | 5 | TODO | ☐ |
| SDA | I2C SDA | 3 | TODO | ☐ |
| SDO/SA0 | GND → địa chỉ 0x6A (nối 3V3 → 0x6B) | 9 | — | ☐ |
| CS | 3V3 → chọn chế độ I2C | 17 | — | ☐ |
| INT1 | GPIO input (data-ready hoặc free-fall) | 11 | TODO | ☐ |

### Chế độ SPI (tuần 21–27/12/2026)
| Chân LSM6DSOX | Nối tới | Chân đề xuất | Tín hiệu SoC | Đã xác minh? |
| --- | --- | --- | --- | --- |
| SCL/SPC | SPI SCK | 23 | TODO | ☐ |
| SDA/SDI | SPI MOSI | 19 | TODO | ☐ |
| SDO/SA0 | SPI MISO | 21 | TODO | ☐ |
| CS | SPI CS0 | 24 | TODO | ☐ |
| INT1 | GPIO input | 11 | TODO | ☐ |

SPI mode theo datasheet (cảm biến ST thường hỗ trợ mode 0 và mode 3). Khi đo bằng logic analyzer 24 MS/s, chạy SPI ≤ 4 MHz để giải mã tin cậy.

### Thông số cảm biến dùng trong thiết kế
Giá trị lấy theo datasheet họ LSM6DSO; xác minh lại trên datasheet LSM6DSOX trước khi viết driver.

| Thông số | Giá trị | Ghi chú |
| --- | --- | --- |
| WHO_AM_I | 0x6C | Lab HW04 |
| Địa chỉ I2C | 0x6A (SA0 = 0), 0x6B (SA0 = 1) | — |
| ODR | 104 Hz | Chu kỳ ≈ 9.6 ms |
| Full scale | Accel ±16 g (0.488 mg/LSB), gyro ±2000 dps (70 mdps/LSB) | Biên độ va đập lớn |
| Thanh ghi dữ liệu | Gyro từ 0x22, accel từ 0x28; đọc liên tiếp 12 byte | Little-endian, int16 |

## Mạch LED và buzzer
```text
LED (GPIO do M33 điều khiển)
  GPIO 3.3 V ──[ 330 Ω ]──►|── GND        I ≈ (3.3 V − 2.0 V) / 330 Ω ≈ 3.9 mA

Buzzer chủ động 5 V, đóng ngắt phía thấp bằng NPN
  5 V ───────┬───────── (+) buzzer (−) ─────┬──── C ┐
             │                              │       │ NPN (S8050 / 2N2222)
             └──────────|◄──────────────────┘   E ──┴── GND
                     1N4148 (vạch = cathode, phía 5 V)
  GPIO 3.3 V ──[ 1 kΩ ]────────────────────────── B
```
Dòng base ≈ (3.3 V − 0.7 V) / 1 kΩ ≈ 2.6 mA. Diode chỉ cần với buzzer từ tính. Chân 5 V chỉ nối vào mạch buzzer, không bao giờ vào GPIO.
Chân đề xuất: LED → 13, buzzer → 15 trên header MP257F; chọn chân có thể gán cho Cortex-M33 (cấu hình qua device tree/RIF theo wiki ST) — TODO xác minh.

## Đường sync và đo latency
| Đường | Từ → đến | Nối | Dùng cho |
| --- | --- | --- | --- |
| Sync out | GPIO MP257F (chân đề xuất 16) → GPIO input Jetson | Nối tiếp 1 kΩ, GND chung | Đo lệch đồng hồ (R08) |
| Event marker | GPIO output Jetson do event-rx bật khi nhận EVENT → logic analyzer | Trực tiếp | Latency INT1 → event-rx (R07) |

Chân Jetson: chọn chân GPIO trống trên J41 theo pinmux và Jetson.GPIO; xác minh trước khi nối. Cả hai board dùng mức 3.3 V.

## Logic analyzer
| Kênh | Tín hiệu | Dùng cho |
| --- | --- | --- |
| CH0 | SCL / SCK | Giải mã I2C/SPI |
| CH1 | SDA / MOSI | Giải mã I2C/SPI |
| CH2 | SDO / MISO | Giải mã SPI |
| CH3 | CS | Giải mã SPI |
| CH4 | INT1 | Mốc thời gian sự kiện cảm biến |
| CH5 | LED GPIO | Latency detection → LED (R09) |
| CH6 | Sync out MP257F | Lệch đồng hồ (R08) |
| CH7 | Event marker Jetson | Latency INT1 → event-rx (R07) |

GND của logic analyzer nối chung với cả hai board. Tần số lấy mẫu ≥ 10 lần tần số bus: I2C 400 kHz → ≥ 4 MS/s.

## Nguồn
| Board | Nguồn | Ghi chú |
| --- | --- | --- |
| STM32MP257F-DK | USB-C PD 5V/3A | Không cắt nguồn MP257F trong test R11 |
| Jetson Nano | DC barrel 5V/4A + jumper J48 | Relay nằm trên dây 5 V DC giữa adapter và Jetson |

Relay chỉ đóng ngắt phía DC; không tự đấu phía điện lưới. Cắt nguồn khi đang ghi có thể làm hỏng rootfs của Jetson: chuẩn bị sẵn thẻ microSD dự phòng có image đã kiểm tra.

## Mạng lab
LAN riêng, không nối vào mạng khác; chỉ mở các cổng trong bảng.

| Thiết bị | IP | Hostname | Vai trò |
| --- | --- | --- | --- |
| Host PC | 192.168.50.1 | host.lab | CI runner, Wireshark, data sink |
| STM32MP257F-DK | 192.168.50.10 | mp2.lab | Sensor node, NTP client |
| Jetson Nano | 192.168.50.20 | jetson.lab | Gateway, recorder, NTP server |

| Cổng | Giao thức | Dịch vụ |
| --- | --- | --- |
| 22/tcp | SSH | Quản trị, test tự động |
| 123/udp | NTP | chrony, Jetson là server |
| 5000/tcp | Protocol v0, TLS từ 04/2027 | sensor-svc ↔ event-rx |
| 5001/udp | Protocol v0 | Thí nghiệm UDP (R04) |
| 1883/tcp, 8883/tcp | MQTT, MQTT + TLS | Chỉ khi ADR chọn MQTT |
| 8554/tcp | RTSP | Tùy chọn |

## Checklist trước khi cấp nguồn
- [ ] Đối chiếu từng dây với bảng pin map và ảnh chụp
- [ ] Đo 3V3 và GND trên header bằng đồng hồ trước khi nối cảm biến
- [ ] Không có dây 5 V nào chạm GPIO hoặc chân cảm biến
- [ ] GND chung giữa hai board, logic analyzer và USB-UART
- [ ] Ghi lại cấu hình đấu dây trong evidence (ảnh + bảng)
