SELECT distinct
    identifier::number as identifier
    , restaurant_identifier::number as restaurant_identifier
    , parse_json(dishes_ids) as dishes_ids
    , payment_method::string as payment_method
    , amount::number(30, 8) as amount
    , created_at::timestamp as created_at
     from {{mockable_base("raw_data","ORDERS")}}
