{% macro mockable_base(source_name, table_name) %}
    {% if target.name == "prod" %} {{ source(source_name, table_name) }}
    {% else %} {{ ref("sample_" ~ table_name.lower()) }}
    {% endif %}
{% endmacro %}
