The output `'tbl_df' 'tbl' 'data.frame'` shows that the `gapminder` object has **multiple classes** in R. This is called **class inheritance** or **multiple inheritance**.

## What each class means:

1. **`'data.frame'`** - The base R data structure for tabular data
2. **`'tbl'`** - A "tibble" class from the tibble package (part of tidyverse)
3. **`'tbl_df'`** - Specifically a "tibble data frame"

## Class Hierarchy:

The classes are listed in **inheritance order**. The `gapminder` object is:
- **Primarily** a `tbl_df` (tibble data frame)
- **Also** a `tbl` (tibble)
- **And** a `data.frame` (base R data frame)

## What this means practically:

**Tibbles are enhanced data frames** that:

1. **Print more nicely** - Only show first 10 rows and fit columns to screen width
2. **Are more strict** - Don't do partial matching of column names
3. **Show data types** - Display column types when printed
4. **Never convert strings to factors** automatically
5. **Preserve column names** exactly as entered

## Example of the difference:

```r
# Regular data.frame
data.frame(x = 1:3, y = letters[1:3])

# Tibble (what gapminder is)
tibble(x = 1:3, y = letters[1:3])
```

The tibble will show:
```
# A tibble: 3 × 2
      x y    
  <int> <chr>
1     1 a    
2     2 b    
3     3 c    
```

While a regular data.frame shows less informative output.

## Why gapminder is a tibble:

Since you loaded the `tidyverse` library, the `gapminder` package automatically provides its data as a tibble rather than a plain data.frame, giving you all the enhanced features while maintaining full compatibility with base R functions that expect data.frames.