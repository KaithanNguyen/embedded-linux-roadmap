# Process & signals
Status: Not started
## Learning goals
fork/exec/wait, exit status, zombie/orphan, process group/session, signal (mask, handler, async-signal-safe, signalfd)

## Recall — 10 phút
Không dùng AI: Zombie sinh ra khi nào và dọn thế nào? Hàm nào an toàn trong signal handler? exec giữ lại những gì của process?

## Experiment — 20 phút/buổi
Mini shell bằng C: chạy lệnh bằng fork/exec/wait, hỗ trợ pipe `a | b` và redirect `>`, xử lý Ctrl-C mà không giết shell.

## Cases cần kiểm tra
Lệnh không tồn tại (exit 127); lệnh bị signal giết; pipe hai lệnh; Ctrl-C khi lệnh đang chạy; không rò fd (`ls /proc/<pid>/fd`).

## Required artifacts
src/minishell.c + test script; strace excerpt của fork/exec; valgrind sạch.
Ghi kết quả tại [REPORT.md](REPORT.md); đường dẫn code/evidence phải trỏ đến file thật khi hoàn thành.

## Deep dive (pro)
Làm ít nhất một bài để đạt L3; làm đủ ba bài trước khi coi topic là thế mạnh.
1. Job control: process group, foreground/background (`tcsetpgrp`), SIGTSTP/SIGCONT.
2. Thay signal handler bằng signalfd trong vòng lặp epoll.
3. `posix_spawn` so với fork/exec: đo thời gian tạo process trên board RAM nhỏ.

## Làm tay vs dùng AI
- Làm tay để hiểu: Vòng đời process và signal — nguồn của nhiều bug khó tái hiện.
- Dùng AI rồi kiểm chứng: Parser dòng lệnh của shell; kiểm bằng test.

## Build guidance
Dùng `-std=c11 -Wall -Wextra -Wpedantic -g`; chạy trên host Linux/WSL và trên board aarch64; ghi kernel, libc, compiler.
Có thể thêm `-fsanitize=address,undefined -fno-omit-frame-pointer` khi toolchain hỗ trợ; ghi rõ nếu không có.
Thí nghiệm có thể làm treo hệ thống (OOM, cắt nguồn, SCHED_FIFO) chỉ chạy trên board hoặc máy ảo, có giới hạn bằng ulimit/cgroup.

## Socratic review — 10 phút
- Dự đoán ban đầu sai ở đâu? Dẫn chứng?
- Kết quả có phụ thuộc kernel, libc, tải hệ thống hoặc host so với board không?
- Áp dụng vào driver/application Linux ở tình huống nào?
- Tôi có thể viết lại và giải thích mà không nhìn đáp án không?

## Conclusions — 5 phút
3 kết luận + 1 câu hỏi còn mở; cập nhật [learning log](../../LEARNING_LOG.md).

## Definition of Done
- [ ] Có source và lệnh build/run.
- [ ] Có expected vs actual cho case liên quan.
- [ ] Có evidence (log, số đo, trace) và phân tích giới hạn.
- [ ] Tự giải thích topic bằng tiếng Việt và 5 câu tiếng Anh.
- [ ] L3: làm lại sau ≥ 7 ngày không ghi chú, không AI, và hoàn thành ít nhất một bài Deep dive.
