-- Test to ensure there are no null values in any column of dim_listings_cleansed
{{ no_nulls_in_columns(ref('dim_listings_cleansed')) }} 