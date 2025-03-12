{% set payment_methods = dbt_utils.get_column_values(table=source("raw_data","ORDERS"), column='payment_method') %}

SELECT RESTAURANT_IDENTIFIER,
    {% for payment_method in payment_methods %}
    COALESCE(sum(case when payment_method = '{{payment_method}}' then amount end),0) as {{payment_method}}_amount,
    {% endfor %}
 from {{ ref("base_orders") }}
 group by RESTAURANT_IDENTIFIER