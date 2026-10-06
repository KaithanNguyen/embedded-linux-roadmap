# Roadmap và output
Mục tiêu: xây năng lực Embedded Linux bằng sản phẩm có thể tái hiện, phục vụ ứng tuyển từ nay đến 06/2027.
Đây là khung triển khai của repo; điều chỉnh thời gian theo evidence thực tế.

| Giai đoạn dự kiến | Trọng tâm | Đầu ra cần có | Gate trước khi chuyển |
| --- | --- | --- | --- |
| 10/2026 | Linux workstation, shell, Git, C fundamentals | System report, bài filesystem/process/permission, 1 debug report | Tự tái hiện từ README |
| 11–12/2026 | C/C++, build, GDB, Linux user space | Chương trình đọc dữ liệu, xử lý lỗi, test biên; phân tích memory | Giải thích ownership, errno và build/link |
| 01–02/2027 | Board boot, cross compile, device tree, peripheral | Boot log STM32MP257F-DK + Jetson Nano, app cross compile, lab giao tiếp có evidence | Từ source đến chạy trên board |
| 03–04/2027 | Build system, service, reliability | Image/config tái hiện, service, restart/failure tests | Clean build và phục hồi lỗi có log |
| 05/2027 | Project tích hợp, đo đạc, hardening | Demo, architecture, test matrix, bottleneck analysis | Người khác làm theo được |
| 06/2027 | Portfolio và interview | 2 project narratives, mock [live coding](livecoding/README.md), debugging walkthrough | Nói rõ trade-off và tự sửa lỗi |

Board lab: STM32MP257F-DK và Jetson Nano — xem [hardware](hardware/README.md); ghi model/revision/image cụ thể trong từng lab.
Project tích hợp: [STM32MP257F-DK + Jetson Nano](projects/stm32mp257f-dk_jetson-nano/README.md), milestone M0–M5 bám theo các giai đoạn trên.
Ưu tiên Linux fundamentals trước; chỉ thêm tính năng board/AI khi hỗ trợ mục tiêu của project.

## Actual output theo chu kỳ
| Chu kỳ | Output tối thiểu | Nơi ghi |
| --- | --- | --- |
| Ngày | 1 thí nghiệm nhỏ + 1 kết luận có evidence | LEARNING_LOG + lab report |
| Tuần | 1 sprint review, 1 lỗi đã điều tra hoặc câu hỏi còn mở | sprints |
| Tháng | 1 demo tái hiện được + gap review | templates/monthly-review.md |
| Quý | Đánh giá năng lực + chọn scope quý tới | templates/quarterly-review.md |

## Theo dõi gate
| Gate | Ngày đánh giá | Evidence/commit | Gap | Hành động tiếp theo |
| --- | --- | --- | --- | --- |
| TODO | TODO | Chưa có | Chưa đánh giá | TODO |
