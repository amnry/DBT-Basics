with src_listings as (
    select * from {{ ref('src_listings') }}
)

select
    listing_id, 
    listing_name,
    room_type,
    -- Adjust minimum_nights to ensure no listing has a value of 0
    case 
        when minimum_nights = 0 then 1  -- Set minimum_nights to 1 if it is currently 0
        else minimum_nights  -- Otherwise, keep the original minimum_nights value
    end as minimum_nights,
    host_id,
    -- Remove the dollar sign from the price string
    replace(
        price_str,
        '$'
    )::number(  -- Convert the resulting string to a number
        10,
        2
    ) as price,
    created_at,
    updated_at
from src_listings

