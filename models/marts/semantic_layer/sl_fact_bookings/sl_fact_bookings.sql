{{ config(
    materialized='view'
) }}

select *, current_date() as time_snapshot 
from {{ ref('fact_bookings') }}
