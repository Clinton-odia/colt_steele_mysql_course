-- FIND THE FIVE OLDEST USERS FOR A REWARD

SELECT * FROM users order by created_at limit 5;

-- FINDING THE MOST POPULAR DAY FOR USERS SIGN UP

SELECT dayname(created_at) as day,
COUNT(*) as total 
FROM users 
GROUP by dayname(created_at) 
ORDER BY total DESC ;


-- FINDING THE INACTIVE USERS

SELECT username , image_url from users 
left join photos 
on users.id = photos.user_id  
where photos.id is null;

--- FINDING THE PHOTOS WITH THE MOST LIKES

SELECT 
    username,
    photos.id,
    photos.image_url, 
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- CALCULATE THE AVG POST

SELECT (SELECT Count(*) 
        FROM   photos) / (SELECT Count(*) 
                          FROM   users) AS avg; 

-- FIND THE TOP 5 COMMON HASHTAGS USED

SELECT tag_name, count(*) as total from photos 
join photo_tags on photos.id = photo_tags.photo_id
join tags on tags.id = photo_tags.tag_id
group by tag_name
order by total DESC
limit 5;

-- 7. Finding the bots - the users who have liked every single photo



SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos); 