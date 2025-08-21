# CodeBook

## 1. Overview

This dataset contains measurements from the **Samsung Human Activity Recognition (HAR) Dataset**. The data was collected from 30 subjects performing six different activities (`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`) while wearing a smartphone with embedded inertial sensors. The dataset includes accelerometer and gyroscope signals from the smartphone.

The purpose of this CodeBook is to describe the variables, transformations, and processing steps performed to clean and tidy the data.

---

## 2. Files

- **run_analysis.R** – R script that reads the raw data, cleans and transforms it, and produces the tidy dataset.  
- **CodeBook.md** – Documentation describing the dataset and cleaning steps.  
- **tidy_dataset.txt** – The resulting tidy dataset with the average of each variable for each subject and activity.
- **README.md** – This file, providing an overview of the project, instructions, and details about the repository contents.

---

## 3. Variables

### 3.1 Subject Information

| Variable | Description |
|----------|-------------|
| `subject_number` | Identifier of the participant (integer from 1 to 30). |

### 3.2 Activity Information

| Variable | Description |
|----------|-------------|
| `activity_code` | Numeric code for activity (1–6). |
| `activity` | Descriptive name of activity (`WALKING`, `STANDING`, etc.). |

### 3.3 Feature Measurements

The dataset contains **561 features** extracted from the raw signals. Only measurements on **mean** and **standard deviation** were retained in the filtered dataset.  

Variables were renamed for clarity:

| Original Prefix | Renamed To |
|----------------|-----------|
| `t` | `TimeDomain.` |
| `f` | `FrequencyDomain.` |
| `Acc` | `Acceleration.` |
| `Gyro` | `Gyroscope.` |
| `Jerk` | `Jerk.` |
| `Mag` | `Magnitude.` |
| `BodyBody` | `Body` (fixed typo) |
| `mean` | `Mean.` |
| `std` | `Std.` |
| `angle` | `Angle.` |
| `gravity` | `Gravity.` |

Parentheses, commas, and dashes were removed or replaced with dots for clarity.

**Examples of transformed variable names:**

- `tBodyAcc-mean()-X` → `TimeDomain.BodyAcceleration.Mean.X`  
- `fBodyGyro-std()-Z` → `FrequencyDomain.BodyGyroscope.Std.Z`  
- `angle(tBodyAccMean,gravity)` → `Angle.TimeDomain.BodyAcceleration.Mean.Gravity`

---

## 4. Data Cleaning Steps

1. **Read raw data**: Imported train/test sets (`X_train.txt`, `X_test.txt`), subjects, and activities.  
2. **Rename features**: Applied descriptive names with `str_replace_all()` to fix abbreviations, add domains, and clarify statistics.  
3. **Merge datasets**: Combined training and test datasets using `rbind()`.  
4. **Add activity labels**: Replaced numeric `activity_code` with descriptive `activity` names.  
5. **Select relevant variables**: Kept only mean and standard deviation measurements, along with `subject_number` and `activity`.  
6. **Create tidy dataset**: Grouped by `subject_number` and `activity` and calculated the **average of each variable** using `summarise_all(mean)`.

---

## 5. Output

The final tidy dataset contains:

- **Rows**: 180 (30 subjects × 6 activities)  
- **Columns**: 88 (2 identifier columns + 86 mean/std features)  

Each row represents the average value of each measurement for a given subject performing a given activity.

---
 
## 6. Notes

- The cleaning ensures all variable names are **descriptive and consistent**.  
- The tidy dataset can be used directly for analysis of average feature measurements per activity and subject.
