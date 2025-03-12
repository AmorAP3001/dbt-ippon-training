select
    identifier
    , name
    , selling_price
    , production_cost
    , type
from 
    {{ source("raw_data", "dishes") }}