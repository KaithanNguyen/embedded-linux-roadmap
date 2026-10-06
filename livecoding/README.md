# Live coding
Luyện phỏng vấn Embedded C/C++: giải bài trong timebox, nói to suy nghĩ, tự viết test, không AI và không search.
Khác với [C/C++ foundation](../c-cpp-foundation/README.md) (hiểu sâu bằng thí nghiệm), phần này luyện khả năng lấy lại kiến thức nhanh và giao tiếp dưới áp lực thời gian.

## Quy trình một session — 45 phút
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

Nhịp đề xuất: từ 11/2026 một session mỗi tuần; từ 04/2027 hai đến ba session mỗi tuần, cộng một buổi mock có người hỏi.

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
| Communication | Im lặng | Giải thích khi được hỏi | Nói to, nêu trade-off |
| Time | > 60 phút | 45–60 phút | ≤ 45 phút |

## Problem bank
Đề chi tiết (signature, câu hỏi làm rõ, test bắt buộc, follow-up) ở [problems.md](problems.md).

| ID | Bài | Focus | Level | Attempts | Best | Status |
| --- | --- | --- | --- | --- | --- | --- |
| LC01 | Bit operations & register field | Bitwise, mask/shift | Easy | 0 | — | Not started |
| LC02 | Popcount, power of 2, reverse bits | Bitwise | Easy | 0 | — | Not started |
| LC03 | Endianness & serialization | Byte order, alignment | Easy | 0 | — | Not started |
| LC04 | memmove | Pointer, overlap | Easy | 0 | — | Not started |
| LC05 | Parse integer an toàn | String, overflow | Medium | 0 | — | Not started |
| LC06 | Ring buffer FIFO | Data structure, no heap | Medium | 0 | — | Not started |
| LC07 | Singly linked list | Pointer | Medium | 0 | — | Not started |
| LC08 | Intrusive list + container_of | Kernel idiom | Medium | 0 | — | Not started |
| LC09 | Frame parser state machine | Protocol, state machine | Medium | 0 | — | Not started |
| LC10 | CRC-8 | Checksum, bitwise | Medium | 0 | — | Not started |
| LC11 | Fixed-block memory pool | Memory, alignment | Medium | 0 | — | Not started |
| LC12 | Button debounce | Time, state machine | Medium | 0 | — | Not started |
| LC13 | Moving average fixed-point | Integer math, overflow | Medium | 0 | — | Not started |
| LC14 | Thread-safe bounded queue | pthread, condvar | Hard | 0 | — | Not started |
| LC15 | SPSC lock-free ring buffer | C11 atomics | Hard | 0 | — | Not started |
| LC16 | Software timers | Callback, time wrap | Hard | 0 | — | Not started |
| LC17 | C++ UniquePtr | RAII, move | Medium | 0 | — | Not started |
| LC18 | C++ String rule of 5 | Copy/move | Medium | 0 | — | Not started |
| LC19 | C++ LRU cache | STL, complexity | Medium | 0 | — | Not started |
| LC20 | Linux `tail -n` bằng syscall | read/lseek, error handling | Medium | 0 | — | Not started |

## Attempt log
| Ngày | Problem | Thời gian | Điểm | Có gợi ý? | Session |
| --- | --- | --- | --- | --- | --- |
| Chưa có | — | — | — | — | — |
