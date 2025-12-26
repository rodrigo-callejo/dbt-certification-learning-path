with generate_sk as (
select 
customer_id
,order_date
,{{ dbt_utils.generate_surrogate_key(['customer_id', 'order_date'])}} as customer_md5
,count(*) as number_of_orders
from {{ref("stg_jaffle_shop__orders")}}
group by 
customer_id
,order_date
)
select
*
from
generate_sk