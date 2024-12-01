"""
This script runs an R script (`TestR.R`) with verbose logging enabled and redirects 
the output and error logs to specific files.
"""
import subprocess

p = subprocess.Popen("Rscript --verbose TestR.R > ../results/TestR.Rout 2> ../results/TestR_errFile.Rout", shell=True).wait()