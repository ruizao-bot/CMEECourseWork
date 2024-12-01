---
editor_options: 
  markdown: 
    wrap: 72
---

# Week 4 Codes

## Overview

This repository contains R scripts developed during Week 4 of the course
and a tex file to generate PDF report. Below is a summary of each script
and its purpose.

Author

Chen Jiayi E-mail: [jc224\@ic.ac.uk](mailto:jc224@ic.ac.uk){.email}

## Language

R version 4.4.1 (2024-06-14)

## Sturcture 

### code list 

**TreeHeight.R** - Calculates the height of trees using their angle of
elevation and distance from the base. Key Features.

**Florida.R** - Analyzes temperature trends in Florida from 1901 to 2000
using permutation tests. Visualizes results with Scatter plot (plot.png)
showing the temperature trend. Histogram (histogram_plot.png) of
permuted correlation coefficients.

**Florida.tex** - A LaTeX document summarizing the Florida temperature
analysis.

Usage: Compile the .tex file using a LaTeX editor or pdflatex. Ensure
the required plots (plot.png and histogram_plot.png) are in the
../results/ directory.

**PP_Regress.R** - Performs regression analysis on ecological data
(predator-prey relationships). It visualizes predator-prey mass
relationships with faceted scatter plots and linear regression lines,
and save outputs a PDF plot and regression results in a CSV file.

### Data

EcolArchives-E089-51-D1.csv

KeyWestAnnualMeanTemperature.RData

trees.csv