# System report scripts
- [system_report.sh](system_report.sh): Bash trên Linux native, VM, WSL hoặc board có Bash.
- [system_report.ps1](system_report.ps1): báo cáo host Windows, không thay thế báo cáo Linux.

Script chỉ đọc trạng thái, ghi ra stdout; không cài package, format hay thay config.
Lệnh thiếu/bị từ chối quyền được ghi WARN, tiếp tục các phần khác.
Exit 0 nghĩa là hoàn thành thu thập best effort, không chứng minh mọi probe thành công.

Chạy từ repo root:
```bash
bash sprints/2026-10-05_linux-workstation/scripts/system_report.sh
```

PowerShell Windows:
```powershell
& .\sprints\2026-10-05_linux-workstation\scripts\system_report.ps1
```

Đọc output trước khi lưu/commit: thông tin máy, mountpoint, username hoặc device ID có thể xuất hiện.
Không chạy sudo chỉ để làm báo cáo trông đầy đủ. Ghi rõ probe không chạy được.
