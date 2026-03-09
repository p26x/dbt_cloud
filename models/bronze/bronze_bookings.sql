{{ config(materialized='incremental') }}

{% set incremental_flag = 1 %}
{% set incremental_col = 'CREATED_AT' %}

SELECT * FROM {{ source('staging', 'bookings') }}
{% if is_incremental() %}
    WHERE {{ incremental_col }} > ( SELECT COALESCE(MAX({{ incremental_col }}),'1970-01-01') FROM {{ this }})
{% endif %}