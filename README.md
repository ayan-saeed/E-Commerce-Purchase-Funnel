# E-Commerce Purchase Funnel Analysis
Customer funnel analysis using SQL (PostgreSQL), Excel, and PowerBI, aiming to identify where customers drop off between viewing a product and completing a purchase, in addition to uncovering actionable insights to improve conversion and recover lost revenue. 

Note: This is a simulated dataset generated to reflect realistic e-commerce funnel behaviour, and does not represent a real company's customer data. 

## Repository Structure
- `/SQL` - PostgreSQL queries used for funnel analysis and data exploration
- `/Excel` - Formula-based analysis and data cleaning 
- `/PowerBI` - Interactive dashboard for visualising funnel drop-off and conversion
- `/dataset` - Raw and cleaned datasets used for this project

## Data Cleaning
Before analysis, the raw dataset required significant cleaning in Excel using Power Query, including: 
- splitting combined fields (`location`, `device_os`) into separate columns
- standardising inconsistent text casings and whitespaces across all columns 
- standardising inconsistent formats and values across columns (e.g. mixed date formats, and inconsistent yes/no values such as "Y", "Yes", "1")
- handling invalid negative values 
- removing duplicate rows

### Before 
![Dataset Before Data Cleaning](images/before-datacleaning.png)

### After 
![Dataset After Data Cleaning](images/after-datacleaning.png)

## SQL
### Finnel Overview 
- Of the 1800 customers who entered the funnel, only 201 (11.17%) went on to complete a purchase
- The largest single group - 822 customers (45.67%) - never progress beyond viewing a product at all, making it the single biggest point of customer loss in the entire funnel
- A large "Viewed only" group is common, and could point to several underlying causes: 
    - Casual browsing with no real intent to buy 
    - Product pages that don't clearly communicate value, or quality 
    - Customers who saw the price and decided not to continue  

| Funnel Stage | Customers | Share of Total |
|---|---|---|
| Viewed | 822 | 45.67% |
| Added to Cart | 561 | 31.17% |
| Checkout | 216 | 12.00% |
| Purchased | 201 | 11.17% |


### Business Findings
#### Conversion Rate by Device Type
- Conversion rate is nearly identical across all device types (10.05%-11.61%), closely matching the overall funnel conversion rate of 11.17%
- 'Mobile' accounts for the highest number of purchases (93), ahead of 'Desktop' (70) and 'Tablet' (38)
    - However, this reflects 'Mobile' having the largest customer base overall, not a higher conversion rate

| Device Type | Total Purchased | Conversion Rate |
|---|---|---|
| Mobile | 93 | 11.61% |
| Desktop | 70 | 11.27% |
| Tablet | 38 | 10.05% |