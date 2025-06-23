{{ config(materialized='view') }}

SELECT
    tagid,
    LOWER(TRIM(tag)) AS cleaned_tag
FROM {{ source('bronze', 'genome_tags') }}