In R, there are several ways to check the **shape** or **size** of a data frame like `gapminder`. Here are the most common methods:

## Primary Methods:

### 1. `dim()` - Get dimensions (rows × columns)
```r
dim(gapminder)
# Returns: [1] 1704    6
# Meaning: 1704 rows, 6 columns
```

### 2. `nrow()` - Number of rows
```r
nrow(gapminder)
# Returns: [1] 1704
```

### 3. `ncol()` - Number of columns
```r
ncol(gapminder)
# Returns: [1] 6
```

## Alternative Methods:

### 4. `length()` - Number of columns (for data frames)
```r
length(gapminder)
# Returns: [1] 6
# Note: For data frames, length() gives number of columns
```

### 5. `str()` - Structure (includes dimensions)
```r
str(gapminder)
# Shows: tibble [1,704 × 6] plus column details
```

### 6. Print the tibble directly
```r
gapminder
# Tibbles automatically show dimensions when printed:
# A tibble: 1,704 × 6
```

## Most Common Usage:

- **`dim(gapminder)`** - Most common, gives both dimensions at once
- **`nrow(gapminder)`** and **`ncol(gapminder)`** - When you need specific dimension
- Just printing **`gapminder`** - Quick visual check since tibbles show dimensions

## Python pandas equivalent:
If you're familiar with Python pandas, `dim()` in R is like `.shape` in pandas:
```python
# Python pandas
df.shape  # (1704, 6)

# R equivalent  
dim(gapminder)  # [1] 1704    6
```

Try `dim(gapminder)` - it's the most straightforward way to see the shape!