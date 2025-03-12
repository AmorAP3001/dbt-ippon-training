SELECT RESTAURANT_IDENTIFIER,name, address, sum(AMOUNT) as turnover
from {{ ref("base_orders") }} as ord
inner join {{ ref("base_restaurants") }} as rest
ON ord.RESTAURANT_IDENTIFIER = rest.IDENTIFIER
group by RESTAURANT_IDENTIFIER, address,name