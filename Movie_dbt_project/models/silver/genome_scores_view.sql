{{config(materialized='view')}}

select movieid,
        tagid,
        round(relevance,3) as relevance

from {{source("bronze","genome_scores")}}