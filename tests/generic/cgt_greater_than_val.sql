{% test greater_than_val(model,column_name,column_group,val)  %}
    select
        sum( coalesce({{ column_name }},0) ) val,
        {{ column_group }}
    from
        {{ model }}
    group by 
       {{ column_group }}
    having 
       sum(coalesce({{ column_name }}, 0)) <= {{ val }}
{% endtest %}