# Numeric vs Integer in R

## Overview

In R, both `numeric` and `integer` are data types used to store numbers, but they have important differences in how they store and handle numerical values.

## Key Differences

### 1. Storage and Precision

**Integer:**
- Stores whole numbers only
- Uses 32-bit storage (4 bytes per value)
- Range: approximately -2.1 billion to +2.1 billion
- Exact representation (no precision loss)
- Created with the `L` suffix: `1000L`

**Numeric (Double):**
- Stores decimal numbers (floating-point)
- Uses 64-bit storage (8 bytes per value) 
- Much larger range than integers
- May have precision limitations due to floating-point representation
- Default for numbers without `L` suffix: `1000`

### 2. Memory Usage

```r
# Integer uses less memory
x <- 1000L    # 4 bytes
y <- 1000     # 8 bytes

# Check object size
object.size(x)  # Smaller
object.size(y)  # Larger
```

### 3. Performance

- Integer operations are generally faster
- Integer arithmetic is more precise for whole numbers
- Numeric allows for decimal calculations

## Practical Examples

### Creating Each Type

```r
# Integer
x <- 1000L
y <- 55L

# Numeric (double)
z <- 1000
w <- 55.5

# Check types
class(x)  # "integer"
class(y)  # "integer" 
class(z)  # "numeric"
class(w)  # "numeric"
```

### Type Conversion

```r
# Convert numeric to integer
as.integer(3.14)    # Result: 3 (truncated)
as.integer(3.99)    # Result: 3 (truncated)

# Convert integer to numeric
as.numeric(42L)     # Result: 42 (now numeric)

# Check if values are integers
is.integer(42L)     # TRUE
is.integer(42)      # FALSE
is.numeric(42)      # TRUE
is.numeric(42L)     # TRUE (integers are also numeric!)
```

### Important Note about `is.numeric()`

```r
x <- 42L        # Integer
y <- 42         # Numeric

is.integer(x)   # TRUE
is.integer(y)   # FALSE
is.numeric(x)   # TRUE  - Integers are considered numeric!
is.numeric(y)   # TRUE
```

## When to Use Each

### Use Integer When:
- Working with whole numbers only
- Memory efficiency is important
- Exact representation is crucial
- Working with indices, counts, or IDs
- Large datasets where memory matters

### Use Numeric When:
- Working with decimal values
- Performing mathematical calculations
- Default choice for most numerical work
- Need the larger range of values

## Common Gotchas

### 1. Automatic Type Conversion
```r
x <- 5L          # Integer
y <- x + 0.1     # Result is numeric, not integer
class(y)         # "numeric"
```

### 2. Division Always Returns Numeric
```r
x <- 10L
y <- 2L
result <- x / y   # Result is numeric 5, not integer 5L
class(result)     # "numeric"
```

### 3. Large Integer Overflow
```r
# This will cause issues:
big_int <- 2147483648L  # Exceeds integer range
# Use numeric instead:
big_num <- 2147483648   # Works fine
```

## Best Practices

1. **Use integers for counting and indexing**
2. **Use numeric for calculations involving decimals**
3. **Be explicit with the `L` suffix when you need integers**
4. **Consider memory usage for large datasets**
5. **Use `typeof()` to check the exact storage type**

## Summary Table

| Aspect | Integer | Numeric |
|--------|---------|---------|
| Storage | 32-bit | 64-bit |
| Memory | Less | More |
| Range | ±2.1 billion | Much larger |
| Decimals | No | Yes |
| Precision | Exact | Floating-point |
| Speed | Faster | Slower |
| Created with | `L` suffix | Default |

## Example from Your Code

In your notebook:
```r
x <- 1000L  # Integer - uses L suffix
y <- 55L    # Integer - uses L suffix  
z <- 1      # Numeric - no L suffix

class(x)    # "integer"
class(y)    # "integer"
class(z)    # "numeric"
```

This demonstrates the key difference: the `L` suffix creates integers, while numbers without it are numeric by default.
