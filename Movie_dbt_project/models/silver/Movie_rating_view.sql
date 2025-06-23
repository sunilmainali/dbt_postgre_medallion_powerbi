{{config(materialized='view')}}

select userid,
    movieid,
    rating,
    CAST(to_timestamp(timestamp) AS date) as rating_date

from {{source("bronze","movie_ratings")}}