# Interrupt controllers: GIC & NVIC
Status: Not started
## Learning goals
GIC (distributor, CPU interface/redistributor, SPI/PPI/SGI, priority, affinity), NVIC (priority, preemption, tail-chaining), đường đi ngắt từ chân GPIO tới handler

## Recall — 10 phút
Không dùng AI: SPI, PPI, SGI khác nhau thế nào? Interrupt affinity là gì? Trên Cortex-M, priority grouping ảnh hưởng preemption ra sao?

## Experiment — 20 phút/buổi
Lần theo ngắt INT1 của LSM6DSOX: chân GPIO → bộ điều khiển ngắt GPIO → GIC → handler; đọc `/proc/interrupts`, đổi affinity bằng `/proc/irq/<n>/smp_affinity` và quan sát.

## Cases cần kiểm tra
Ngắt chạy trên CPU0 và CPU1; có tải (stress-ng) và không tải; số ngắt khớp ODR.

## Required artifacts
Sơ đồ đường đi ngắt (trích device tree); /proc/interrupts trước/sau; số đo latency (liên kết HW06).
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Đo latency ngắt → threaded handler → user space với kernel thường và PREEMPT_RT (linux-system/realtime-latency).
2. Trên M33 (08/2027, phần mở rộng): cấu hình priority NVIC cho hai ngắt lồng nhau, đo preemption bằng GPIO.
3. Đọc phần GIC trong device tree của STM32MP25: `interrupt-controller`, `#interrupt-cells`, cách mô tả một ngắt.

## Làm tay vs dùng AI
- Làm tay để hiểu: Đường đi ngắt và nguồn gây latency.
- Dùng AI rồi kiểm chứng: Script thu /proc/interrupts theo thời gian.

## Build guidance
Biên dịch cho aarch64 (Cortex-A35, Cortex-A57) và Armv8-M (`-mcpu=cortex-m33 -mthumb`); ghi compiler, flags và lõi chạy thử.
Trích tài liệu kèm phiên bản: Arm Architecture Reference Manual, TRM của lõi, AAPCS64.
Đo trên một core cố định (`taskset`), lặp lại ít nhất 3 lần; ghi tần số CPU và cpufreq governor.

## Socratic review — 10 phút
- Dự đoán ban đầu sai ở đâu? Dẫn chứng?
- Kết quả có phụ thuộc lõi CPU (A35, A57, M33), cấu hình cache/MMU hoặc compiler không?
- Áp dụng vào driver/application Linux ở tình huống nào?
- Tôi có thể viết lại và giải thích mà không nhìn đáp án không?

## Conclusions — 5 phút
3 kết luận + 1 câu hỏi còn mở; cập nhật [learning log](../../LEARNING_LOG.md).

## Definition of Done
- [ ] Có source, lệnh build/run và lõi CPU đã chạy.
- [ ] Có expected vs actual cho case liên quan.
- [ ] Có evidence (số đo, disassembly, log) và trích tài liệu kèm phiên bản.
- [ ] Tự giải thích topic bằng tiếng Việt và 5 câu tiếng Anh.
- [ ] L3: làm lại sau ≥ 7 ngày không ghi chú, không AI, và hoàn thành ít nhất một bài Deep dive.
