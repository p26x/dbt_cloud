{{config(materialized = 'ephemeral')}}

WITH gold_booking AS(
    SELECT BOOKING_ID,BOOKING_DATE,BOOKING_STATUS,BOOKING_CREATED_AT FROM {{ref('obt')}}
)SELECT * FROM gold_booking 