MOD <- 998244353

powmod <- function(base, exp, mod) {
  res <- 1
  base <- base %% mod
  while (exp > 0) {
    if (exp %% 2 == 1) {
      res <- (res * base) %% mod
    }
    base <- (base * base) %% mod
    exp <- exp %/% 2
  }
  return(res)
}

modinv <- function(a, m) {
  return(powmod(a, m - 2, m))
}

# === Robust Input Reading ===
input <- readLines("stdin", warn = FALSE)

# Flatten all input into single vector of tokens
tokens <- unlist(strsplit(input, "\\s+"))
tokens <- tokens[tokens != ""]   # remove empty strings

idx <- 1
N <- as.integer(tokens[idx])
M <- as.integer(tokens[idx + 1])
idx <- idx + 2

A <- matrix(0L, nrow = N, ncol = M)
for (i in 1:N) {
  for (j in 1:M) {
    A[i, j] <- as.integer(tokens[idx])
    idx <- idx + 1
  }
}

# === Main Logic ===
if (N == 0 || M == 0) {
  cat(0, "\n")
  quit()
}

total <- powmod(M, N, MOD)

# Use character keys to avoid large index issues
freqs <- list()

for (i in 1:N) {
  row_vals <- A[i, ]
  tab <- table(row_vals)
  for (v_str in names(tab)) {
    v <- as.integer(v_str)
    c <- as.integer(tab[[v_str]])
    d <- M - c
    
    key <- as.character(v)
    if (is.null(freqs[[key]])) {
      freqs[[key]] <- integer(0)
    }
    freqs[[key]] <- c(freqs[[key]], d)
  }
}

invM <- modinv(M, MOD)
ans <- 0

for (key in names(freqs)) {
  adjustments <- freqs[[key]]
  avoid <- total
  for (d in adjustments) {
    avoid <- (avoid * invM) %% MOD
    avoid <- (avoid * (d %% MOD)) %% MOD
  }
  contrib <- (total - avoid + MOD) %% MOD
  ans <- (ans + contrib) %% MOD
}

cat(ans, "\n")