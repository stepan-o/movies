/* ************************************************************************ */
/*         Queries to get counts of unique values by each column            */
/* ************************************************************************ */

-- name.basics table
SELECT COUNT(*) AS num_rows,
       COUNT(DISTINCT nconst) AS nconst_unq, -- candidate key
       COUNT(DISTINCT primaryname) AS primaryName_unq,
       COUNT(DISTINCT birthyear) AS birthYear_unq,
       COUNT(DISTINCT deathyear) AS deathYear_unq,
       COUNT(DISTINCT primaryprofession) AS primaryprofession_unq,
       COUNT(DISTINCT knownfortitles) AS knownfortitles_unq
FROM name_basics;

-- title.akas table
SELECT COUNT(*) AS num_rows,
       COUNT(DISTINCT(titleid, ordering)) AS titleid_ordering_unq, -- candidate key
       COUNT(DISTINCT titleid) AS titleid_unq,
       COUNT(DISTINCT ordering) AS ordering_unq,
       COUNT(DISTINCT title) AS title_unq,
       COUNT(DISTINCT region) AS region_unq,
       COUNT(DISTINCT language) AS language_unq,
       COUNT(DISTINCT types) AS types_unq,
       COUNT(DISTINCT attributes) AS attributes_unq,
       COUNT(DISTINCT isoriginaltitle) AS isoriginaltitle_unq
FROM "title.akas";

-- title.basics table
SELECT COUNT(*) AS num_rows,
       COUNT(DISTINCT tconst) AS tconst_unq, -- candidate key
       COUNT(DISTINCT titletype) AS titletype_unq,
       COUNT(DISTINCT primarytitle) AS primarytitle_unq,
       COUNT(DISTINCT originaltitle) AS originaltitle_unq,
       COUNT(DISTINCT isadult) AS isadult_unq,
       COUNT(DISTINCT startyear) AS startyear_unq,
       COUNT(DISTINCT endyear) AS endyear_unq,
       COUNT(DISTINCT runtimeminutes) AS runtimeminutes_unq,
       COUNT(DISTINCT genres) AS genres_unq
FROM title_basics;

-- title.crew table
SELECT COUNT(*) AS num_rows,
       COUNT(DISTINCT tconst) AS tconst_unq, -- candidate key
       COUNT(DISTINCT directors) AS directors_unq,
       COUNT(DISTINCT writers) AS writers_unq
FROM "title.crew";

-- title.episode table
SELECT COUNT(*) AS num_rows,
       COUNT(DISTINCT tconst) AS tconst_unq, -- candidate key
       COUNT(DISTINCT parenttconst) AS parenttconst_unq,
       COUNT(DISTINCT seasonnumber) AS seasonnumber_unq,
       COUNT(DISTINCT episodenumber) AS episodenumber_unq
FROM "title.episode";

-- title.principals table
SELECT COUNT(*) AS num_rows,
       COUNT(DISTINCT(tconst, ordering)) AS tconst_ordering_unq, -- candidate key
       COUNT(DISTINCT tconst) AS tconst_unq,
       COUNT(DISTINCT ordering) AS ordering_unq,
       COUNT(DISTINCT nconst) AS nconst_unq,
       COUNT(DISTINCT category) AS category_unq,
       COUNT(DISTINCT job) AS job_unq,
       COUNT(DISTINCT characters) AS characters_unq
FROM "title.principals";

-- title.ratings table
SELECT
    COUNT(*) AS row_count, -- candidate key
    COUNT(DISTINCT tconst) AS unq_tconst_count
FROM "title.ratings";