WITH RankedPayments AS (
    SELECT
        p.staff_id,
        p.amount,
        ROW_NUMBER() OVER (PARTITION BY s.store_id ORDER BY p.amount DESC) AS Rank
    FROM
        payment p
            JOIN staff s ON p.staff_id = s.staff_id
    WHERE
        EXTRACT(YEAR FROM p.payment_date) = 2017
)
SELECT
    r.staff_id,
    s.first_name,
    s.last_name,
    s.store_id,
    r.amount
FROM
    RankedPayments r
        JOIN staff s ON r.staff_id = s.staff_id
WHERE
    r.Rank = 1;

