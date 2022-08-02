0x7f9ffaa0000

0x7f9ffaa0000

0x7f9ffaa0000

0x7f9ffaabeef 0x7f9ffaa0000 0x7f9ffaa0123

Based on http://sourceforge.net/projects/mpimd5bruteforc/

<Page with RBA guess>
0x7f9ffa70000 0x7f9ffa80000 0x7f9ffa90000 0x7f9ffaa0000 0x7f9ffab0000 0x7f9ffac0000 0x7f9ffad0000
. . .

<Page with RBA guess>
0x7f9ffa70000 0x7f9ffa80000 0x7f9ffa90000 0x7f9ffaa0000 0x7f9ffab0000 0x7f9ffac0000 0x7f9ffad0000
. . .

detect_shared_pages()

0x7f9ffaa0000

tstart

N = 10'000, tstart = 10 min

tstart

tstart = t1 = 10 min, loop:
test_time(tn)
If detection rate > 95% return tn*1.2
If detection rate < 50% tn+1 = tn*2
ENls=e 10,000, tstart = 10min tn+1 = tn*(1/[detection rate])

t

t t

t
t rdtsc
t

t
t rdtsc
t

t2 > 2 * (t1+t3)/2

t1,3 < M = 1000

t1 < t3, (t3-t1) < t3/3

t
t rdtsc
t

t2 > 2 * (t1+t3)/2

t1,3 < M = 1000

t1 < t3, (t3-t1) < t3/3

/sys/kernel/mm/ksm/run /sys/kernel/mm/ksm/sleep_millisecs /sys/kernel/mm/ksm/pages_to_scan

`1' or `0' e.g., 200 ms e.g., 100

/sys/kernel/mm/ksm/run /sys/kernel/mm/ksm/sleep_millisecs /sys/kernel/mm/ksm/pages_to_scan

`1' or `0' e.g., 200 ms e.g., 100

1000/sleep_millisecs * pages_to_scan = pages per second e.g., (1000/200ms) * 100 = 500 pages/sec

