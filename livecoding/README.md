# Live coding
Luyện code có timebox cho các bài đặc trưng của Embedded C/C++: giải bài trong thời gian giới hạn, nói to cách nghĩ, tự viết test, không AI và không search.
Khác với [C/C++ foundation](../c-cpp-foundation/README.md) (hiểu sâu bằng thí nghiệm) và [LeetCode](../leetcode/README.md) (thuật toán tổng quát), phần này luyện các bài gần với driver và firmware: bit, buffer, protocol, bộ nhớ, đồng thời.

Nhịp: 1 session timebox mỗi tuần (có thể thay cho một bài LeetCode); 1 mini project 90 phút cùng AI mỗi tháng.

## Session timebox — 45 phút
1. 5 phút — Làm rõ đề: input/output, contract (null, size 0, overflow), ràng buộc (có được dùng heap? gọi từ ISR?). Ghi câu hỏi và giả định.
2. 5 phút — Nêu approach, complexity và test cases trước khi code.
3. 20 phút — Code trong editor không có AI completion; nói to khi code.
4. 10 phút — Build với `-Wall -Wextra -fsanitize=address,undefined`, chạy test, sửa lỗi.
5. 5 phút — Tự chấm theo rubric; ghi session bằng [template](../templates/livecoding-session.md).

Quy tắc:
- Không xem lời giải trước khi có attempt được ghi lại.
- Bí quá 10 phút: ghi chỗ bí, rồi mới xem gợi ý. Đánh dấu attempt là "có gợi ý".
- Giữ nguyên code viết trong timebox; bản sửa sau timebox để file riêng (`fixed.c`) để so sánh trung thực.
- Làm lại cùng bài sau 1 ngày, 1 tuần, 1 tháng; chỉ tính Done khi lần làm lại đạt ≥ 11/14 không có gợi ý.

## Mini project 90 phút cùng AI — mỗi tháng
Luyện dùng AI có kiểm chứng: AI viết bản nháp, mình chịu trách nhiệm về độ đúng.
1. 15 phút — Tự ra đề: spec + acceptance criteria trước khi mở AI (ví dụ: daemon đọc IIO và ghi CSV có xoay vòng file).
2. 30 phút — Để AI sinh bản nháp; đọc hiểu từng phần trước khi chạy.
3. 30 phút — Đối chiếu register/bit với datasheet; kiểm tra timing, ownership bộ nhớ, error path; chạy test (trên board nếu liên quan phần cứng).
4. 15 phút — Review từng dòng; ghi lỗi của AI vào [AI error log](../docs/ai-error-log.md).

Lưu tại `attempts/YYYY-MM-DD_MPxx/`: spec, code, test, ghi chú review.

## Lưu attempt
Folder `attempts/YYYY-MM-DD_LCxx/`: `session.md` (copy từ template), source, test. Không commit lời giải lấy từ nguồn khác.

## Rubric — mỗi tiêu chí 0–2, tối đa 14
| Tiêu chí | 0 | 1 | 2 |
| --- | --- | --- | --- |
| Làm rõ yêu cầu | Code ngay | Hỏi vài điểm | Chốt contract + edge cases trước khi code |
| Correctness | Sai case thường | Đúng case thường, sai biên | Đúng mọi test; tự tìm ra bug |
| Code quality | Khó đọc | Đọc được | Tên rõ, hàm nhỏ, const đúng chỗ, không magic number |
| Embedded awareness | Bỏ qua | Có nhắc đến | Xử lý đúng: heap, alignment, endianness, ISR/concurrency, volatile |
| Testing | Không test | Chỉ test case thường | Tự viết normal/boundary/error |
| Communication | Im lặng | Giải thích khi được yêu cầu | Nói to, nêu trade-off |
| Time | > 60 phút | 45–60 phút | ≤ 45 phút |

## Problem bank
Đề chi tiết (signature, câu hỏi làm rõ, test bắt buộc, câu hỏi mở rộng) ở [problems.md](problems.md).
Đã bỏ 5 bài trùng với LeetCode (đếm bit, linked list, atoi, LRU cache) hoặc với lab Modern C++ (String rule of 5).

| ID | Bài | Focus | Level | Attempts | Best | Status |
| --- | --- | --- | --- | --- | --- | --- |
| LC01 | Bit operations & register field | Bitwise, mask/shift | Easy | 0 | — | Not started |
| LC02 | Endianness & serialization | Byte order, alignment | Easy | 0 | — | Not started |
| LC03 | memmove | Pointer, overlap | Easy | 0 | — | Not started |
| LC04 | Ring buffer FIFO | Data structure, no heap | Medium | 0 | — | Not started |
| LC05 | Intrusive list + container_of | Kernel idiom | Medium | 0 | — | Not started |
| LC06 | Frame parser state machine | Protocol, state machine | Medium | 0 | — | Not started |
| LC07 | CRC-8 | Checksum, bitwise | Medium | 0 | — | Not started |
| LC08 | Fixed-block memory pool | Memory, alignment | Medium | 0 | — | Not started |
| LC09 | Button debounce | Time, state machine | Medium | 0 | — | Not started |
| LC10 | Moving average fixed-point | Integer math, overflow | Medium | 0 | — | Not started |
| LC11 | Thread-safe bounded queue | pthread, condvar | Hard | 0 | — | Not started |
| LC12 | SPSC lock-free ring buffer | C11 atomics | Hard | 0 | — | Not started |
| LC13 | Software timers | Callback, time wrap | Hard | 0 | — | Not started |
| LC14 | C++ UniquePtr | RAII, move | Medium | 0 | — | Not started |
| LC15 | Linux `tail -n` bằng syscall | read/lseek, error handling | Medium | 0 | — | Not started |

## Attempt log
| Ngày | Problem / mini project | Thời gian | Điểm | Có gợi ý? | Session |
| --- | --- | --- | --- | --- | --- |
| Chưa có | — | — | — | — | — |
