# Sprint 01 — Linux workstation
Period: 2026-10-05 → 2026-10-11
Status: Planned — điền tiến độ thật khi thực hành.

## Goal
Sử dụng Linux workstation để chạy lab, thu evidence và quản lý bằng Git.

## Definition of Done
- [ ] Ghi môi trường Linux native/VM/WSL và giới hạn truy cập thiết bị.
- [ ] Hoàn thành 5 bài trong [exercises](exercises/README.md).
- [ ] Chạy [system_report.sh](scripts/system_report.sh), đọc và giải thích output.
- [ ] Điền [microSD debug report](debug/microsd-debug-01.md) bằng evidence thật; nếu không có lỗi, ghi kết quả kiểm tra.
- [ ] [Cheat sheet](../../docs/linux-cheatsheet.md) ghi các lệnh đã dùng thật trong tuần, mỗi lệnh có output thật và giải thích được (không đặt chỉ tiêu số lượng).
- [ ] Repo học có README và [log tháng](../../log/2026-10.md) ghi mỗi ngày.
- [ ] Có commit và review tuần ([weekly review](../../templates/weekly-review.md)).

## Topics and actual output
| Topic | Artifact dự kiến | Actual output | Status |
| --- | --- | --- | --- |
| Host environment | Báo cáo OS/kernel/tools | Chưa có | Not run |
| Filesystem + permissions | exercises/filesystem.md | Chưa có | Not run |
| Process + logs | exercises/process.md | Chưa có | Not run |
| Git workflow | exercises/git.md + commit | Chưa có | Not run |
| Storage inspection | debug/microsd-debug-01.md | Chưa có | Not run |

## Run from repo root
```bash
bash sprints/2026-10-05_linux-workstation/scripts/system_report.sh
```
Sau khi đọc output, lưu bản đã rà soát vào evidence. Xem [script guide](scripts/README.md).

## Problems
Link debug report, blocker và điều kiện tái hiện:
TODO

## Lessons
3 kết luận có evidence:
TODO

## Next sprint
12–18/10: mini shell bằng C với fork, exec, wait; có test; valgrind không rò bộ nhớ. Xem [kế hoạch tuần](../README.md#q42026).
