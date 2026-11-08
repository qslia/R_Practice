import sys

MOD = 998244353


def powmod(base, exp, mod):
    res = 1
    base %= mod
    while exp > 0:
        if exp % 2 == 1:
            res = (res * base) % mod
        base = (base * base) % mod
        exp //= 2
    return res


def modinv(a, m):
    return powmod(a, m - 2, m)


input = sys.stdin.read
data = input().split()

index = 0
N = int(data[index])
M = int(data[index + 1])
index += 2

A = []
for i in range(N):
    row = [int(data[index + j]) for j in range(M)]
    A.append(row)
    index += M

if N == 0 or M == 0:
    print(0)
    sys.exit(0)

total = powmod(M, N, MOD)

# Collect for each value v: list of (M - count_v_in_row) for rows that have v
from collections import defaultdict

freqs = defaultdict(list)

for row in A:
    count = {}
    for x in row:
        count[x] = count.get(x, 0) + 1
    for v, c in count.items():
        d = M - c  
        # M = number of columns (number of choices per row).
        # d = number of positions in this row that do NOT contain value v.
        freqs[v].append(d)

invM = modinv(M, MOD)
ans = 0

for v, adjustments in freqs.items():
    avoid = total
    for d in adjustments:
        avoid = (avoid * invM) % MOD
        avoid = (avoid * (d % MOD)) % MOD
    contrib = (total - avoid + MOD) % MOD
    ans = (ans + contrib) % MOD

print(ans)
