with 
payments as (
select * from {{ref('stg_stripe__payment')}}
)
,orders as 
(
    select * from {{ref('stg_jaffle_shop__orders')}}
)
, final as 
(
select  pay.order_id 
       ,ord.order_date
       ,ord.customer_id
       ,pay.amount
from payments pay
left join orders ord on ord.order_id=pay.order_id
)
select * from final
