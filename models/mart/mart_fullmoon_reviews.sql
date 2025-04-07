{{
    config(
        materialized = 'table'
    )
}}

WITH fct_reviews AS (
    SELECT * FROM {{ ref('fct_reviews') }}  -- Selecting all records from the fact reviews table
),
full_moon_dates AS (
    SELECT * FROM {{ ref('seed_full_moon_dates') }}  -- Selecting all records from the full moon dates seed
)
SELECT
    r.*,  -- Selecting all columns from the fact reviews
    CASE
        WHEN fm.full_moon_date IS NULL THEN 'not full moon'  -- Checking if the full moon date is null
        ELSE 'full moon'  -- If not null, indicating it is a full moon
    END AS is_full_moon  -- Creating a new column to indicate full moon status
FROM
    fct_reviews r  -- Using the fact reviews as the main table
LEFT JOIN
    full_moon_dates fm  -- Left joining with the full moon dates
ON 
    (TO_DATE(r.review_date) = DATEADD(DAY, 1, fm.full_moon_date))  -- Joining condition to match review dates with full moon dates