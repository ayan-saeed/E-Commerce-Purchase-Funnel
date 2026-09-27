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

#### Conversion Rate by Operating System
- Similar to Device Types, conversion rate is fairly consistent across operating systems (9.71%-12.05%), again closely matching the overall baseline of 11.17%
- Combined with the 'device_type' findings above, it can be concluded that neither device or operating system appear to be a meaningful driver of funnel conversion in this dataset

| Operating System | Total Purchased | Conversion Rate |
|---|---|---|
| Windows | 50 | 12.05% |
| Android | 64 | 11.55% |
| iOS | 46 | 10.75% |
| iPadOS | 21 | 10.66% |
| macOS | 20 | 9.71% |

#### Conversion Rate by Referral Source
- Referral Source shows the clearest variation in conversion found so far in the analysis
    - The conversion rate used in this analysis shows the share of customers from each referral source who went all the way through the funnel to make a purchase, out of everyone that source brought in
- 'Instagram Ads' (16.20%) convert at nearly double the rate of 'Email Campaign' (8.74%)
- 'Facebook Ads' generate the highest purchase volume (50) despite a lower rate than 'Instagram Ads'
- 'Instagram Ads' and 'Facebook Ads' (both paid advertising on socal media platforms) may attract more purchase-ready customers through targeted product ads, while 'Email Campaigns' and 'Affiliate' links may draw a broader audience less ready to buy

| Referral Source | Total Purchased | Conversion Rate |
|---|---|---|
| Instagram Ads | 29 | 16.02% |
| Facebook Ads | 50 | 13.44% |
| Direct | 32 | 10.63% |
| Referral | 20 | 10.05% |
| Google Search | 28 | 10.04% |
| Affiliate | 17 | 9.24% |
| Email Campaign | 25 | 8.74% |