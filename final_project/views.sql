-- Обзоры фильмов, которые были подтверждены модератором --
DROP VIEW IF EXISTS reviews_view;
CREATE OR REPLACE VIEW reviews_view AS 
SELECT
  u.login   user_login,
  umr.title review_title,
  umr.body  review,
  m.title   movie_title
FROM user_movie_reviews umr
    JOIN users u  ON umr.user_id = u.id 
    JOIN movies m ON umr.movie_id = m.id
WHERE umr.moderator_approved = TRUE;


-- Жанры фильмов --
DROP VIEW IF EXISTS genres_movies_view;
CREATE OR REPLACE VIEW genres_movies_view AS  
SELECT 
  m.title movie_title,
  g.name genre_name
FROM movies m
    JOIN movies_genres mg ON m.id = mg.movie_id
    JOIN genres g         ON mg.genre_id = g.id