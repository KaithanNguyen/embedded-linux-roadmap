# Exception levels & boot
Status: Not started
## Learning goals
EL0–EL3, Secure/Non-secure (TrustZone), SMC/HVC, PSCI, vai trò TF-A/OP-TEE/U-Boot/kernel theo exception level

## Recall — 10 phút
Không dùng AI: Mỗi stage boot của MP257F chạy ở EL nào và ở world nào? PSCI dùng để làm gì? Vì sao Linux không truy cập trực tiếp tài nguyên Secure?

## Experiment — 20 phút/buổi
Từ boot log và source TF-A/U-Boot/kernel, lập bảng: stage → EL → Secure/Non-secure → nhiệm vụ; xác nhận EL lúc kernel khởi động bằng dòng `CPU: All CPU(s) started at EL..` trong dmesg.

## Cases cần kiểm tra
Tắt/bật CPU1 qua `/sys/devices/system/cpu/cpu1/online` và giải thích lời gọi PSCI; reboot và poweroff đi qua đâu.

## Required artifacts
Bảng EL; boot log có chú thích; sơ đồ đường đi của một lời gọi SMC.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Build TF-A với log debug để thấy PSCI CPU_ON/CPU_OFF khi hotplug CPU.
2. OP-TEE: chạy một trusted application mẫu và giải thích đường đi Normal world → Secure world.
3. Đọc thanh ghi hệ thống (CurrentEL, MIDR_EL1) trong kernel module; giải thích vì sao user space không đọc trực tiếp được.

## Làm tay vs dùng AI
- Làm tay để hiểu: Mô hình EL và TrustZone — nền để hiểu secure boot và debug boot.
- Dùng AI rồi kiểm chứng: Tóm tắt tài liệu dài; luôn đối chiếu với boot log thật.

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
