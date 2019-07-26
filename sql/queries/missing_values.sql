/* ************************************************************************ */
/*         Queries to get counts of null values by each column              */
/* ************************************************************************ */

-- name.basics table
SELECT SUM(CASE WHEN nconst IS NULL THEN 1 ELSE 0 END) AS nconst_c,
       SUM(CASE WHEN primaryname IS NULL THEN 1 ELSE 0 END) AS primaryname_c,
       SUM(CASE WHEN birthyear IS NULL THEN 1 ELSE 0 END) AS birthyear_c,
       SUM(CASE WHEN deathyear IS NULL THEN 1 ELSE 0 END) AS deathyear_c,
       SUM(CASE WHEN primaryprofession IS NULL THEN 1 ELSE 0 END) AS primaryprofession_c,
       SUM(CASE WHEN knownfortitles IS NULL THEN 1 ELSE 0 END) AS knownfortitles_c
FROM "name.basics";

-- title.akas table
SELECT SUM(CASE WHEN titleid IS NULL THEN 1 ELSE 0 END) AS titleid_null_c,
       SUM(CASE WHEN ordering IS NULL THEN 1 ELSE 0 END) AS ordering_null_c,
       SUM(CASE WHEN title IS NULL THEN 1 ELSE 0 END) AS title_null_c,
       SUM(CASE WHEN region IS NULL THEN 1 ELSE 0 END) AS region_null_c,
       SUM(CASE WHEN language IS NULL THEN 1 ELSE 0 END) AS language_null_c,
       SUM(CASE WHEN types IS NULL THEN 1 ELSE 0 END) AS types_null_c,
       SUM(CASE WHEN attributes IS NULL THEN 1 ELSE 0 END) AS attributes_null_c,
       SUM(CASE WHEN isoriginaltitle IS NULL THEN 1 ELSE 0 END) AS isoriginaltitle_null_c
FROM "title.akas";

-- title.basics table
SELECT SUM(CASE WHEN tconst IS NULL THEN 1 ELSE 0 END) AS tconst_c,
       SUM(CASE WHEN titletype IS NULL THEN 1 ELSE 0 END) AS titletype_c,
       SUM(CASE WHEN primarytitle IS NULL THEN 1 ELSE 0 END) AS primarytitle_c,
       SUM(CASE WHEN originaltitle IS NULL THEN 1 ELSE 0 END) AS originaltitle_c,
       SUM(CASE WHEN isadult IS NULL THEN 1 ELSE 0 END) AS isadult_c,
       SUM(CASE WHEN startyear IS NULL THEN 1 ELSE 0 END) AS startyear_c,
       SUM(CASE WHEN endyear IS NULL THEN 1 ELSE 0 END) AS endyear_c,
       SUM(CASE WHEN runtimeminutes IS NULL THEN 1 ELSE 0 END) AS runtimeminutes_c,
       SUM(CASE WHEN genres IS NULL THEN 1 ELSE 0 END) AS genres_c
FROM "title.basics";

/* ************************************************************************ */
/*       Queries to get percentages of non-null values by each column       */
/* ************************************************************************ */

-- name.basics table
SELECT 100.0 * SUM(CASE WHEN nconst IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS nconst_p,
       100.0 * SUM(CASE WHEN primaryname IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS primaryname_p,
       100.0 * SUM(CASE WHEN birthyear IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS birthyear_p,
       100.0 * SUM(CASE WHEN deathyear IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS deathyear_p,
       100.0 * SUM(CASE WHEN primaryprofession IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS primaryprofession_p,
       100.0 * SUM(CASE WHEN knownfortitles IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS knownfortitles_p
FROM "name.basics";

-- title.akas table
SELECT 100.0 * SUM(CASE WHEN titleid IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS titleid_null_p,
       100.0 * SUM(CASE WHEN ordering IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS ordering_null_p,
       100.0 * SUM(CASE WHEN title IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS title_null_p,
       100.0 * SUM(CASE WHEN region IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS region_null_p,
       100.0 * SUM(CASE WHEN language IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS language_null_p,
       100.0 * SUM(CASE WHEN types IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS types_null_p,
       100.0 * SUM(CASE WHEN attributes IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS attributes_null_p,
       100.0 * SUM(CASE WHEN isoriginaltitle IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS isoriginaltitle_null_p
FROM "title.akas";

-- title.basics table
SELECT 100.0 * SUM(CASE WHEN tconst IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS tconst_c,
       100.0 * SUM(CASE WHEN titletype IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS titletype_c,
       100.0 * SUM(CASE WHEN primarytitle IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS primarytitle_c,
       100.0 * SUM(CASE WHEN originaltitle IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS originaltitle_c,
       100.0 * SUM(CASE WHEN isadult IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS isadult_c,
       100.0 * SUM(CASE WHEN startyear IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS startyear_c,
       100.0 * SUM(CASE WHEN endyear IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS endyear_c,
       100.0 * SUM(CASE WHEN runtimeminutes IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS runtimeminutes_c,
       100.0 * SUM(CASE WHEN genres IS NULL THEN 1 ELSE 0 END) / COUNT(*) AS genres_c
FROM "title.basics";