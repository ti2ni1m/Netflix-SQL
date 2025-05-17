-- Which movies and shows on Netflix ranked in the top 10 and bottom 10 based on their IMDB scores?

-- Top Movies
SELECT title, 
type, 
imdb_score
FROM netflix.titles
WHERE imdb_score >= 8.0
AND type = 'MOVIE'
ORDER BY imdb_score DESC
LIMIT 10;

-- Top Shows
SELECT title, 
type, 
imdb_score
FROM netflix.titles
WHERE imdb_score >= 8.0
AND type = 'SHOW'
ORDER BY imdb_score DESC
LIMIT 10;


-- Bottom Movies
SELECT title, 
type, 
imdb_score
FROM netflix.titles
WHERE type = 'MOVIE'
ORDER BY imdb_score ASC
LIMIT 10;

-- Bottom Shows
SELECT title, 
type, 
imdb_score
FROM netflix.titles
WHERE type = 'SHOW'
ORDER BY imdb_score ASC
LIMIT 10;




-- How many movies and shows fall in each decade in Netflix's library?

SELECT 
  FLOOR(release_year / 10) * 10 AS decade,
  type,
  COUNT(*) AS count
FROM 
  netflix.titles
WHERE 
  release_year IS NOT NULL
GROUP BY 
  decade, type
ORDER BY 
  decade, type;



-- How did age-certifications impact the dataset?

SELECT 
  age_certification,
  COUNT(*) AS count
FROM 
  netflix.titles
GROUP BY 
  age_certification
ORDER BY 
  count DESC;