SELECT Top {{ var('nb_restaurants_to_show') }} *
 from {{ref("stg_restaurants__turnover")}}
 order by turnover desc