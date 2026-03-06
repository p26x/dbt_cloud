{% set configs=[
    {
        "table":"dev.gold.obt",
        "columns":"a.BOOKING_ID,a.LISTING_ID,a.HOST_ID,a.TOTAL_BOOKING_AMOUNT,a.ACCOMMODATES,a.BEDROOMS,a.BATHROOMS,a.PRICE_PER_NIGHT,a.RESPONSE_RATE",
        "alias":"a",
        "where_condition": "booking_created_at > (select max(booking_created_at) from dev.gold.obt)"
    }
]
%}

SELECT {{configs[0]['columns']}}
FROM {{configs[0]['table']}} AS {{configs[0]['alias']}}
WHERE {{configs[0]['where_condition']}}