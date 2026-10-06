# C/C++ foundation
Rotation: Pointer → Memory → static/extern → volatile → struct/union → function pointer → linker → undefined behavior.

45 phút mỗi buổi: recall 10 → experiment 20 → Socratic review 10 → conclusions 5.
Làm bài trước khi xem gợi ý/nhờ AI; dùng C11 cho vòng đầu, ghi chuẩn/compiler khi làm biến thể C++.

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

Mỗi topic có README hướng dẫn và REPORT.md để ghi actual output. Source/tests/evidence do người học tạo trong quá trình làm bài.
