SELECT
    actor_id,
    first_name,
    last_name,
    last_update,
    CURRENT_DATE - last_update AS days_since_last_act
FROM
    actor
ORDER BY
    days_since_last_act DESC;



