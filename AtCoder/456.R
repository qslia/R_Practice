# Read input
input = readLines("stdin")
die1 <- as.integer(strsplit(input[1], " ")[[1]])
die2 <- as.integer(strsplit(input[2], " ")[[1]])
die3 <- as.integer(strsplit(input[3], " ")[[1]])

# Count favorable outcomes
favorable <- 0
total <- 0

for (i in 1:6) {
  for (j in 1:6) {
    for (k in 1:6) {
      total <- total + 1
      values <- c(die1[i], die2[j], die3[k])
      # Check if values are exactly 4, 5, 6 (each once)
      sorted_vals <- sort(values)
      if (sorted_vals[1] == 4 && sorted_vals[2] == 5 && sorted_vals[3] == 6) {
        favorable <- favorable + 1
      }
    }
  }
}
# print(total)
# print(favorable)
# Calculate probability
probability <- favorable / total
# print(probability)

# Output with sufficient precision
cat(sprintf("%.10f\n", probability))