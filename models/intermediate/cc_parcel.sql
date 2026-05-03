SELECT
    p.*
    , EXTRACT(MONTH FROM date_purchase) as month_purchase
    , {{ getStatus('date_cancelled', 'date_delivery', 'date_shipping') }} as status
FROM {{ ref("stg_raw__parcel") }} as p