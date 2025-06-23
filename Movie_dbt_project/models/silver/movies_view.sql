{{config(materialized='view')}}

select movieid,
        lower(trim(title)) as title,
        lower(trim(genres)) as genres

from {{source("bronze","movie")}}