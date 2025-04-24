{{
    config(
        materialized='incremental',
        unique_key = ['identifier','hour'],
        incremental_strategy='merge',
        merge_exclude_columns = ['job_insert_at_utc','job_insert_id'],
        tmp_relation_type ='table'
    )
}}
select 
    d.identifier                                           as identifier
    , d.name as name
    , date_trunc('hour',to_timestamp(odf.created_at))      as hour
    , count(*)                                             as nb_ordered
    , sum(d.selling_price)                                 as global_turnover
    , sum(d.selling_price - d.production_cost )             as global_profit
    ,{{add_technical_columns()}}
from 
    {{ ref('stg_orders__dishes_flattened') }} as odf
left join 
    {{ ref('base_dishes') }} as d
        on odf.dishes_id = d.identifier
{% if is_incremental() %}
   where odf.created_at >= (select coalesce(max(hour), '1900-01-01') from {{ this }})
{% endif %}

group by 1,2,3