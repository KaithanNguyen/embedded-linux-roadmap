# Live coding problems
Chỉ có đề, không có lời giải. Tự chọn contract khi đề để ngỏ, và ghi lựa chọn đó vào session.
Mặc định C11 (LC17–LC19: C++17); không dùng thư viện ngoài libc/STL.

## LC01 — Bit operations & register field
- Signature: `uint32_t field_get(uint32_t reg, unsigned shift, unsigned width);` và `uint32_t field_set(uint32_t reg, unsigned shift, unsigned width, uint32_t value);`
- Làm rõ: width = 0 hoặc 32? shift + width > 32? value lớn hơn độ rộng field?
- Test bắt buộc: field ở bit 0, field chạm bit 31, width = 32, value tràn field.
- Mở rộng: Vì sao `1u << 31` chứ không phải `1 << 31`? Read-modify-write trên register thật gặp vấn đề gì khi interrupt chen vào giữa?

## LC02 — Popcount, power of 2, reverse bits
- Signature: `unsigned popcount32(uint32_t x);`, `bool is_pow2(uint32_t x);`, `uint32_t reverse_bits(uint32_t x);`
- Làm rõ: `is_pow2(0)` trả gì?
- Test bắt buộc: 0, 1, 0x80000000, 0xFFFFFFFF.
- Mở rộng: `x & (x - 1)` làm gì? Lookup table đổi bộ nhớ lấy gì? Khi nào dùng `__builtin_popcount`?

## LC03 — Endianness & serialization
- Signature: `void put_be32(uint8_t *buf, uint32_t v);`, `uint32_t get_be32(const uint8_t *buf);`, `bool is_little_endian(void);`
- Làm rõ: buf có thể không aligned?
- Test bắt buộc: 0x12345678 → `12 34 56 78`; buf lệch alignment (`buf + 1`); round-trip.
- Mở rộng: Vì sao `*(uint32_t *)buf` nguy hiểm (alignment, strict aliasing)? `htonl` khác gì?

## LC04 — memmove
- Signature: `void *my_memmove(void *dst, const void *src, size_t n);`
- Làm rõ: n = 0? dst == src?
- Test bắt buộc: không overlap; overlap với dst < src; overlap với dst > src; n = 0.
- Mở rộng: Vì sao memcpy với vùng overlap là UB? Copy theo word để nhanh hơn thì phải chú ý gì?

## LC05 — Parse integer an toàn
- Signature: `int parse_i32(const char *s, int32_t *out);` trả 0 khi thành công, mã lỗi khi thất bại.
- Làm rõ: khoảng trắng đầu/cuối, dấu `+`/`-`, chuỗi rỗng, ký tự thừa phía sau.
- Test bắt buộc: `"0"`, `"-2147483648"`, `"2147483647"`, `"2147483648"`, `"12a"`, `""`, `"-"`.
- Mở rộng: Phát hiện overflow trước khi nhân 10 thế nào? Vì sao không dùng `atoi`?

## LC06 — Ring buffer FIFO
- Signature: `void rb_init(rb_t *rb, uint8_t *storage, size_t cap);`, `bool rb_push(rb_t *rb, uint8_t b);`, `bool rb_pop(rb_t *rb, uint8_t *out);`
- Làm rõ: đầy thì từ chối hay ghi đè? cap có bắt buộc là lũy thừa của 2?
- Test bắt buộc: pop khi rỗng, push khi đầy, wrap-around, cap = 1.
- Mở rộng: Phân biệt full/empty bằng count hay bỏ trống 1 slot? Dùng giữa ISR và main loop cần gì?

## LC07 — Singly linked list
- Signature: `struct node *list_reverse(struct node *head);`, `bool list_has_cycle(const struct node *head);`, `struct node *list_remove(struct node *head, int val);`
- Làm rõ: ai free node bị xóa? Xóa node đầu tiên khớp hay tất cả?
- Test bắt buộc: list rỗng, 1 node, xóa head, xóa tail, cycle.
- Mở rộng: Thuật toán Floyd; dùng pointer-to-pointer để xóa mà không cần xử lý riêng head.

## LC08 — Intrusive list + container_of
- Tự định nghĩa `struct list_head`, macro `container_of`; implement add/del/for-each cho `struct sensor_event` có chứa `struct list_head`.
- Làm rõ: list vòng có sentinel head?
- Test bắt buộc: thêm 3 phần tử, xóa phần tử giữa, duyệt list rỗng.
- Mở rộng: Vì sao Linux kernel dùng intrusive list? `offsetof` hoạt động thế nào?

## LC09 — Frame parser state machine
- Frame: `0xAA | len (1 byte) | payload (len byte) | checksum (XOR của len và payload)`.
- Signature: `void parser_feed(parser_t *p, uint8_t byte);` gọi callback khi nhận đủ một frame hợp lệ.
- Làm rõ: len tối đa? Gặp 0xAA trong payload? Checksum sai thì resync thế nào?
- Test bắt buộc: frame đúng, hai frame liền nhau, checksum sai, byte rác trước 0xAA, len = 0, len > max.
- Mở rộng: Gọi từ UART ISR từng byte thì cần đổi gì? Byte stuffing/COBS giải quyết vấn đề gì?

## LC10 — CRC-8
- Signature: `uint8_t crc8(const uint8_t *data, size_t len);` với poly 0x07, init 0x00, không reflect, không xorout.
- Làm rõ: tham số CRC (poly, init, reflect, xorout) do ai quy định?
- Test bắt buộc: chuỗi rỗng; `"123456789"` → 0xF4; 1 byte.
- Mở rộng: Bản table-driven đổi bộ nhớ lấy tốc độ thế nào? CRC phát hiện lỗi gì mà tổng cộng byte bỏ sót?

