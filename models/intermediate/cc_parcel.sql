SELECT
    p.*
    , EXTRACT(MONTH FROM date_purchase) as month_purchase
FROM {{ ref('stg_raw__parcel') }} as p