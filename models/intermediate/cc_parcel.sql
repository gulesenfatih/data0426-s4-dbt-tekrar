SELECT
    p.*
    , EXTRACT(MONTH FROM date_purchase) as month_purchase
    , CASE 
        WHEN date_cancelled IS NOT NULL THEN 'Cancelled'
        WHEN date_delivery IS NOT NULL THEN 'Delivered'
        WHEN date_shipping IS NOT NULL THEN 'Shipped'
        ELSE 'In progress' 
      END as status
FROM {{ ref('stg_raw__parcel') }} as p