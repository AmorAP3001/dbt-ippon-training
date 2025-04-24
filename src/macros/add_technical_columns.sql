{% macro add_technical_columns() %}
    '{{ invocation_id }}'       as job_insert_id
    , current_timestamp()       as job_insert_at_utc
    , '{{ run_started_at }}'    as run_started_at_utc
    , current_timestamp()       as job_modify_at_utc
    , '{{ invocation_id }}'      as job_modify_id
{% endmacro %}