-- Test to ensure that no review was submitted before its listing was created
SELECT
    r.listing_id,
    r.review_date,
    l.created_at as listing_created_at
FROM {{ ref('fct_reviews') }} r
LEFT JOIN {{ ref('dim_listings_cleansed') }} l
    ON r.listing_id = l.listing_id
WHERE r.review_date < l.created_at 