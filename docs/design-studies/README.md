# Design studies
Bài tập thiết kế hệ thống nhúng: viết bản nháp trong 45 phút, sau đó hoàn thiện thành design doc 1–2 trang trong tuần.
Mục tiêu: luyện làm rõ yêu cầu, ước lượng bằng số, chọn trade-off và lường trước failure mode. Level của từng đề theo dõi ở [TRACKING.md](../../TRACKING.md#design--communication).

## Quy trình bản nháp — 45 phút
1. 10 phút — Yêu cầu và giả định: chức năng, ràng buộc (pin, bộ nhớ, băng thông, chi phí), câu hỏi cần làm rõ.
2. 10 phút — Ước lượng bằng số: bitrate × thời gian = dung lượng; dòng tiêu thụ × thời gian = dung lượng pin; số thiết bị × dữ liệu = tải phía server.
3. 15 phút — Kiến trúc và luồng dữ liệu: các khối, interface, nơi lưu, trạng thái.
4. 10 phút — Failure mode và trade-off: mất điện, mất mạng, đầy bộ nhớ, update lỗi, đồng hồ lệch; phương án bị loại và lý do.

Sau buổi nháp: viết `DSxx-<slug>.md` trong folder này và link vào cột Evidence của TRACKING.md.

## Checklist tự review
- [ ] Yêu cầu có số đo được, không chỉ "nhanh" hay "bền"
- [ ] Có ước lượng bằng số, đúng đơn vị
- [ ] Sơ đồ khối và luồng dữ liệu
- [ ] Failure mode chính, cách phát hiện và phục hồi
- [ ] Bảo mật và quyền riêng tư của dữ liệu
- [ ] Cập nhật phần mềm và rollback
- [ ] Quan sát được: log, metric, cảnh báo
- [ ] Test plan: thí nghiệm nào chứng minh thiết kế đúng
- [ ] Trade-off: phương án bị loại và lý do

## Đề
| ID | Đề | Ràng buộc chính | Dự kiến | Design doc |
| --- | --- | --- | --- | --- |
| DS01 | Thiết bị camera chạy pin: ghi liên tục, buffer trước sự kiện, tải lên khi cắm dock | Pin đủ 12 giờ, storage giới hạn, mất điện bất ngờ, thời gian từ sự kiện đến bắt đầu lưu | 05/2027 | — |
| DS02 | OTA cho 100.000 thiết bị | Rollout theo đợt, rollback, thiết bị offline lâu ngày, băng thông, image được ký | 06/2027 | — |
| DS03 | Logging & telemetry khi mạng chập chờn | Lưu tạm có giới hạn, nén, gửi lại theo thứ tự, không làm đầy bộ nhớ | 04/2027 | — |
| DS04 | Đồng bộ thời gian và sự kiện giữa nhiều thiết bị camera | Nguồn thời gian, sai số cho phép, thiết bị mất kết nối, gắn sự kiện giữa các thiết bị | 05/2027 | — |
