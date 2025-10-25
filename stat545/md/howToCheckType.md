In R, there are several ways to check **types** depending on what level of detail you want:

## For the entire data frame:

### 1. `class()` - Object class
```r
class(gapminder)
# Returns: [1] "tbl_df" "tbl" "data.frame"
```

### 2. `str()` - Structure with column types
```r
str(gapminder)
# Shows: tibble [1,704 × 6] (S3: tbl_df/tbl/data.frame)
# Plus each column with its type
```

### 3. `typeof()` - Storage type
```r
typeof(gapminder)
# Returns: [1] "list"
# (data frames are internally lists)
```

## For individual columns:

### 4. `class()` on specific columns
```r
class(gapminder$country)    # "factor"
class(gapminder$year)       # "integer" 
class(gapminder$lifeExp)    # "numeric"
```

### 5. `typeof()` on specific columns
```r
typeof(gapminder$country)   # "integer" (factors stored as integers)
typeof(gapminder$year)      # "integer"
typeof(gapminder$lifeExp)   # "double"
```

### 6. `sapply()` to check all column types at once
```r
sapply(gapminder, class)
# Returns types for all columns:
# country continent year lifeExp pop gdpPercap 
# "factor" "factor" "integer" "numeric" "integer" "numeric"
```

### 7. `sapply()` with `typeof()`
```r
sapply(gapminder, typeof)
# Shows storage types for all columns
```

## Tibble-specific method:

### 8. Just print the tibble
```r
gapminder
# Tibbles show column types under column names:
# country   continent year  lifeExp      pop gdpPercap
# <fct>     <fct>    <int>    <dbl>    <int>     <dbl>
```

## Most useful approaches:

- **`str(gapminder)`** - Best overview of structure and all column types
- **`sapply(gapminder, class)`** - Quick summary of all column classes
- **Just print `gapminder`** - Visual check with tibble's built-in type display
- **`class(gapminder$columnname)`** - Check specific column type

Try `str(gapminder)` for the most comprehensive type information!