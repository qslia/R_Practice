## Code Explanation: `table(gapminder$year)`

This R code creates a **frequency table** showing how many observations exist for each year in the `gapminder` dataset.

### Breaking It Down:

#### 1. **`gapminder`**
- This is a famous dataset commonly used for learning data analysis
- Contains data about countries over time with variables like:
  - `country`: Country names
  - `year`: Years (typically 1952, 1957, 1962, etc.)
  - `pop`: Population
  - `lifeExp`: Life expectancy
  - `gdpPercap`: GDP per capita

#### 2. **`$year`**
- **Dollar sign operator** (`$`) extracts a specific column from a data frame
- `gapminder$year` gets just the `year` column as a vector
- Contains all the year values for every country observation

#### 3. **`table()`**
- **Function**: Counts the frequency of each unique value
- **Input**: A vector (in this case, years)
- **Output**: A table showing each unique year and how many times it appears

### What This Shows:

**Expected Output** (typical gapminder dataset):
```r
1952 1957 1962 1967 1972 1977 1982 1987 1992 1997 2002 2007 
 142  142  142  142  142  142  142  142  142  142  142  142 
```

### Interpretation:

- **Years**: The gapminder dataset typically has data every 5 years from 1952 to 2007
- **Count 142**: Each year has 142 observations (one for each country)
- **Balanced dataset**: Same number of countries for each time period

### Why This is Useful:

1. **Data Exploration**: Quick way to see the time range of your data
2. **Check Completeness**: Verify if all years have the same number of observations
3. **Identify Gaps**: Spot missing years or uneven data collection
4. **Time Series Analysis**: Understand the temporal structure of your dataset

### Similar Commands:

```r
# Other ways to explore the year variable
summary(gapminder$year)        # Min, max, median, etc.
unique(gapminder$year)         # Just the unique years
length(unique(gapminder$year)) # How many different years
range(gapminder$year)          # First and last year
```

### Context:
This is typically one of the first exploratory commands you'd run when working with the gapminder dataset to understand its temporal structure. It's a fundamental data exploration technique in R!