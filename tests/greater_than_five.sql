select
    sum(amount) amount_sum,
    customer_id
from
    {{ ref("fct_orders") }}
group by 
    customer_id
having 
    sum(amount) <= 5
  