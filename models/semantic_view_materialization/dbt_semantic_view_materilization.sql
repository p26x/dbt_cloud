{{ config(materialized='semantic_view') }}

TABLES(
    t1 AS {{ ref('silver_bookings') }} PRIMARY KEY(booking_id), 
    t2 as {{ref('silver_listings')}} PRIMARY KEY (listing_id))
RELATIONSHIPS(booking_to_listing AS t1(booking_lisitng_id) REFERENCES t2(listing_id))
DIMENSIONS(t1.booking_status as booking_status,t2.city as city)
METRICS(t1.total_rows AS COUNT(t1.booking_status),t2.total_listings as count(t2.LISTING_ID),t1.total_booking_amount as SUM(t1.total_booking_amount))
COMMENT='test semantic view'