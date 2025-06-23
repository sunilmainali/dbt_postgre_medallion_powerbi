{{ config(materialized='table',schema='gold') }}

WITH ratings AS (
    SELECT userid, movieid, rating
    FROM {{ref('Movie_rating_view')}}
),

tags AS (
    SELECT userid, movieid, cleaned_tag
    FROM {{ref('Movie_tags_view')}}
),


movies AS (
    SELECT movieid, title, genres
    FROM {{ref('movies_view')}}
)

SELECT
    r.userid,
    r.movieid,
    r.rating,
    m.title,
    m.genres,
    r.rating_date,
    t.cleaned_tag
FROM silver."Movie_rating_view" r
LEFT JOIN silver."Movie_tags_view" t
    ON r.movieid = t.movieid
LEFT JOIN silver."movies_view" m
    ON r.movieid = m.movieid
LIMIT 10000

