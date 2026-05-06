# Read input
input <- readLines("stdin")

# Parse integers (handles both formats)
nums <- strsplit(input[1], " ")[[1]]

# Format: a on line 1, b c on line 2
a <- as.integer(nums[1])
bc <- strsplit(input[2], " ")[[1]]
b <- as.integer(bc[1])
c <- as.integer(bc[2])
s <- input[3]


# Output result
cat(a + b + c, s, "\n")