{% macro getStatus(date_cancelled, date_delivery, date_shipping) %}
    CASE
        WHEN {{ date_cancelled }} IS NOT NULL THEN 'Cancelled'
        WHEN {{ date_delivery }} IS NOT NULL THEN 'Delivered'
        WHEN {{ date_shipping }} IS NOT NULL THEN 'Shipped'
        ELSE 'In progress'
    END
{% endmacro %}