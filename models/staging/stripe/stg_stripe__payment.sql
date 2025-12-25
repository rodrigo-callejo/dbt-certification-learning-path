with 

source as (

    select * from {{ source('stripe', 'payment') }}

),

renamed as (

    select
        id,
        orderid as order_id,
        paymentmethod,
        status,
        {{_mcr_cents_to_dollars("amount",4)}} ,
        created,
        _batched_at

    from source

)

select * from renamed