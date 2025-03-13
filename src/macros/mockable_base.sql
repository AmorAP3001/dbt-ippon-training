{% macro mockable_base(source_name, table_name) %}
    {% if target.name == "ci" %} {{ ref("sample_" ~ table_name.lower()) }}
    {% elif target.name == "dev" and var('test_from_sample')=='true' %} {{ ref("sample_" ~ table_name.lower()) }}
    {% else %} {{ source(source_name, table_name) }}
    {% endif %}
{% endmacro %}
