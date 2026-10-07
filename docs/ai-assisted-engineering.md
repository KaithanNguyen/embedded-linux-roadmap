# AI-assisted engineering
AI viết code và tra cứu nhanh hơn người; kỹ sư chịu trách nhiệm về độ đúng trên phần cứng thật.
Repo này vì vậy đầu tư sâu vào hai thứ: những gì cần để **kiểm chứng** output của AI, và những gì AI **không làm thay được** — đo đạc, debug trên board, quyết định trade-off. Phần còn lại giao cho AI và kiểm nhanh.
Level của các kỹ năng trong file này theo dõi ở [TRACKING.md](../TRACKING.md#ai-assisted-engineering).

## Đầu tư ở đâu
| Mảng | Làm tay đến mức hiểu sâu | Dùng AI, kiểm chứng kỹ | Giao AI, kiểm nhanh |
| --- | --- | --- | --- |
| C/C++ | Lifetime, UB, integer promotion, concurrency, memory ordering | Xử lý lỗi, codec, cấu trúc dữ liệu | CLI, format log, boilerplate class |
| Kiến trúc Arm | Exception level, cache, barrier, đường đi ngắt | Giải thích lệnh assembly lạ | Tóm tắt tài liệu dài |
| Kernel và BSP | Boot chain, device tree theo binding, context IRQ và locking, DMA và cache | Khung driver, `regmap_config` | Makefile kbuild, comment |
| Phần cứng | Đọc schematic và datasheet, đo đạc, đấu dây | Bảng register từ datasheet | Tính toán linh kiện (luôn mở tài liệu gốc) |
| Hệ thống | Latency, độ bền dữ liệu, chọn IPC theo số đo | Event loop, script test | Vẽ đồ thị, phân tích CSV |
| Mạng và video | Đọc capture, giải thích latency | Socket code, pipeline GStreamer | Parser cấu hình |
| Thuật toán | 60 bài pattern cốt lõi, làm lại được không gợi ý | — | Bài ngoài danh sách: chỉ đọc để biết pattern |
| Giao tiếp | Nội dung kỹ thuật, câu chuyện debug, nói tiếng Anh | Sửa câu chữ tiếng Anh | Định dạng tài liệu |

Đã cắt khỏi kế hoạch vì AI làm tốt hoặc giá trị thấp: học thuộc lệnh shell, viết tay Makefile/CMake boilerplate, luyện số lượng lớn bài thuật toán ngoài các pattern cốt lõi, tách riêng các chủ đề cú pháp C++ (template, OOP).

## Quy trình 5 bước
1. Viết spec + acceptance criteria trước khi hỏi AI.
2. Để AI viết bản nháp; cung cấp đúng đoạn datasheet và version phần mềm đang dùng.
3. Review theo checklist bên dưới.
4. Chạy test: normal/boundary/error, sanitizer, rồi chạy trên board thật.
5. Ghi lỗi của AI vào [AI error log](ai-error-log.md); mỗi tháng rút ra một khuôn mẫu.

## Checklist review code AI sinh cho embedded
- [ ] Register: địa chỉ, độ rộng truy cập, bit field, giá trị reset khớp datasheet (ghi trang và revision)
- [ ] Đơn vị và hệ số (mg, mdps, µs, Hz) đúng
- [ ] Endianness, alignment, packing của dữ liệu nhị phân
- [ ] Ownership và lifetime; giải phóng tài nguyên ở mọi nhánh lỗi
- [ ] Context thực thi: không sleep trong atomic context; khóa đúng; memory ordering đủ
- [ ] Timing: timeout, retry, tràn bộ đếm thời gian
- [ ] Lỗi phần cứng: NACK, timeout bus, thiết bị biến mất giữa chừng
- [ ] API và option có thật trong version đang dùng (kernel, GStreamer, JetPack, OpenSTLinux)
- [ ] Test chạy trên board, không chỉ biên dịch được

## Cách luyện
- Mini project 90 phút cùng AI mỗi tháng ([livecoding](../livecoding/README.md#mini-project-90-phút-cùng-ai--mỗi-tháng)).
- Debug drill: nhờ AI cài một bug ẩn vào code đang chạy tốt, rồi tự tìm không dùng AI ([debug drills](../debug-drills/README.md)).
- Lab [register-level programming](../hardware/register-programming/README.md): đối chiếu bảng register do AI sinh với datasheet.
- Mỗi pull request ghi rõ phần nào AI viết và đã kiểm chứng bằng cách nào.
