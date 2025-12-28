select 
    customer_id 
from 
    {{ ref('stg_jaffle_shop__customers') }} 
group by 
    customer_idd
having 
    count(*) > 1