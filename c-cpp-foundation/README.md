# C/C++ foundation
45 phút mỗi buổi: recall 10 → experiment 20 → Socratic review 10 → conclusions 5.
Làm bài trước khi xem gợi ý/nhờ AI; dùng C11 cho track A/B, C++17 cho track C; ghi chuẩn/compiler cho mỗi biến thể.
Học tuần tự theo track, mỗi tối T2 một topic (xem [nhịp học](../README.md#nhịp-học-hằng-tuần)); thời gian là dự kiến, điều chỉnh theo evidence.
Concurrency, error-handling và gdb-debugging có thể làm sớm khi sprint tuần 10/2026 cần (mini shell, producer–consumer).

## Track A — C core (10–11/2026)
Rotation: Pointer → Memory → static/extern → volatile → struct/union → function pointer → linker → undefined behavior.

| Topic | Nội dung |
| --- | --- |
| [Pointer](pointer/README.md) | Địa chỉ, dereference, array decay, const, lifetime |
| [Memory](memory/README.md) | Automatic/static/allocated storage, ownership, allocation failure |
| [static / extern](static-extern/README.md) | Scope, linkage, storage duration, declaration vs definition |
| [volatile](volatile/README.md) | Observable access, MMIO, atomicity, synchronization |
| [struct / union](struct-union/README.md) | Layout, padding, alignment, endianness, serialization |
| [Function pointer](function-pointer/README.md) | Callback signatures, dispatch, context pointer, ownership |
| [Linker](linker/README.md) | Translation units, symbols, sections, relocation, link order |
| [Undefined behavior](undefined-behavior/README.md) | Bounds, lifetime, signed overflow, uninitialized read |

## Track B — C cho Linux/embedded (12/2026–01/2027)
Rotation: Integer/bitwise → Preprocessor/build → Error handling → Concurrency → GDB.

| Topic | Nội dung |
| --- | --- |
| [Integer & bitwise](integer-bitwise/README.md) | Fixed-width types, promotion, signed/unsigned, shift, mask, bitfield |
| [Preprocessor & build](preprocessor-build/README.md) | Macro pitfalls, conditional compilation, Make dependency, CMake |
| [Error handling](error-handling/README.md) | Return code, errno, goto cleanup, short read/write, EINTR |
| [Concurrency](concurrency/README.md) | pthread, data race, mutex/condvar, C11 atomics |
| [GDB & debugging tools](gdb-debugging/README.md) | Breakpoint, watchpoint, core dump, Valgrind, gdbserver |

## Track C — C++ cho embedded (01–02/2027)
Rotation: RAII → Classes/polymorphism → Templates/STL → C/C++ interop.

| Topic | Nội dung |
| --- | --- |
| [RAII & ownership](cpp-raii-ownership/README.md) | ctor/dtor, rule of 0/3/5, move, unique_ptr/shared_ptr |
| [Classes & polymorphism](cpp-oop-polymorphism/README.md) | Object layout, vtable, virtual destructor, so sánh với C ops table |
| [Templates & STL](cpp-templates-stl/README.md) | Template, constexpr, std::array/vector, iterator invalidation, code size |
| [C/C++ interop](cpp-c-interop/README.md) | extern "C", name mangling, -fno-exceptions/-fno-rtti |

Track B/C dùng lại code của track trước (counter của static-extern, copy_file của error-handling); giữ link giữa các REPORT.
Bài có timebox tách riêng: [livecoding](../livecoding/README.md) (embedded C) và [LeetCode](../leetcode/README.md) (thuật toán).

Mỗi topic có README hướng dẫn và REPORT.md để ghi actual output. Source/tests/evidence do người học tạo trong quá trình làm bài.
