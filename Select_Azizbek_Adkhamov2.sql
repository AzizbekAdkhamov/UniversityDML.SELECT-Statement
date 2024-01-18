WITH TopMovies AS (
    SELECT
        f.film_id,
        f.title,
        f.release_year,
        COUNT(r.rental_id) AS rental_count
    FROM
        film f
            JOIN inventory i ON f.film_id = i.film_id
            JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY
        f.film_id, f.title, f.release_year
    ORDER BY
        rental_count DESC
    LIMIT 5
)
SELECT
    tm.*,
    EXTRACT(YEAR FROM CURRENT_DATE) - tm.release_year AS expected_age
FROM
    TopMovies tm;

