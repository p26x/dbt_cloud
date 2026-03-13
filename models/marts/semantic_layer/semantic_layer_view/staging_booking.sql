{{ config(
    materialized='view',
    schema='staging'
) }}

select *,extract(year from booking_date) as booking_year,extract(month from booking_date) as booking_month
from {{ source('staging', 'bookings') }} ORDER BY BOOKING_DATE DESC
