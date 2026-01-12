# 🛒 Product Analytics Portfolio: "The Look" Checkout Optimization

## 📄 Project Overview
This is a full-stack Product Analytics case study designed to optimize the checkout funnel for "The Look", a fictional eCommerce platform.


**The Business Problem:** The Product Team noticed high traffic but stagnant conversion rates.

**My Role:** As the Product Analyst, I was tasked with mapping the user journey, identifying drop-off points, and providing actionable recommendations using a modern analytics stack.


## 🛠️ Tech Stack
- **SQL (Google BigQuery):** Advanced data extraction, Window Functions for sessionization, and regex parsing.
- **Python (Polars):** High-performance data cleaning and feature engineering (Retention metrics).
- **Data Visualization (Plotly):** Exploratory analysis including heatmaps and retention histograms.
- **Product Analytics (Amplitude):** Funnel analysis, segmentation, and user retention cohorts.
- **BI Dashboard (Looker Studio):** Automated reporting for "Traffic," "Conversion Rate," and "Revenue."

## 🚀 Key Features & Workflow
### Phase 1: Advanced SQL Extraction
- Queried bigquery-public-data.thelook_ecommerce database.
- **Technique:** Used **SQL Window Functions** (LAG, LEAD) to calculate "Time Since Last Event" and define User Sessions (Sessionization) where raw IDs were missing.
- **Optimization:** Replaced expensive LIKE joins with REGEXP_EXTRACT to parse Product IDs from URLs effciently.

### Phase 2: Python EDA & Processing
- Used **Polars** instead of Pandas for faster processing of large event logs.
- **Feature Engineering:** Calculated the "Days Between Orders" metric to understand customer retention cycles.
- **Visualizations:**

    1.**📊 Retention Histogram:** Validated that the median repurchase time is ~15 days.

    2.**🔥 Purchasing Heatmap:** Identified Wednesday evenings (8 PM) as the peak time for conversions.

- **Smart Sampling:** Implemented **User-Based Downsampling** to reduce file size <10MB for Amplitude's free tier without breaking user funnel integrity.

### Phase 3: Amplitude Analysis
- **Funnel Analysis:** Mapped the View Product → Add to Cart → Purchase journey. Identified a 65% drop-off at the Cart stage.
- **Segmentation:** Discovered a technical discrepancy where **Safari users had a 20% lower conversion rate** than Chrome users, suggesting a browser-specific bug.

### Phase 4: Dashboarding
- Built a **[Looker Studio](https://lookerstudio.google.com/reporting/d9fc9cb1-5f3b-4c70-93ba-b720de2da590)** dashboard to monitor weekly KPIs.
- Created custom **Calculated Fields** for Conversion Rate and Cart-to-Purchase Rate.

## 📂 File Structure:

├── sql/
│   └── extraction_query.sql       # BigQuery SQL script with Window Functions
├── python/
│   └── eda_and_cleaning.py        # Polars script for cleaning & Plotly visuals
├── data/
│   └── amplitude_import_small.csv # (GitIgnore this if >100MB)
└── README.md

## 📊 Key Insights Generated
1. Browser Bug: Safari users convert significantly lower than Chrome users: recommended a QA sprint for iOS devices.
2. Retention Loop: The "Second Wave" of purchases happens at Day 45, validating the effectiveness of the monthly email newsletter.
3. High Intent Channel: Email traffic has the highest Cart-to-Purchase completion rate (5%), whereas Facebook traffic has the highest abandonment.

## 🔧 How to Run
1. **SQL:** Run extraction_query.sql in Google BigQuery on the public thelook_ecommerce dataset. Export the results as CSV.
2. **Python:**
   
     - pip install polars plotly pandas
     - python eda_and_cleaning.py
   
3. **Amplitude:** Import the generated amplitude_import_small.csv and build the Funnel Chart (View -> Cart -> Buy).


