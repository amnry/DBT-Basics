# Airbnb Data Transformation Project

This dbt project transforms raw Airbnb data into a clean, analytics-ready format. It includes dimension and fact tables that can be used for various analytical purposes.

## Project Structure

```
models/
├── dim/                    # Dimension models
│   ├── dim_hosts_cleansed.sql
│   ├── dim_listings_cleansed.sql
│   └── dim_listings_w_hosts.sql
├── fct/                    # Fact models
│   └── fct_reviews.sql
├── mart/                   # Mart models
│   └── mart_fullmoon_reviews.sql
├── src/                    # Source models
│   ├── src_hosts.sql
│   ├── src_listings.sql
│   └── src_reviews.sql
└── schema.yml              # Documentation and tests
```

## Models

### Dimension Models
- `dim_hosts_cleansed`: Cleaned host data with null handling
- `dim_listings_cleansed`: Cleaned listing data with standardized formats
- `dim_listings_w_hosts`: Combined listing and host information

### Fact Models
- `fct_reviews`: Review data with standardized date formats

### Mart Models
- `mart_fullmoon_reviews`: Reviews analyzed in relation to full moon dates

### Source Models
- `src_hosts`: Raw host data
- `src_listings`: Raw listing data
- `src_reviews`: Raw review data

## Data Quality Tests

The project includes several data quality tests:
- Unique and not-null constraints on key identifiers
- Accepted value tests for boolean fields
- Custom tests for data consistency (e.g., review dates after listing creation)
- Null value checks in dimension tables

## Getting Started

1. Install dependencies:
   ```bash
   pip install dbt-snowflake
   ```

2. Configure your profiles.yml with your Snowflake credentials

3. Run the project:
   ```bash
   dbt run
   ```

4. Run tests:
   ```bash
   dbt test
   ```

5. Generate documentation:
   ```bash
   dbt docs generate
   dbt docs serve
   ```

## Data Sources

The project uses the following source tables from the AIRBNB.RAW schema:
- `raw_listings`
- `raw_reviews`
- `raw_hosts`

## Resources
- [dbt bootcamp](https://www.udemy.com/certificate/UC-b496620a-ab8d-41f3-b0dc-8b9364605fc3/) - Comprehensive Udemy course on dbt
