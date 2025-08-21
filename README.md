# UCI-HAR-Project

This repository contains the R scripts and tidy dataset for the **Samsung Human Activity Recognition (HAR) Dataset**. The goal is to clean the raw data and produce a tidy dataset with the average of each measurement for each subject and activity.

---

## Files in the Repository

- **run_analysis.R** – R script to perform all data cleaning, transformation, and summarization.  
- **tidy_dataset.txt** – Final tidy dataset with averages of mean and standard deviation features.  
- **CodeBook.md** – Documentation describing the variables, dataset, and cleaning steps (this file).  

---

## How to Run

1. Place the **Samsung HAR Dataset** in your working directory, keeping the original folder structure (`train`, `test`, `features.txt`, `activity_labels.txt`).  
2. Open R or RStudio.  
3. Run the following command to execute the cleaning and produce the tidy dataset:

```R
source("run_analysis.R")

## Source

[Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
