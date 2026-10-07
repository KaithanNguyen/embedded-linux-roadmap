# LeetCode
Luyện thuật toán theo chủ đề để giữ phản xạ giải bài và phân tích độ phức tạp.
Mục tiêu: 60 bài pattern cốt lõi đến 06/2027, ít nhất 30 bài Verified; nhịp 1–2 bài mỗi tuần (xem [roadmap](../ROADMAP.md#chỉ-số) và [TRACKING AL01](../TRACKING.md#algorithms--timed-coding)).
Danh sách đã thu gọn từ 102 xuống 62 bài: làm lại được một bài không gợi ý có giá trị hơn làm thêm nhiều bài một lần. Backtracking và các dạng DP/graph nâng cao đã bỏ vì ít gặp trong công việc embedded.

## Cách làm một bài
1. Đọc đề, ghi ví dụ biên, ý tưởng và độ phức tạp trước khi code.
2. Timebox: Easy 20 phút, Medium 40 phút; vừa làm vừa nói to cách nghĩ.
3. Quá timebox: xem gợi ý, ghi "Solved có gợi ý", làm lại từ đầu sau 1 tuần.
4. Lưu solution trong folder của chủ đề; đầu file ghi link, độ phức tạp và ngày.
5. Sau ≥ 7 ngày làm lại từ đầu, không gợi ý, trong timebox: đạt thì đổi kết quả thành "Verified".
6. Cập nhật bảng của chủ đề, chạy `python tools/repo_check.py progress --write` để cập nhật bảng tiến độ; ghi một dòng vào log ngày.

Ngôn ngữ: ưu tiên C để luyện pointer và bộ nhớ; dùng C++ (STL) khi bài cần hash map hoặc heap, và ghi rõ lý do.
Không copy lời giải. Nếu học từ editorial, ghi nguồn và tự viết lại sau ít nhất 1 ngày.

## Tiến độ theo chủ đề
Học theo thứ tự số; danh sách bài là gợi ý, được thêm/bớt trong bảng của từng chủ đề. Bảng dưới được sinh tự động từ các bảng đó.

<!-- progress:start -->

| # | Chủ đề | Bài gợi ý | Đã làm | Verified | Easy | Medium | Hard | Status |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 01 | [Arrays & Hashing](01-arrays-hashing/README.md) | 6 | 0 | 0 | 0 | 0 | 0 | Not started |
| 02 | [Two Pointers](02-two-pointers/README.md) | 5 | 0 | 0 | 0 | 0 | 0 | Not started |
| 03 | [Sliding Window](03-sliding-window/README.md) | 4 | 0 | 0 | 0 | 0 | 0 | Not started |
| 04 | [Stack & Queue](04-stack-queue/README.md) | 5 | 0 | 0 | 0 | 0 | 0 | Not started |
| 05 | [Binary Search](05-binary-search/README.md) | 5 | 0 | 0 | 0 | 0 | 0 | Not started |
| 06 | [Linked List](06-linked-list/README.md) | 5 | 0 | 0 | 0 | 0 | 0 | Not started |
| 07 | [Trees](07-trees/README.md) | 5 | 0 | 0 | 0 | 0 | 0 | Not started |
| 08 | [Heap / Priority Queue](08-heap/README.md) | 2 | 0 | 0 | 0 | 0 | 0 | Not started |
| 09 | [Graphs](09-graphs/README.md) | 3 | 0 | 0 | 0 | 0 | 0 | Not started |
| 10 | [Dynamic Programming](10-dynamic-programming/README.md) | 4 | 0 | 0 | 0 | 0 | 0 | Not started |
| 11 | [Bit Manipulation](11-bit-manipulation/README.md) | 5 | 0 | 0 | 0 | 0 | 0 | Not started |
| 12 | [Math & Matrix](12-math-matrix/README.md) | 5 | 0 | 0 | 0 | 0 | 0 | Not started |
| 13 | [Intervals & Sorting](13-intervals-sorting/README.md) | 3 | 0 | 0 | 0 | 0 | 0 | Not started |
| 14 | [Design](14-design/README.md) | 5 | 0 | 0 | 0 | 0 | 0 | Not started |
| | **Tổng** | **62** | **0** | **0** | **0** | **0** | **0** | |

<!-- progress:end -->

Level ghi theo LeetCode tại thời điểm lập danh sách và có thể thay đổi.
Bài embedded C tự ra đề (ring buffer, frame parser, CRC...) nằm ở [livecoding](../livecoding/README.md).
