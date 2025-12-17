with customers as (

select * from {{ref('stg_jaffle_shop__customers')}}

),

payments as (
    select * from {{ ref ('stg_stripe__payment') }}
),


orders as (

select * from {{ref('stg_jaffle_shop__orders')}}
),

customer_orders_payment as (

    select
        ord.customer_id,
        min(ord.order_date) as first_order_date,
        max(ord.order_date) as most_recent_order_date,
        count(ord.order_id) as number_of_orders,
        sum(pay.amount)    as lifetime_value
    from orders ord
    left join payments pay on pay.order_id=ord.order_id
    group by 1

),


final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        cop.first_order_date,
        cop.most_recent_order_date,
        coalesce(cop.number_of_orders, 0) as number_of_orders,
        coalesce(lifetime_value,0) as lifetime_value
   from customers

    left join customer_orders_payment cop using (customer_id)
    

)

select * from final