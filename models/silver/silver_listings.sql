{{
  config(
    materialized = 'incremental',
    unique_key='LISTING_ID'
    )
}}


SELECT 
LISTING_ID,
HOST_ID AS LISITNG_HOST_ID,
PROPERTY_TYPE,
ROOM_TYPE,
CITY,
COUNTRY,
ACCOMMODATES,
BEDROOMS,
BATHROOMS,
PRICE_PER_NIGHT,
CREATED_AT AS LISTING_CREATED_AT,
{{ tag('price_per_night') }} AS PRICE_RATEING
FROM {{ ref('bronze_listings') }}
WHERE CREATED_AT > ( SELECT COALESCE(MAX(LISTING_CREATED_AT),'1900-01-01') FROM {{ this }})
