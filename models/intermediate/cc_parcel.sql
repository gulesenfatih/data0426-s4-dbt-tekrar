with nb_products as (
    SELECT
        parcel_id
        , count(*) as nb_models
        , sum(quantity) as qty
    FROM {{ ref('stg_raw__parcel_product') }}
    GROUP BY parcel_id
)


SELECT
    p.*
    , EXTRACT(MONTH FROM date_purchase) as month_purchase
    , {{ getStatus('date_cancelled', 'date_delivery', 'date_shipping') }} as status
    , DATE_DIFF(date_shipping, date_purchase, DAY) as expedition_time
    , DATE_DIFF(date_delivery, date_shipping, DAY) as transport_time
    , DATE_DIFF(date_delivery, date_purchase, DAY) as delivery_time
    , IF(DATE_DIFF(date_delivery, date_purchase, DAY) > 3, (DATE_DIFF(date_delivery, date_purchase, DAY)-3), NULL) as delay
FROM {{ ref("stg_raw__parcel") }} as p
LEFT JOIN nb_products as nbp
    ON nbp.parcel_id = p.parcel_id