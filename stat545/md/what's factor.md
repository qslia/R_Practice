A **factor** in R is a special data type used to represent **categorical data** (data with fixed, known categories or levels).

## What is a factor?

Factors are used for:
- **Categorical variables** (like country names, gender, education level)
- **Ordinal data** (like survey ratings: poor, fair, good, excellent)
- **Grouping variables** for analysis

## How factors work:

### 1. **Levels** - The possible categories
```r
levels(gapminder$continent)
# [1] "Africa"   "Americas" "Asia"     "Europe"   "Oceania"
```

### 2. **Internal storage** - Stored as integers with labels
```r
str(gapminder$continent)
# Factor w/ 5 levels "Africa","Americas",..: 3 3 3 3 3 3 3 3 3 3 ...
# The numbers (3 3 3...) refer to level positions
```

### 3. **Count of levels**
```r
nlevels(gapminder$continent)
# [1] 5
```

## Example with gapminder:

```r
# Check the continent column
class(gapminder$continent)     # "factor"
table(gapminder$continent)     # Count each category
```

## Why use factors?

### 1. **Memory efficient** - Stores each unique value only once
### 2. **Statistical modeling** - R knows to treat as categorical in models
### 3. **Controlled vocabulary** - Prevents typos in categories
### 4. **Ordered analysis** - Can specify order for ordinal data

## Factor vs Character:

```r
# Character vector
countries_char <- c("Canada", "USA", "Mexico")
class(countries_char)  # "character"

# Factor
countries_factor <- factor(c("Canada", "USA", "Mexico"))
class(countries_factor)  # "factor"
levels(countries_factor)  # [1] "Canada" "Mexico" "USA" (alphabetical)
```

## Common factor operations:

```r
# See all levels
levels(gapminder$country)

# Count observations per level
table(gapminder$continent)

# Convert factor to character
as.character(gapminder$continent)

# Create a factor
my_factor <- factor(c("low", "medium", "high", "low"))
```

## In gapminder specifically:

- **`country`** and **`continent`** are factors because they represent categorical data
- **`year`**, **`lifeExp`**, **`pop`**, **`gdpPercap`** are numeric because they represent measurements

Factors are essential for proper statistical analysis of categorical data in R!