{{config(materialized='view')}}

select userid,
        movieid,
        lower(replace(trim(tag),'-',' ')) as cleaned_tag,
        cast(to_timestamp(timestamp) as date) as tag_date
from {{source("bronze","movie_tags")}}   
