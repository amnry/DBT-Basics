with src_hosts as (
    select * from {{ ref('src_hosts') }}
)

select
    host_id,
    case 
        when host_name is null then 'Anonymous'  -- Replace null host_name with 'Anonymous'
        else host_name  -- Retain the original host_name if not null
    end as host_name,
    created_at,
    updated_at,
    is_superhost
from src_hosts
