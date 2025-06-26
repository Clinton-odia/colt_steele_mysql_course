-- CREATING USER TABLE
CREATE TABLE users(
  id int AUTO_INCREMENT primary key,
  user_name VARCHAR(100),
  age int,
  user_created date
);

-- CREATING THE PHOTOS TABLE
CREATE TABLE photos(
    id int AUTO_INCREMENT primary key,
    title varchar(100),
    date_created datetime,
    user_id int,
    foreign key(user_id) references users(id) on delete cascade
);

--CREATING FOLLOWERS/ FOLLOWING TABLE

CREATE TABLE follow(
  id int AUTO_INCREMENT primary key,
  _followee int,
  follower int,
  user_id int,
  foreign key(user_id) references users(id) on delete cascade

)
-- TABLES CONNECTED TO PHOTOS


-- CREATING HASHTAGS TABLE

CREATE TABLE hashtags(
  id int AUTO_INCREMENT primary key,
  tag varchar(120),
  photo_id int,
  foreign key(photo_id) references photos(id) on delete cascade
)

-- CREATING LIKE TABLES

CREATE TABLE likes(
  id int AUTO_INCREMENT primary key,
  like_count int,
  photo_id int,
  foreign key(photo_id) references photos(id) on delete cascade
)

-- CREATING COMMENTS TABLES
CREATE TABLE comments(
  id int AUTO_INCREMENT primary key,
  content varchar(200),
  time_created datetime,
  photo_id int,
  foreign key(photo_id) references photos(id) on delete cascade
)

-- CREATING THE POST TABLE

CREATE TABLE posts(
  id int AUTO_INCREMENT primary key,
  photo_id int,
  hashtag_id int,
  like_id int,
  comment_id int,
  foreign key(photo_id) references photos(id) on delete cascade
  foreign key(hashtag_id) references hashtags(id) on delete cascade
  foreign key(like_id) references likes(id) on delete cascade
  foreign key(comment_id) references comments(id) on delete cascade

)

