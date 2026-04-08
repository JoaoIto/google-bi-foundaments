SELECT
    address,
    COUNT(address) AS number_of_trees
FROM
    bigquery-public-data.san_francisco_trees.street_trees
WHERE
    address != "null"
GROUP BY address
ORDER BY number_of_trees DESC
LIMIT 10;