## LC11 — Fixed-block memory pool
- Signature: `void pool_init(pool_t *p, void *mem, size_t block_size, size_t nblocks);`, `void *pool_alloc(pool_t *p);`, `void pool_free(pool_t *p, void *blk);`
- Làm rõ: alignment của block? free pointer không thuộc pool hoặc double free?
- Test bắt buộc: cấp hết block, alloc khi hết → NULL, free rồi alloc lại, block_size < `sizeof(void *)`.
- Mở rộng: Free list nhúng trong block; vì sao embedded tránh malloc lúc runtime; thread safety.

## LC12 — Button debounce
- Signature: `bool debounce_update(debounce_t *d, bool raw, uint32_t now_ms);` trả trạng thái ổn định; chỉ đổi khi raw giữ nguyên ≥ 20 ms.
- Làm rõ: được gọi theo tick đều hay thời điểm bất kỳ?
- Test bắt buộc: nhiễu ngắn < 20 ms, nhấn ổn định, `now_ms` wrap qua 0xFFFFFFFF.
- Mở rộng: Vì sao `now - last >= T` với unsigned vẫn đúng khi wrap? Interrupt + timer so với polling?

## LC13 — Moving average fixed-point
- Signature: `int16_t ma_update(ma_t *m, int16_t sample);` trả trung bình 8 mẫu gần nhất, không dùng float.
- Làm rõ: trước khi đủ 8 mẫu trả gì? Làm tròn thế nào?
- Test bắt buộc: chuỗi hằng số, bước nhảy, giá trị âm, INT16_MIN/INT16_MAX liên tiếp.
- Mở rộng: Accumulator cần bao nhiêu bit? Chia cho lũy thừa 2 bằng shift với số âm có đúng không?

## LC14 — Thread-safe bounded queue
- Signature: `int bq_push(bq_t *q, int v);`, `int bq_pop(bq_t *q, int *out);`, `void bq_close(bq_t *q);` — blocking, dùng pthread mutex + condvar.
- Làm rõ: sau close, push/pop trả gì? Có cần timeout?
- Test bắt buộc: 1 producer/1 consumer; nhiều producer; close khi consumer đang chờ; chạy ThreadSanitizer.
- Mở rộng: Spurious wakeup; signal hay broadcast; tránh deadlock khi close.

## LC15 — SPSC lock-free ring buffer
- Như LC06 nhưng đúng 1 producer thread và 1 consumer thread, dùng `<stdatomic.h>`, không mutex.
- Làm rõ: bảo đảm chỉ có 1 producer và 1 consumer?
- Test bắt buộc: stress 1 000 000 phần tử, kiểm tra đúng thứ tự; chạy ThreadSanitizer.
- Mở rộng: Vì sao cần acquire/release? Vì sao volatile không đủ? False sharing là gì?

## LC16 — Software timers
- Signature: `int timer_add(tmr_t *t, uint32_t now, uint32_t delay, void (*cb)(void *), void *ctx);`, `bool timer_cancel(tmr_t *t, int id);`, `void timer_tick(tmr_t *t, uint32_t now);` — số timer tối đa cố định.
- Làm rõ: có timer periodic? Callback được phép add/cancel timer khác trong lúc tick?
- Test bắt buộc: hai timer cùng hạn, cancel trước hạn, `now` wrap, callback tự add timer mới.
- Mở rộng: Sorted list, timer wheel, min-heap: độ phức tạp và khi nào dùng.

## LC17 — C++ UniquePtr
- Signature: `template <class T> class UniquePtr;` move-only, có `get`, `release`, `reset`, `operator*`, `operator->`.
- Làm rõ: cần custom deleter hoặc hỗ trợ mảng không?
- Test bắt buộc: move ctor/assignment, self-move, `reset(nullptr)`, destructor gọi đúng 1 lần (đếm bằng class test).
- Mở rộng: Vì sao copy bị delete? `noexcept` trên move ảnh hưởng `std::vector` thế nào?

## LC18 — C++ String rule of 5
- Signature: `class String` sở hữu buffer heap: ctor từ `const char *`, copy/move ctor, copy/move assignment, destructor, `size()`, `c_str()`.
- Làm rõ: chấp nhận `nullptr` làm input?
- Test bắt buộc: copy rồi sửa bản gốc, self-assignment, dùng object nguồn sau move, chuỗi rỗng; ASan sạch.
- Mở rộng: Copy-and-swap; strong exception guarantee; small string optimization.

## LC19 — C++ LRU cache
- Signature: `class LruCache { public: explicit LruCache(size_t cap); std::optional<int> get(int key); void put(int key, int value); };` — get/put O(1).
- Làm rõ: cap = 0?
- Test bắt buộc: cap = 1, cập nhật key đã có, evict đúng thứ tự, get làm mới thứ tự.
- Mở rộng: Kết hợp `std::list` + `unordered_map` iterator; iterator invalidation; bản fixed capacity không dùng heap cho embedded.

## LC20 — Linux `tail -n` bằng syscall
- Signature: `int tail_n(int fd, size_t n);` in n dòng cuối ra stdout, chỉ dùng `read`/`lseek`/`write`.
- Làm rõ: file không kết thúc bằng `'\n'`; n = 0; file ít hơn n dòng; file rất lớn (không đọc hết vào RAM); fd là pipe.
- Test bắt buộc: file rỗng, 1 dòng không có `'\n'`, n > số dòng, file lớn.
- Mở rộng: Xử lý short read/write; fd là pipe thì `lseek` lỗi `ESPIPE` → cần chiến lược nào?
