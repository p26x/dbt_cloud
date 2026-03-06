{% set configs = [
    {
        "table":"DEV.SILVER.SILVER_BOOKINGS",
        "columns": "silver_bookings.*",
        "alias": "silver_bookings",
        "where_condition": "booking_created_at > (select max(booking_created_at) from DEV.GOLD.OBT)"
    },
    {
        "table":"DEV.SILVER.SILVER_LISTINGS",
        "columns": "silver_listings.*",
        "alias": "silver_listings",
        "join_condition": "silver_bookings.booking_lisitng_id=silver_listings.listing_id",
        "where_condition": "listing_created_at > (select max(listing_created_at) from DEV.GOLD.OBT)"

    },
    {
        "table":"DEV.SILVER.SILVER_HOSTS",
        "columns": "silver_hosts.*",
        "alias": "silver_hosts",
        "join_condition": "silver_listings.lisitng_host_id=silver_hosts.host_id",
        "where_condition": "host_created_at > (select max(host_created_at) from DEV.GOLD.OBT)"

    }

]
%}


SELECT 
{% for con in configs%}
    {{ con['columns'] }}{% if not loop.last %},{% endif %}
{% endfor %}
FROM
{% for con in configs%}
    {% if loop.first %}
        {{ con['table'] }} AS {{ con['alias'] }}
    {% else %}
        LEFT JOIN {{ con['table'] }} AS {{ con['alias'] }} ON {{ con['join_condition'] }}
    {% endif %}
{% endfor %}

{% for con in configs%}
    {% if loop.first %}
       WHERE ( {{ con['where_condition'] }}
    {% else %}
       OR {{ con['where_condition'] }}
    {% endif %}
    {% if loop.last %}){% endif %}
{% endfor %}


