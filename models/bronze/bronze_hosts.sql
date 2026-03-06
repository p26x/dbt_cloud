SELECT * FROM {{ source('staging', 'hosts') }} 
WHERE CREATED_AT > ( SELECT COALESCE(MAX(CREATED_AT),'1900-01-01') FROM {{ this }})