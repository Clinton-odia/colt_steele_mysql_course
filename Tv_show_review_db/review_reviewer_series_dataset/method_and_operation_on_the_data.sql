-- SELECT THE TITLE AND RATING

SELECT title, rating from series
JOIN reviews
on
series.id=reviews.series_id LIMIT 15;

-- AVERAGE GRADE

SELECT title,
AVG(rating) as avg_rating from series
JOIN reviews
on
series.id=reviews.series_id
GROUP BY series.id
order by avg_rating
limit 10;

-- REVIWER'S FIRST NAME, LAST NAME AND THEIR RATING

SELECT first_name,
last_name,
rating from reviewers 
join reviews
on reviewers.id = reviews.reviewers_id;


--SERIES WITHOUT REVIEWS
SELECT title AS unreviewed_series
FROM series
LEFT JOIN reviews
    ON series.id = reviews.series_id
WHERE rating IS NULL;


-- AVERAGE RATING OF GENRE

SELECT genre,
ROUND(AVG(rating),2) as avg_rating from series
left join reviews on series.id = reviews.series_id
GROUP BY genre;


-- REVIEWER, THEIR AVERAGE RATING, MIN AND MAX RATING AND STATUS

SELECT first_name, 
last_name,
IFNULL(count(rating),0) AS "COUNT",
IFNULL(MIN(rating),0) as "Min",
IFNULL(MAX(rating),0) as "Max",
IFNULL(ROUND(AVG(rating),2), 0) as "AVG",
CASE
WHEN rating >= 3 THEN "ACTIVE"
ELSE "INACTIVE"
END AS "STATUS"
from reviewers
left join reviews
on reviewers.id = reviews.reviewers_id
GROUP by first_name,last_name
ORDER BY max DESC;

-- Title, rating and reviewers
SELECT title,rating, concat(first_name," ", last_name) as Reviewer from reviewers 
join reviews on reviewers.id = reviews.reviewers_id
join series on series.id = reviews.series_id;

