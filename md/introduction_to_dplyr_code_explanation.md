# Introduction to dplyr - Code Explanation

This document provides a detailed explanation of the R code from the "Introduction to dplyr" notebook, covering basic R concepts and data manipulation techniques.

## Table of Contents
1. [Basic Variables and Operations](#basic-variables-and-operations)
2. [Working with Vectors](#working-with-vectors)
3. [Data Frames](#data-frames)
4. [Basic Statistics](#basic-statistics)
5. [Conditional Logic](#conditional-logic)
6. [Simple Plotting](#simple-plotting)
7. [Introduction to dplyr](#introduction-to-dplyr)
8. [Working with the Star Wars Dataset](#working-with-the-star-wars-dataset)

---

## Basic Variables and Operations

```r
# 1. Variables and basic operations
cat("=== Basic Variables and Operations ===\n")
x <- 10
y <- 5
z <- x + y
cat("x =", x, "\n")
cat("y =", y, "\n")
cat("x + y =", z, "\n")
cat("x * y =", x * y, "\n")
cat("x / y =", x / y, "\n\n")
```

### Explanation:
- **Variable Assignment**: The `<-` operator assigns values to variables. `x <- 10` assigns the value 10 to variable `x`.
- **Arithmetic Operations**: R supports standard mathematical operations:
  - Addition: `+`
  - Multiplication: `*`
  - Division: `/`
- **Output Function**: `cat()` is used to display formatted output. The `\n` creates a new line.
- **Result**: This code demonstrates basic arithmetic and produces output showing the values and calculations.

---

## Working with Vectors

```r
# 2. Vectors
cat("=== Working with Vectors ===\n")
numbers <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
cat("Vector of numbers:", numbers, "\n")
cat("Mean of numbers:", mean(numbers), "\n")
cat("Sum of numbers:", sum(numbers), "\n")
cat("Length of vector:", length(numbers), "\n\n")
```

### Explanation:
- **Vector Creation**: `c()` function combines values into a vector. `c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)` creates a numeric vector.
- **Built-in Functions**:
  - `mean()`: Calculates the arithmetic mean (average) of the vector
  - `sum()`: Adds all elements in the vector
  - `length()`: Returns the number of elements in the vector
- **Result**: Shows the vector (1-10), its mean (5.5), sum (55), and length (10).

---

## Data Frames

```r
# 3. Data Frame
cat("=== Creating a Data Frame ===\n")
names <- c("Alice", "Bob", "Charlie", "Diana", "Eve")
ages <- c(25, 30, 35, 28, 32)
scores <- c(85, 92, 78, 95, 88)

students <- data.frame(
  Name = names,
  Age = ages,
  Score = scores
)

cat("Student data:\n")
print(students)
cat("\n")
```

### Explanation:
- **Multiple Vectors**: Three separate vectors are created for names (character), ages (numeric), and scores (numeric).
- **Data Frame Creation**: `data.frame()` combines vectors into a structured table with:
  - Column names: `Name`, `Age`, `Score`
  - Each row represents one student's information
- **Data Display**: `print()` shows the entire data frame in a tabular format.
- **Result**: Creates a 5×3 table showing student information with proper column headers and row indices.

---

## Basic Statistics

```r
# 4. Basic Statistics
cat("=== Basic Statistics ===\n")
cat("Average age:", mean(ages), "\n")
cat("Average score:", mean(scores), "\n")
cat("Standard deviation of scores:", sd(scores), "\n")
cat("Highest score:", max(scores), "\n")
cat("Lowest score:", min(scores), "\n")
```

### Explanation:
- **Statistical Functions**:
  - `mean()`: Calculates average values for ages and scores
  - `sd()`: Computes standard deviation (measure of variability)
  - `max()`: Finds the maximum value in a vector
  - `min()`: Finds the minimum value in a vector
- **Results**:
  - Average age: 30 years
  - Average score: 87.6
  - Standard deviation: 6.58 (indicates how spread out the scores are)
  - Highest score: 95, Lowest score: 78

---

## Conditional Logic

```r
# 5. Conditional statements
cat("=== Conditional Logic ===\n")
for (i in 1:length(scores)) {
  if (scores[i] >= 90) {
    cat(students$Name[i], "has an excellent score:", scores[i], "\n")
  } else if (scores[i] >= 80) {
    cat(students$Name[i], "has a good score:", scores[i], "\n")
  } else {
    cat(students$Name[i], "needs improvement. Score:", scores[i], "\n")
  }
}
```

### Explanation:
- **For Loop**: `for (i in 1:length(scores))` iterates through each student (1 to 5).
- **Conditional Statements**:
  - `if`: Checks if score ≥ 90 (excellent)
  - `else if`: Checks if score ≥ 80 (good)
  - `else`: Handles scores < 80 (needs improvement)
- **Data Access**:
  - `scores[i]`: Gets the i-th score from the vector
  - `students$Name[i]`: Gets the i-th name from the data frame
- **Result**: Categorizes each student's performance based on their score.

---

## Simple Plotting

```r
# 6. Simple plotting (if graphics are available)
cat("=== Creating a Simple Plot ===\n")
# Create a simple bar plot of scores
if (require(graphics, quietly = TRUE)) {
  barplot(scores, 
          names.arg = names, 
          col = "skyblue",
          main = "Student Scores",
          ylab = "Score",
          ylim = c(0, 100))
  cat("Bar plot created successfully!\n")
} else {
  cat("Graphics package not available for plotting\n")
}
```

### Explanation:
- **Package Check**: `require(graphics, quietly = TRUE)` checks if the graphics package is available.
- **Bar Plot**: `barplot()` creates a bar chart with:
  - `scores`: Data values for bar heights
  - `names.arg = names`: Labels for each bar
  - `col = "skyblue"`: Bar color
  - `main`: Plot title
  - `ylab`: Y-axis label
  - `ylim = c(0, 100)`: Y-axis limits from 0 to 100
- **Conditional Execution**: Only creates the plot if graphics are available.

---

## Introduction to dplyr

```r
# Load the dplyr library
library(dplyr)

# Check the dimensions of the starwars dataset
dim(starwars)
```

### Explanation:
- **Package Loading**: `library(dplyr)` loads the dplyr package for data manipulation.
- **Built-in Dataset**: `starwars` is a dataset that comes with dplyr containing Star Wars character information.
- **Dimensions**: `dim()` returns the number of rows and columns (87 rows × 14 columns).

---

## Working with the Star Wars Dataset

### Dataset Structure

```r
str(starwars)
```

**Explanation**: `str()` displays the structure of the dataset, showing:
- 87 observations (rows) and 14 variables (columns)
- Data types for each column (chr = character, int = integer, num = numeric, list = list)
- Sample values for each variable

### Dataset Overview

```r
glimpse(starwars)
```

**Explanation**: `glimpse()` is a dplyr function that provides a transposed view of the data, showing:
- Number of rows and columns
- Column names with data types
- First few values of each column

### Column Names

```r
names(starwars)
```

**Explanation**: `names()` returns all column names in the dataset.

### Data Selection

```r
starwars %>% 
  select(-films, -vehicles, -starships) %>% 
  head()
```

**Explanation**:
- **Pipe Operator** (`%>%`): Passes the result from one function to the next
- **select()**: Chooses which columns to include/exclude
  - The minus sign (`-`) excludes the specified columns
- **head()**: Shows the first 6 rows of the result
- This removes the complex list columns to show a cleaner view of the data

### Working with List Columns

```r
starwars$films[1:5]
```

**Explanation**: Accesses the `films` column for the first 5 characters, showing that this column contains lists of movie titles for each character.

### Examining List Data

```r
# Examine the list columns (films, vehicles, starships) for first few characters
cat("Films for first 3 characters:\n")
for(i in 1:3) {
  cat(starwars$name[i], ":", paste(starwars$films[[i]], collapse = ", "), "\n")
}
```

**Explanation**:
- **List Access**: `starwars$films[[i]]` accesses the list element for character i
- **paste() with collapse**: Combines multiple values into a single string
  - `paste(starwars$films[[i]], collapse = ", ")` joins movie titles with commas
- **Double Brackets**: `[[i]]` extracts the actual list content (not a list containing the content)

### Understanding paste() Function

```r
paste(c("A", "B", "C"))
paste(c("A", "B", "C"), collapse = ", ")
```

**Explanation**:
- **First paste()**: Without `collapse`, returns separate strings: "A" "B" "C"
- **Second paste()**: With `collapse = ", "`, combines into one string: "A, B, C"
- This demonstrates the difference between keeping elements separate vs. combining them

---

## Key Concepts Summary

1. **Data Types**: R handles different data types (numeric, character, logical)
2. **Data Structures**: Vectors (1D) and data frames (2D tables)
3. **Functions**: Built-in functions for statistics, data manipulation, and visualization
4. **Control Flow**: Conditional statements and loops for decision-making
5. **dplyr Package**: Modern approach to data manipulation with intuitive functions
6. **Pipe Operator**: `%>%` allows chaining operations for readable code
7. **List Columns**: Complex data structures within data frames for storing multiple values per row

This notebook provides a foundation for understanding R programming and introduces the powerful dplyr package for data analysis and manipulation.

---

## Troubleshooting: Common Display Errors

### Error: "arguments imply differing number of rows"

If you encounter this error when trying to display the `starwars` dataset:

```
Error in (function (..., row.names = NULL, check.rows = FALSE, check.names = TRUE, : 
arguments imply differing number of rows: 5, 6, 7, 4, 3, 1, 2
```

**Cause**: This error occurs because the `starwars` dataset contains list columns (`films`, `vehicles`, `starships`) where each character has a different number of entries. When R tries to display the data, it can't create a uniform table structure.

**Solutions**:

1. **Exclude list columns when viewing**:
```r
starwars %>% 
  select(-films, -vehicles, -starships) %>% 
  head(10)
```

2. **Use structure or glimpse instead**:
```r
str(starwars)
# or
glimpse(starwars)
```

3. **Work with list columns safely**:
```r
# Count items in list columns
starwars %>% 
  mutate(num_films = lengths(films)) %>% 
  select(name, num_films) %>% 
  head(10)
```

4. **Access specific list elements**:
```r
# View films for first character
starwars$films[[1]]

# View films for multiple characters with proper formatting
for(i in 1:3) {
  cat(starwars$name[i], ":", paste(starwars$films[[i]], collapse = ", "), "\n")
}
```

This error is common when working with complex datasets that contain nested or list-type data structures. Always be cautious when displaying datasets with list columns directly.




I'll explain this specific code snippet that demonstrates how to safely work with list columns in the `starwars` dataset.

## Code Explanation: Working with List Columns

```r
starwars %>% 
  mutate(num_films = lengths(films)) %>% 
  select(name, num_films) %>% 
  head(10)
```

Let me break this down step by step:

### 1. **Starting Dataset**: `starwars`
- This is the built-in dataset from dplyr containing Star Wars character information
- It has 87 rows (characters) and 14 columns
- Some columns like `films` are "list columns" containing multiple values per character

### 2. **Pipe Operator**: `%>%`
- Passes the result from one function to the next
- Reads as "then do this"
- Makes code more readable by chaining operations

### 3. **`mutate(num_films = lengths(films))`**
- **`mutate()`**: Creates new columns or modifies existing ones
- **`lengths(films)`**: Counts how many items are in each character's `films` list
  - `films` is a list column where each character has a vector of movie titles
  - `lengths()` returns the number of elements in each list
  - For example: Luke Skywalker appears in 5 films, so `lengths()` returns 5
- **`num_films`**: The name of the new column being created
- **Result**: Adds a new column showing how many movies each character appeared in

### 4. **`select(name, num_films)`**
- **`select()`**: Chooses which columns to keep in the output
- **`name`**: Keeps the character name column
- **`num_films`**: Keeps our newly created column with film counts
- **Result**: Shows only these two columns, hiding all others

### 5. **`head(10)`**
- Shows only the first 10 rows of the result
- Useful for previewing data without overwhelming output

## What This Code Accomplishes:

This code safely handles the problematic list column (`films`) by:
1. **Converting complex data to simple numbers**: Instead of trying to display lists of movie titles, it counts them
2. **Avoiding the display error**: By using `lengths()`, we get a single number per character instead of variable-length lists
3. **Creating meaningful insights**: Shows which characters appear in the most films

## Expected Output:
```
# A tibble: 10 × 2
   name               num_films
   <chr>                  <int>
 1 Luke Skywalker             5
 2 C-3PO                      6
 3 R2-D2                      7
 4 Darth Vader                4
 5 Leia Organa                5
 6 Owen Lars                  3
 7 Beru Whitesun lars         3
 8 R5-D4                      1
 9 Biggs Darklighter          1
10 Obi-Wan Kenobi             6
```

## Why This Approach Works:

- **Handles variable-length data**: Each character appears in a different number of films, but `lengths()` gives us consistent single numbers
- **Prevents errors**: No more "differing number of rows" issues
- **Provides useful information**: We can now easily see which characters are most prominent in the Star Wars saga
- **Demonstrates dplyr workflow**: Shows the typical pattern of transform → select → preview

This is a perfect example of how to work with complex, nested data structures in R while avoiding common display errors!


I'll explain this code that demonstrates random sampling from a filtered dataset. Let me first check if this code exists in your notebook to provide context.

[1 tool called]

Perfect! I can see the code is in your notebook. Let me explain this specific line:

## Code Explanation: Random Sampling with `slice_sample()`

```r
starwars.filters %>% slice_sample(prop = 0.1)
```

### Breaking It Down:

#### 1. **`starwars.filters`**
- This is a modified version of the `starwars` dataset that was created earlier in your notebook
- From the context, it appears to be: `starwars %>% select(-films, -vehicles, -starships) -> starwars.filters`
- It's the same Star Wars character data but with the problematic list columns removed for safe display

#### 2. **Pipe Operator `%>%`**
- Passes the `starwars.filters` dataset to the next function
- Reads as "then do this"

#### 3. **`slice_sample(prop = 0.1)`**
- **`slice_sample()`**: A dplyr function for random sampling
- **`prop = 0.1`**: Samples a **proportion** of the total rows
- **`0.1`** means **10%** of the dataset
- Since `starwars` has 87 characters, this will randomly select approximately 8-9 characters

### What This Code Does:

1. **Takes the filtered dataset** (without list columns)
2. **Randomly samples 10%** of all Star Wars characters
3. **Returns a random subset** - different characters each time you run it
4. **Maintains all columns** from the filtered dataset

### Expected Output:
```r
# A tibble: 9 × 11  (approximately, since 87 * 0.1 ≈ 8.7)
  name           height  mass hair_color skin_color eye_color birth_year sex   
  <chr>           <int> <dbl> <chr>      <chr>      <chr>          <dbl> <chr> 
1 Boba Fett         183    78 black      fair       brown           31.5 male  
2 Wicket            88    20 brown      brown      brown              8 male  
3 Nien Nunb         160    68 none       grey       black             NA male  
# ... with 6 more rows, and 3 more variables: gender, homeworld, species
```

### Alternative Sampling Methods:

**Compare with other sampling approaches you've used:**

1. **Fixed number sampling**:
```r
starwars.filters %>% slice_sample(n = 5)  # Exactly 5 characters
```

2. **Proportion sampling** (your current code):
```r
starwars.filters %>% slice_sample(prop = 0.1)  # 10% of characters
```

3. **Top/bottom slicing**:
```r
starwars.filters %>% slice_head(n = 3)  # First 3 characters
starwars.filters %>% slice(5:10)        # Characters 5 through 10
```

### Key Differences:

- **`n = 5`**: Always gives exactly 5 rows
- **`prop = 0.1`**: Gives ~10% of total rows (varies with dataset size)
- **Random selection**: Each run produces different results
- **Reproducible**: Add `set.seed(123)` before sampling for consistent results

### Practical Uses:

- **Data exploration**: Quick preview of random samples
- **Testing**: Work with smaller subsets during development  
- **Quality checks**: Randomly inspect data quality
- **Demonstrations**: Show varied examples without bias

This is a powerful technique for exploring large datasets by getting representative random samples!