# Live coding problems
Chỉ có đề, không có lời giải. Tự chọn contract khi đề để ngỏ, và ghi lựa chọn đó vào session.
Mặc định C11 (LC14: C++17); không dùng thư viện ngoài libc/STL.

## LC01 — Bit operations & register field
- Signature: `uint32_t field_get(uint32_t reg, unsigned shift, unsigned width);` và `uint32_t field_set(uint32_t reg, unsigned shift, unsigned width, uint32_t value);`
- Làm rõ: width = 0 hoặc 32? shift + width > 32? value lớn hơn độ rộng field?
- Test bắt buộc: field ở bit 0, field chạm bit 31, width = 32, value tràn field.
- Mở rộng: Vì sao `1u << 31` chứ không phải `1 << 31`? Read-modify-write trên register thật gặp vấn đề gì khi interrupt chen vào giữa?

## LC02 — Endianness & serialization
- Signature: `void put_be32(uint8_t *buf, uint32_t v);`, `uint32_t get_be32(const uint8_t *buf);`, `bool is_little_endian(void);`
- Làm rõ: buf có thể không aligned?
- Test bắt buộc: 0x12345678 → `12 34 56 78`; buf lệch alignment (`buf + 1`); round-trip.
- Mở rộng: Vì sao `*(uint32_t *)buf` nguy hiểm (alignment, strict aliasing)? `htonl` khác gì?

## LC03 — memmove
- Signature: `void *my_memmove(void *dst, const void *src, size_t n);`
- Làm rõ: n = 0? dst == src?
- Test bắt buộc: không overlap; overlap với dst < src; overlap với dst > src; n = 0.
- Mở rộng: Vì sao memcpy với vùng overlap là UB? Copy theo word để nhanh hơn thì phải chú ý gì?

## LC04 — Ring buffer FIFO
- Signature: `void rb_init(rb_t *rb, uint8_t *storage, size_t cap);`, `bool rb_push(rb_t *rb, uint8_t b);`, `bool rb_pop(rb_t *rb, uint8_t *out);`
- Làm rõ: đầy thì từ chối hay ghi đè? cap có bắt buộc là lũy thừa của 2?
- Test bắt buộc: pop khi rỗng, push khi đầy, wrap-around, cap = 1.
- Mở rộng: Phân biệt full/empty bằng count hay bỏ trống 1 slot? Dùng giữa ISR và main loop cần gì?

## LC05 — Intrusive list + container_of
- Tự định nghĩa `struct list_head`, macro `container_of`; implement add/del/for-each cho `struct sensor_event` có chứa `struct list_head`.
- Làm rõ: list vòng có sentinel head?
- Test bắt buộc: thêm 3 phần tử, xóa phần tử giữa, duyệt list rỗng.
- Mở rộng: Vì sao Linux kernel dùng intrusive list? `offsetof` hoạt động thế nào?

## LC06 — Frame parser state machine
- Frame: `0xAA | len (1 byte) | payload (len byte) | checksum (XOR của len và payload)`.
- Signature: `void parser_feed(parser_t *p, uint8_t byte);` gọi callback khi nhận đủ một frame hợp lệ.
- Làm rõ: len tối đa? Gặp 0xAA trong payload? Checksum sai thì resync thế nào?
- Test bắt buộc: frame đúng, hai frame liền nhau, checksum sai, byte rác trước 0xAA, len = 0, len > max.
- Mở rộng: Gọi từ UART ISR từng byte thì cần đổi gì? Byte stuffing/COBS giải quyết vấn đề gì?

## LC07 — CRC-8
- Signature: `uint8_t crc8(const uint8_t *data, size_t len);` với poly 0x07, init 0x00, không reflect, không xorout.
- Làm rõ: tham số CRC (poly, init, reflect, xorout) do ai quy định?
- Test bắt buộc: chuỗi rỗng; `"123456789"` → 0xF4; 1 byte.
- Mở rộng: Bản table-driven đổi bộ nhớ lấy tốc độ thế nào? CRC phát hiện lỗi gì mà tổng cộng byte bỏ sót?

