# AE_Projects

### Tools & Concepts

- dbt (data build tool)
- SQL-based transformations
- Analytics engineering principles
- Modular, scalable project structure
- Materialisation
- Macros
- Quality Assurance

## Project 1: Stackoverflow 
## Project 2: Thelook_ecommerce 

## Overview Project: TheLook E-commerce 
This project is an end-to-end **analytics engineering** implementation built on top of the **TheLook E-commerce** dataset. It demonstrates how raw warehouse data can be transformed into **analytics-ready fact and dimension tables** using **dbt best practices**, with a strong focus on **data modelling, testing, documentation, and reliability**.
The project follows a layered dbt architecture from **staging → intermediate → marts**, and includes both **generic and singular tests** to enforce data quality and business rules.

## Tech Stack

* **Data Warehouse**: BigQuery
* **Transformation**: dbt
* **Data Modelling**: Kimball-style (facts & dimensions)
* **Version Control**: GitHub

## Project Structure

```text
models/
├── staging/
│   ├── thelook_ecommerce/
│   │   ├── _src_thelook_ecommerce.yml
│   │   ├── _stg_ecomm.yml
│   │   ├── stg_ecomm_order_items.sql
│   │   ├── stg_ecomm_products.sql
│   │   └── stg_ecomm_users.sql
│
├── intermediate/
│   └── thelook_ecommerce/
│       ├── _int_ecomm.yml
│       ├── int_order_Items_enriched.sql
│       └── int_orders_aggregated.sql
|       └── int_users_purchase.sql
│
├── marts/
│   └── thelook_ecommerce/
│       ├── facts/
│       │   ├── fact_orders.sql
│       ├── dimensions/
│       │   ├── dim_users.sql
│       │   └── dim_products.sql
│       └── _marts_ecomm.yml
│
└── tests/
    └── order_revenue_non_negative.sql
```

## Data Modelling Approach

#### Staging Layer: 

* Cleans and standardises raw source tables
* Renames columns to be analytics-friendly
* Applies basic type casting and formatting
* No business logic applied

**Staging Models:**

* `stg_ecomm__orders`
* `stg_ecomm__order_items`
* `stg_ecomm__products`
* `stg_users`


#### Intermediate Layer

* Introduces **business logic and transformations**
* Aggregates order-level metrics
* Joins multiple staging models where required
* Acts as a semantic bridge between staging and marts

**Examples:**

* Order-level revenue calculations
* Margin enrichment using product cost data
* Deduplicated and enriched order records


### Marts Layer

* Final **analytics-ready tables** optimised for BI and reporting
* Lean fact tables with consistent grain
* Enriched dimensions for slicing and filtering

#### Facts

* `fct_orders` – one row per order
* `fct_order_items` – one row per order item

#### Dimensions

* `dim_users`
* `dim_products`

## Testing 
Testing is a first-class citizen in this project. To ensure the data models are in the best format for downstream end users, both generic and singular tests are implemented to ensure data integrity.

- Generic Tests
Defined in YAML files and applied to models and columns:

* `not_null`
* `unique`
* `accepted_values`
* `relationships`

- Singular test:
- A singular test was applied to the total revunue metric to ensure no revenue is less than 0. This test can be found in the test folder of this project. To run any of the test here, you can use any of the functions below
  
```
dbt test test_type:singular
dbt test --select order_revenue_non_negative
```
## Macros
Macros are defined in the path [models-macros], a few macros were used to enhance the project and models performance


## Materilisation
The models in these projects are materilised as follows
- View: All staging models arematerilisated as view
- Intermediate and Marts: These are materilised as tables in the data warehouse. 

