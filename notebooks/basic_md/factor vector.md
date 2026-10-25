what is factor vector in R
---
In R, a **factor vector** (or simply "factor") is a special type of vector used to represent **categorical data** — data that takes on a limited number of distinct values (called **levels**).

## Key characteristics

- Internally stored as **integers** (1, 2, 3, ...), each mapping to a **level** (a label).
- Has an attribute `levels` listing the possible categories.
- Useful for statistical modeling and plotting (e.g., ANOVA, regression with categorical predictors).
- Can be **ordered** (ordinal) or **unordered** (nominal).

## Creating factors

```r
# From a character vector
gender <- factor(c("male", "female", "female", "male"))
gender
# [1] male   female female male  
# Levels: female male

# Check structure
str(gender)
# Factor w/ 2 levels "female","male": 2 1 1 2

# Ordered factor
size <- factor(c("small", "large", "medium"),
               levels = c("small", "medium", "large"),
               ordered = TRUE)
```

## Important operations

```r
levels(gender)        # "female" "male"  (alphabetical by default)
nlevels(gender)       # 2
as.integer(gender)    # 2 1 1 2  (internal codes)
as.character(gender)  # "male" "female" "female" "male"

# Change level labels
levels(gender) <- c("F", "M")

# Add a new level
levels(gender) <- c(levels(gender), "other")
```

## Why factors matter

1. **Modeling**: `lm()` and `glm()` treat factors as dummy variables automatically.
2. **Plotting**: `ggplot2` and base R plot factors as discrete categories.
3. **Memory**: More compact than storing full strings (though modern R has less benefit here).
4. **Ordering**: Controls the order of categories in tables and plots.

## Common gotcha

By default, `factor()` sorts levels **alphabetically**. If you want a specific order (e.g., "low", "medium", "high"), set `levels =` explicitly — otherwise your plots and models may use the wrong reference category.

## Related: `forcats` package

The `forcats` package (part of the tidyverse) provides convenient tools for working with factors:

```r
library(forcats)
fct_relevel(size, "medium")   # reorder levels
fct_infreq(gender)            # order by frequency
fct_lump(gender, n = 1)       # lump rare levels into "Other"
```

In short: a factor vector is R's way of encoding categorical variables, storing them as integer codes with associated level labels.