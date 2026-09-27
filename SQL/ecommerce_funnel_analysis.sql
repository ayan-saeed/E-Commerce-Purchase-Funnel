-- Customers which reached each stage, including share of total customers
WITH CustomersEachStage as (
    SELECT
        funnel_stage_reached as funnel_stage,
        COUNT(customer_id) as number_of_customers
    FROM customer_funnel
    GROUP BY funnel_stage_reached
)

SELECT
    funnel_stage,
    number_of_customers,
    ROUND(CAST(number_of_customers as DECIMAL) / SUM(number_of_customers) over () * 100, 2) as drop_off_rate
FROM CustomersEachStage;

-- Completion rate for device_type
WITH PurchasedByDevice as(
    SELECT
        device_type,
        COUNT(customer_id) as total_customers,
        SUM(CASE
            WHEN funnel_stage_reached = 'Purchased' THEN 1
            ELSE 0 END) as purchased_by_device
    FROM customer_funnel
    GROUP BY device_type
)

SELECT
    device_type,
    purchased_by_device as total_purchased,
    ROUND(CAST(purchased_by_device as DECIMAL) / CAST(total_customers as DECIMAL) * 100, 2) as conversion_rate
FROM PurchasedByDevice;

-- Completion rate for operating_system
WITH PurchasedByOS as(
    SELECT
        operating_system,
        COUNT(customer_id) as total_customers,
        SUM(CASE
            WHEN funnel_stage_reached = 'Purchased' THEN 1
            ELSE 0 END) as purchased_by_device
    FROM customer_funnel
    GROUP BY operating_system
)

SELECT
    operating_system,
    purchased_by_device as total_purchased,
    ROUND(CAST(purchased_by_device as DECIMAL) / CAST(total_customers as DECIMAL) * 100, 2) as conversion_rate
FROM PurchasedByOS;

-- Conversion rate by referral_source
WITH PurchasedByReferral as(
    SELECT
        referral_source,
        SUM(CASE
            WHEN funnel_stage_reached = 'Purchased' THEN 1
            ELSE 0 END) as purchased_by_source,
        SUM(CASE
            WHEN funnel_stage_reached = 'Viewed' OR 
                funnel_stage_reached = 'Added to Cart' OR 
                funnel_stage_reached = 'Checkout' THEN 1
            ELSE 0 END) as viewed_or_further_by_source
    FROM customer_funnel
    GROUP BY referral_source
)

SELECT 
    referral_source,
    purchased_by_source,
    ROUND(CAST(purchased_by_source as DECIMAL) / CAST(viewed_or_further_by_source + purchased_by_source as DECIMAL) * 100, 2) as conversion_rate
FROM PurchasedByReferral
ORDER BY conversion_rate DESC;