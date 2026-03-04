{% set configs=[
    {
        "table":"dev.gold.obt",
        "columns":"a.BOOKING_ID,a.LISTING_ID,a.HOST_ID,a.TOTAL_BOOKING_AMOUNT,a.ACCOMMODATES,a.BEDROOMS,a.BATHROOMS,a.PRICE_PER_NIGHT,a.RESPONSE_RATE",
        "alias":"a"
    }
]
%}

SELECT {{configs[0]['columns']}}
FROM {{configs[0]['table']}} AS {{configs[0]['alias']}}