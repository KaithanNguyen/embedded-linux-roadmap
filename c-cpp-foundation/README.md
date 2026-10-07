# C/C++ foundation
45 phút mỗi buổi: recall 10 → experiment 20 → Socratic review 10 → conclusions 5.
Làm bài trước khi xem gợi ý/nhờ AI; dùng C11 cho track A/B, C++17 cho track C; ghi chuẩn/compiler cho mỗi biến thể.
Học tuần tự theo track, mỗi tối T2 một topic (xem [nhịp học](../WORKFLOW.md#nhịp-học-hằng-tuần)); thời gian là dự kiến, điều chỉnh theo evidence.
Concurrency, error-handling và gdb-debugging có thể làm sớm khi sprint tuần 10/2026 cần (mini shell, producer–consumer).

Mỗi topic có bài cơ bản (đạt L2), phần **Deep dive (pro)** gồm ba bài nâng cao chạy cả trên board aarch64 (cần ít nhất một bài để đạt L3), và phần **Làm tay vs dùng AI**: thứ phải tự hiểu để kiểm chứng code, thứ có thể để AI viết rồi kiểm.

## Track A — C core (10–11/2026)
Rotation: Pointer → Memory → volatile → struct/union → function pointer → build & link → undefined behavior.

| Topic | Nội dung |
| --- | --- |
| [Pointer](pointer/README.md) | Lifetime, array decay, alignment, strict aliasing, `container_of` |
| [Memory](memory/README.md) | Storage duration, ownership, pool allocator, stack usage, leak |
| [volatile](volatile/README.md) | MMIO, `readl`/`writel`, vì sao không thay atomic/barrier |
| [struct / union](struct-union/README.md) | Layout, packed, bitfield, serialization cho protocol v0 |
| [Function pointer](function-pointer/README.md) | Callback + context, ops table kiểu kernel, so với virtual dispatch C++ |
| [Build & link](build-link/README.md) | static/extern, translation unit, symbol, linker script, startup code, shared library, glibc version |
| [Undefined behavior](undefined-behavior/README.md) | Tối ưu dựa trên UB, sanitizer, fuzzing |

## Track B — C cho hệ thống (11/2026–12/2026)
Rotation: Integer/bitwise → Error handling → Concurrency → GDB.

| Topic | Nội dung |
| --- | --- |
| [Integer & bitwise](integer-bitwise/README.md) | Promotion, signed/unsigned, mask/shift, fixed-point Q15 |
| [Error handling](error-handling/README.md) | errno, goto cleanup, EINTR/EAGAIN, chèn lỗi bằng LD_PRELOAD |
| [Concurrency](concurrency/README.md) | Mutex/condvar, C11 atomics, SPSC lock-free trên Arm, priority inversion |
| [GDB & debugging tools](gdb-debugging/README.md) | Watchpoint, core dump, gdbserver, GDB Python |

## Track C — C++ cho embedded (01/2027)
| Topic | Nội dung |
| --- | --- |
| [Modern C++ cho embedded](cpp-modern-embedded/README.md) | RAII, move, constexpr, container không heap, CRTP, code size, -fno-exceptions |
| [C/C++ interop](cpp-c-interop/README.md) | extern "C", ABI, opaque handle, exception ở biên C |

Đã gộp để bớt trùng lặp: static/extern và preprocessor/build vào Build & link; classes/polymorphism vào Function pointer (so sánh vtable với ops table); templates/STL vào Modern C++.
Bài có timebox tách riêng: [livecoding](../livecoding/README.md) (embedded C) và [LeetCode](../leetcode/README.md) (thuật toán). Nền kiến trúc CPU ở [arm-architecture](../arm-architecture/README.md).

Mỗi topic có README hướng dẫn và REPORT.md để ghi actual output. Source/tests/evidence do người học tạo trong quá trình làm bài.
Level và evidence của từng topic theo dõi ở [TRACKING.md](../TRACKING.md#cc).
