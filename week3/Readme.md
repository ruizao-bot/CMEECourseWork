
# Week 3 R Codes

## Overview

This repository contains R scripts developed during Week 3 of the
course. The scripts demonstrate various programming concepts.

## Author

Chen Jiayi E-mail: [jc224\@ic.ac.uk](mailto:jc224@ic.ac.uk){.email}

## Language

R version 4.4.1 (2024-06-14)

## Structure

### Code list

**basic_io.R** - A simple script to illustrate R input-output.

control_flow.R - assigns a boolean value, generates a random number for
conditional checks

**control_flow.R** - initializes a boolean variable, generates a random
number, and demonstrates conditionals and loops to perform various print
operations based on specified conditions

**break.R** - initializes i to 0 and enters an infinite while loop that
prints i and increments it until i reaches 10, at which point the break
statement stops the loop.

**next.R** - iterates from 1 to 10, printing only the odd numbers by
using a condition to skip even numbers.

**boilerplate.R** - defines a function `MyFunction` in R, which takes
two arguments, prints each argument’s value and data type, and returns
both arguments as a vector.

**R_conditionals.R** - defines three functions in R to check integer
properties:

1.  **`is.even`**: Checks if a number is even or odd by testing
    divisibility by 2.

2.  **`is.power2`**: Checks if a number is a power of 2 by verifying if
    the base-2 logarithm is an integer.

3.  **`is.prime`**: Determines if a number is prime by checking
    divisibility only by integers between 2 and `n-1`.

Each function is tested with sample inputs to confirm their
functionality.

**TreeHeight.R** - calculates the height of a tree given the angle of
elevation (in degrees) and the distance from the tree's base.

**Vectorize1.R** - compares the execution time for summing all elements
in a 1000×1000 matrix `M` in two ways:

1.  **Using Nested Loops**: The custom `SumAllElements` function
    iterates over each matrix element with nested loops, summing them
    individually.

2.  **Using a Vectorized Function**: The built-in `sum()` function,
    which leverages R’s vectorized operations, efficiently sums all
    elements in the matrix.

**preallocate.R** - defines two functions to compare performance with
and without pre-allocation of vector memory

**apply1.R** - creates a 10×10 matrix `M` with random values from a
normal distribution and calculates row and column statistics

**apply2.R** - make a 10×10 matrix `M` is created with random values
from a normal distribution. The `apply` function is used to apply
`SomeOperation` to each row of the matrix (indicated by the `1`
argument). The result is a new matrix where each row has been processed
by `SomeOperation`, either scaled by 100 or left unchanged, depending on
the sum of the respective row.

**sample.R** - defines several functions for conducting a sampling
experiment from a given population, each with different approaches to
handle the results.

**browse.R** - simulates exponential growth over a specified number of
generations and plots the results.

**try.R** - defines a function to compute the mean of a sampled
population. The main part of the code generates a random population and
visualizes its distribution with a histogram.

**DataWrang.R** - loading, inspecting, transforming, and analyzing the
dataset.

**Girko.R** - generates and visualizes the eigenvalues of a random
matrix, overlaid with an ellipse to illustrate the distribution of the
eigenvalues.

**MyBars.R** - reads data from a text file and creates a plot using the
`ggplot2` package.

1.  import and inspect data

2.  create the ggplot object and add line ranges, annotations and aet
    axis labels and theme

3.  save the plot

**plotLin.R** - generates a dataset, performs linear regression, and
creates a plot to visualize the results along with a regression line.

### Data

EcolArchives-E089-51-D1.csv

PoundHillData.csv

PoundHillMetaData.csv

Results.txt

trees.csv
