
# Final CMEE Bootcamp Assessment: Jiayi Chen

- Project directories were consistently well-organized, with separate folders for `code`, `data`, and `results`.

- You had an .gitignore, good! You could have done with more exclusions specific to certain weeks (remember that you can include/exclude subdirectories/files/patterns). You may [find this useful](https://www.gitignore.io).

- You had a good overall Readme which gave a sufficient overview of the Repo as a whole, and gave general details of things like languages used. You also had weekly Readme files which went into more details relevant to each week. The README files became more detailed and user-friendly over the weeks, incorporating dependencies, usage instructions, and summaries - good. You could have included versions of languages and dependencies/packages used. Also check out [this resource](https://github.com/jehna/readme-best-practices).


## Week  1


  - `.gitignore` excluded common temporary and system files - good.
  - The `results` folder contained some output files that should have been excluded.
  - README lacked detailed script descriptions or usage examples.
  - Scripts demonstrated foundational shell scripting skills.
    - `variables.sh` failed to handle edge cases, leading to syntax errors.
    - `tiff2png.sh` lacked checks for the presence of `.tiff` files.

## Week  2


- README included detailed script summaries and Python version requirements.
- Results folder was empty, adhering to good practices.
   - README could include troubleshooting tips for common errors in Python scripts.
- `align_seqs.py` needed better error handling for malformed inputs.
- Some scripts deviated from PEP 8 style guidelines.

## Week  3


- Dependencies such as `ggplot2` and `reshape2` were mentioned, aiding reproducibility.
   - README could provide detailed steps for installing R packages and running the scripts.
- Lack of inline comments in complex scripts hindered readability.

## Week  4


- README provided an overview of the Florida autocorrelation practical and associated scripts.
- The workflow was well-documented, covering script execution and LaTeX report generation.
- `TreeHeight.R` encountered issues with writing output due to missing directories.
- Error handling in `Florida.R` could be improved for cases with incomplete datasets. It implemented permutation testing effectively, visualizing trends with scatter plots and histograms. Unnecessary R commands included at the start. 
- The use of `cor.test` and permutation approaches was well-justified in the comments.
  - Could have added inline comments to explain the logic of statistical tests and visualization steps.
- The report provided a concise summary of the analysis. Hypotheses, methods, and conclusions were well-presented. Including a discussion of the significance of the observed correlation would have improved the scientific narrative, so also more discussion to include broader implications of the warming trends in Florida.

---

## Git Practices

### General Observations:
- Commit messages improved significantly over the weeks, becoming more descriptive and focused.
- `.gitignore` was updated to exclude unnecessary files like `.Rhistory` and `results/*`.

### Areas for Improvement:
- Early commits lacked detail (e.g., "update script"). Use specific messages like "Refactor Florida.R to include dynamic parameterization."
- The repository size increased to ~4.82 MiB by Week 4, likely due to binary files. Ensure large binary files (e.g., PDFs, images) are excluded or tracked using Git LFS.

---

## Overall Assessment

Overall, a good job! 

You demonstrated significant growth in programming, workflow organization, and documentation throughout the bootcamp. I was impressed by your efforts to understand as many details of the programming languages and coding as possible.

Commenting could be improved -- you are currently erring on the side of overly verbose comments at times (including in your readmes), which is nonetheless better than not commenting at all, or too little! This will improve with experience, as you will begin to get a feel of what is ``common-knowledge'' among programmers, and what stylistic idioms are your own and require explanation. In general though, comments should be written to help explain a coding or syntactical decision to a user (or to your future self re-reading the code!) rather than to describe the meaning of a symbol, argument or function (that should be in the function docstring in Python for example).

It was a tough set of weeks, but I hope they have given you a good start towards further training, a quantitative masters dissertation, and ultimately a career in quantitative biology! 

### (Provisional) Mark
*73*