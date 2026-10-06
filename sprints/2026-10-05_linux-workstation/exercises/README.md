# Linux workstation exercises
Mỗi bài: dự đoán → chạy → ghi output → giải thích. Dùng [lab template](../../../templates/lab-report.md).
Các tên file dưới đây là output bạn sẽ tạo sau khi làm, chưa phải kết quả sẵn có.

| ID | Bài thực hành | Tiêu chí / artifact |
| --- | --- | --- |
| L01 | Chạy system report; xác định OS, kernel, kiến trúc và compiler | environment.md; giải thích host khác target thế nào |
| L02 | Trong folder lab: tạo file, copy, tìm, xem quyền; thay quyền trên file tự tạo | filesystem.md; lệnh + output trước/sau |
| L03 | Tạo process sleep, tìm PID, gửi TERM đúng PID; ghi exit status | process.md; giải thích PID, signal, foreground/background |
| L04 | Sửa 1 note, xem git status/diff, add đúng file, commit và xem git log | git.md; commit SHA + giải thích working tree/index/commit |
| L05 | Quan sát storage bằng lsblk, lsblk -f, df -h; thu dmesg nếu có quyền | storage.md hoặc debug report; phân biệt disk/partition/filesystem/mount |

## Cách làm L03
```bash
sleep 120 &
lab_pid=$!
ps -p "$lab_pid" -o pid,comm,stat
kill -TERM "$lab_pid"
wait "$lab_pid"
printf 'wait exit status: %s\n' "$?"
```
Chạy trong terminal lab riêng. Ghi nhận process có thể đã thoát trước khi gửi signal.

## Report từng bài
- Goal / environment / expected:
- Commands:
- Actual output / evidence:
- Vì sao kết quả như vậy:
- Liên hệ embedded:
- Status / next step:
