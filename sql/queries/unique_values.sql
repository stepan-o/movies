/* ************************************************************************ */
/*         Queries to get counts of unique values by each column            */
/* ************************************************************************ */

-- name.basics table
SELECT COUNT(DISTINCT nconst) AS nconst_c,
       COUNT(DISTINCT primaryname) AS primaryName_c,
       COUNT(DISTINCT birthyear) AS birthYear_c,
       COUNT(DISTINCT deathyear) AS deathYear_c,
       COUNT(DISTINCT primaryprofession) AS primaryprofession_c,
       COUNT(DISTINCT knownfortitles) AS knownfortitles_c
FROM "name.basics";

-- title.akas table
SELECT COUNT(DISTINCT titleid) AS titleid_c,
       COUNT(DISTINCT ordering) AS ordering_c,
       COUNT(DISTINCT title) AS title_c,
       COUNT(DISTINCT region) AS region_c,
       COUNT(DISTINCT language) AS language_c,
       COUNT(DISTINCT types) AS types_c,
       COUNT(DISTINCT attributes) AS attributes_c,
       COUNT(DISTINCT isoriginaltitle) AS isoriginaltitle_c
FROM "title.akas";

-- title.basics table
SELECT COUNT(DISTINCT tconst) AS tconst_c,
       COUNT(DISTINCT titletype) AS titletype_c,
       COUNT(DISTINCT primarytitle) AS primarytitle_c,
       COUNT(DISTINCT originaltitle) AS originaltitle_c,
       COUNT(DISTINCT isadult) AS isadult_c,
       COUNT(DISTINCT startyear) AS startyear_c,
       COUNT(DISTINCT endyear) AS endyear_c,
       COUNT(DISTINCT runtimeminutes) AS runtimeminutes_c,
       COUNT(DISTINCT genres) AS genres_c
FROM "title.basics";

-- title.crew table
SELECT COUNT(DISTINCT tconst) AS tconst_c,
       COUNT(DISTINCT directors) AS directors_c,
       COUNT(DISTINCT writers) AS writers_c
FROM "title.crew";

-- title.episode table
SELECT COUNT(DISTINCT tconst) AS tconst_c,
       COUNT(DISTINCT parenttconst) AS parenttconst_c,
       COUNT(DISTINCT seasonnumber) AS seasonnumber_c,
       COUNT(DISTINCT episodenumber) AS episodenumber_c
FROM "title.episode";

-- title.principals table
SELECT COUNT(DISTINCT tconst) AS tconst_c,
       COUNT(DISTINCT ordering) AS ordering_c,
       COUNT(DISTINCT nconst) AS nconst_c,
       COUNT(DISTINCT category) AS category_c,
       COUNT(DISTINCT job) AS job_c,
       COUNT(DISTINCT characters) AS characters_c
FROM "title.principals";

-- title.ratings table
SELECT
    COUNT(*) AS row_count,
    COUNT(DISTINCT tconst) AS unq_tconst_count
FROM "title.ratings";
