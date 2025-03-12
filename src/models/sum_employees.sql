select sum(nb_employees) as sum_employees from {{ source('raw_data', 'RESTAURANTS') }}

