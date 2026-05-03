SELECT
    p.*
    , EXTRACT(MONTH FROM date_purchase) as month_purchase
    , {{ getStatus('date_cancelled', 'date_delivery', 'date_shipping') }} as status
    , DATE_DIFF(date_shipping, date_purchase, DAY) as expedition_time
    , DATE_DIFF(date_delivery, date_shipping, DAY) as transport_time
    , DATE_DIFF(date_delivery, date_purchase, DAY) as delivery_time
FROM {{ ref("stg_raw__parcel") }} as p