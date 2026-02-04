{{ config(materialized='table') }}

select * from semantic_view(
    {{ ref('dbt_semantic_view_materilization') }}
    DIMENSIONS booking_status,city
    METRICS total_booking_amount,total_rows
)