## LC08 — Fixed-block memory pool
- Signature: `void pool_init(pool_t *p, void *mem, size_t block_size, size_t nblocks);`, `void *pool_alloc(pool_t *p);`, `void pool_free(pool_t *p, void *blk);`
- Làm rõ: alignment của block? free pointer không thuộc pool hoặc double free?
- Test bắt buộc: cấp hết block, alloc khi hết → NULL, free rồi alloc lại, block_size < `sizeof(void *)`.
- Mở rộng: Free list nhúng trong block; vì sao embedded tránh malloc lúc runtime; thread safety.

## LC09 — Button debounce
- Signature: `bool debounce_update(debounce_t *d, bool raw, uint32_t now_ms);` trả trạng thái ổn định; chỉ đổi khi raw giữ nguyên ≥ 20 ms.
- Làm rõ: được gọi theo tick đều hay thời điểm bất kỳ?
- Test bắt buộc: nhiễu ngắn < 20 ms, nhấn ổn định, `now_ms` wrap qua 0xFFFFFFFF.
- Mở rộng: Vì sao `now - last >= T` với unsigned vẫn đúng khi wrap? Interrupt + timer so với polling?

## LC10 — Moving average fixed-point
- Signature: `int16_t ma_update(ma_t *m, int16_t sample);` trả trung bình 8 mẫu gần nhất, không dùng float.
- Làm rõ: trước khi đủ 8 mẫu trả gì? Làm tròn thế nào?
- Test bắt buộc: chuỗi hằng số, bước nhảy, giá trị âm, INT16_MIN/INT16_MAX liên tiếp.
- Mở rộng: Accumulator cần bao nhiêu bit? Chia cho lũy thừa 2 bằng shift với số âm có đúng không?

## LC11 — Thread-safe bounded queue
- Signature: `int bq_push(bq_t *q, int v);`, `int bq_pop(bq_t *q, int *out);`, `void bq_close(bq_t *q);` — blocking, dùng pthread mutex + condvar.
- Làm rõ: sau close, push/pop trả gì? Có cần timeout?
- Test bắt buộc: 1 producer/1 consumer; nhiều producer; close khi consumer đang chờ; chạy ThreadSanitizer.
- Mở rộng: Spurious wakeup; signal hay broadcast; tránh deadlock khi close.

## LC12 — SPSC lock-free ring buffer
- Như LC04 nhưng đúng 1 producer thread và 1 consumer thread, dùng `<stdatomic.h>`, không mutex.
- Làm rõ: bảo đảm chỉ có 1 producer và 1 consumer?
- Test bắt buộc: stress 1 000 000 phần tử, kiểm tra đúng thứ tự; chạy ThreadSanitizer.
- Mở rộng: Vì sao cần acquire/release? Vì sao volatile không đủ? False sharing là gì?

## LC13 — Software timers
- Signature: `int timer_add(tmr_t *t, uint32_t now, uint32_t delay, void (*cb)(void *), void *ctx);`, `bool timer_cancel(tmr_t *t, int id);`, `void timer_tick(tmr_t *t, uint32_t now);` — số timer tối đa cố định.
- Làm rõ: có timer periodic? Callback được phép add/cancel timer khác trong lúc tick?
- Test bắt buộc: hai timer cùng hạn, cancel trước hạn, `now` wrap, callback tự add timer mới.
- Mở rộng: Sorted list, timer wheel, min-heap: độ phức tạp và khi nào dùng.

## LC14 — C++ UniquePtr
- Signature: `template <class T> class UniquePtr;` move-only, có `get`, `release`, `reset`, `operator*`, `operator->`.
- Làm rõ: cần custom deleter hoặc hỗ trợ mảng không?
- Test bắt buộc: move ctor/assignment, self-move, `reset(nullptr)`, destructor gọi đúng 1 lần (đếm bằng class test).
- Mở rộng: Vì sao copy bị delete? `noexcept` trên move ảnh hưởng `std::vector` thế nào?

## LC15 — Linux `tail -n` bằng syscall
- Signature: `int tail_n(int fd, size_t n);` in n dòng cuối ra stdout, chỉ dùng `read`/`lseek`/`write`.
- Làm rõ: file không kết thúc bằng `'\n'`; n = 0; file ít hơn n dòng; file rất lớn (không đọc hết vào RAM); fd là pipe.
- Test bắt buộc: file rỗng, 1 dòng không có `'\n'`, n > số dòng, file lớn.
- Mở rộng: Xử lý short read/write; fd là pipe thì `lseek` lỗi `ESPIPE` → cần chiến lược nào?
