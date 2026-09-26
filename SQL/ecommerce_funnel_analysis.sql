-- Customers which reached each stage, including drop off rate
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
FROM CustomersEachStage