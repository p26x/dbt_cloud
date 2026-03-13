{{ config(
    materialized='view'
) }}

select *,extract(year from booking_date) as Y,extract(month from booking_date) as M
from {{ source('staging', 'bookings') }} ORDER BY BOOKING_DATE DESC
