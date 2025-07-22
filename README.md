# 🐶 Comparative Analysis of Rehoming Time by Dog Breed

This project analyses rehoming time among three popular dog breeds—**Border Collie**, **Shih Tzu**, and **Staffordshire Bull Terrier**—to uncover differences in adoption timelines using statistical modelling techniques in R.

Developed as part of my MSc coursework in **Statistical Theory & Methods** at the University of Leeds, this project demonstrates data cleaning, exploratory analysis, distribution testing, hypothesis testing, and inference.

---

## 🎯 Objectives
- Compare mean rehoming times between breeds
- Assess distribution (normality, exponential) of rehoming time
- Apply hypothesis tests (Z, T, and KS tests) based on sample size and distribution

---

## 📊 Dataset
- Original dataset: 324 observations of dog adoption metrics (not shared due to data policy)
- Cleaned dataset: 309 observations used in the analysis
- Features: `Breed`, `Rehomed`, `Visited`, `Health`, etc.

> 🔒 *Due to data privacy, a simulated dataset is included instead for reproducibility.*

---

## 🛠 Methods Used
- **Data cleaning** (removing 99999, NA)
- **Numerical summaries** for each breed
- **Visualisation**: Boxplots, Histograms, QQ plots
- **Distribution tests**: Shapiro-Wilk, Kolmogorov-Smirnov
- **Hypothesis tests**:
  - Z-test (for n > 30)
  - T-test (for n < 30 or unknown variance)
  - Confidence intervals & pairwise comparisons

---

## 🧪 Key Results

| Breed                   | Mean Rehomed | Distribution | Test Used |
|-------------------------|--------------|--------------|-----------|
| Border Collie           | 20.47 weeks  | Normal       | Z-test    |
| Shih Tzu                | 19.5 weeks   | Normal       | T-test    |
| Staffordshire Bull Terriers | 19.34 weeks | Non-normal    | T-test    |

All breeds showed **significantly lower mean rehoming times** than the hypothesised 27 weeks.

---

## 📁 Project Files

| File | Description |
|------|-------------|
| `scripts/rehoming_analysis.R` | Complete R code for data processing and analysis |
| `report/dog_breed_rehoming_report.pdf` | Full academic report (10+ pages) |
| `data/simulated_dog_data.csv` | Simulated version of dataset for demonstration |

---

## 👩‍💻 Tools Used
- R (base, `ggplot2`, `stats`, `t.test`, `ks.test`)
- RStudio
- GitHub

---

## 👩 Author

**Shekhina Mary Jebaraj**  
MSc Data Science, University of Leeds  
📍 Leeds, UK  
📧 shekhinamaryjebaraj@gmail.com  
🔗 [LinkedIn](https://linkedin.com/in/shekhinamaryjebaraj)

---

## 🔗 Citation (if used)

> Jebaraj, S.M. (2023). *Comparative Analysis of Rehoming Time in Three Dog Breeds*, University of Leeds – MSc Project.
