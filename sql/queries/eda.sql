/* ******************************************************************************** */
/*                    Queries for Exploratory Data Analysis (EDA)                   */
/*                          IMDb data: individual tables                            */
/* ******************************************************************************** */

-- Count of records by each primaryProfession from name.basics table
SELECT
    SUM(CASE WHEN primaryprofession LIKE '%actor%' THEN 1 ELSE 0 END) AS num_actors,
    SUM(CASE WHEN primaryprofession LIKE '%actress%' THEN 1 ELSE 0 END) AS num_actresses,
    SUM(CASE WHEN primaryprofession LIKE '%writer%' THEN 1 ELSE 0 END) AS num_writers,
    SUM(CASE WHEN primaryprofession LIKE '%publicist%' THEN 1 ELSE 0 END) AS num_publicists,
    SUM(CASE WHEN primaryprofession LIKE '%legal%' THEN 1 ELSE 0 END) AS num_legal,
    SUM(CASE WHEN primaryprofession LIKE '%executive%' THEN 1 ELSE 0 END) AS num_executives,
    SUM(CASE WHEN primaryprofession LIKE '%producer%' THEN 1 ELSE 0 END) AS num_producers,
    SUM(CASE WHEN primaryprofession LIKE '%manager%' THEN 1 ELSE 0 END) AS num_managers,
    SUM(CASE WHEN primaryprofession LIKE '%production_manager%' THEN 1 ELSE 0 END) AS num_production_managers,
    SUM(CASE WHEN primaryprofession LIKE '%production_designer%' THEN 1 ELSE 0 END) AS num_production_designers,
    SUM(CASE WHEN primaryprofession LIKE '%director%' THEN 1 ELSE 0 END) AS num_directors,
    SUM(CASE WHEN primaryprofession LIKE '%assistant_director%' THEN 1 ELSE 0 END) AS num_ass_directors,
    SUM(CASE WHEN primaryprofession LIKE '%casting_director%' THEN 1 ELSE 0 END) AS num_casting_directors,
    SUM(CASE WHEN primaryprofession LIKE '%casting_department%' THEN 1 ELSE 0 END) AS num_casting_department,
    SUM(CASE WHEN primaryprofession LIKE '%talent_agent%' THEN 1 ELSE 0 END) AS num_talent_agents,
    SUM(CASE WHEN primaryprofession LIKE '%art_director%' THEN 1 ELSE 0 END) AS num_art_directors,
    SUM(CASE WHEN primaryprofession LIKE '%art_department%' THEN 1 ELSE 0 END) AS num_art_department,
    SUM(CASE WHEN primaryprofession LIKE '%cinematographer%' THEN 1 ELSE 0 END) AS num_cinematographers,
    SUM(CASE WHEN primaryprofession LIKE '%set_decorator%' THEN 1 ELSE 0 END) AS num_set_decorators,
    SUM(CASE WHEN primaryprofession LIKE '%camera_department%' THEN 1 ELSE 0 END) AS num_camera_department,
    SUM(CASE WHEN primaryprofession LIKE '%editor%' THEN 1 ELSE 0 END) AS num_editors,
    SUM(CASE WHEN primaryprofession LIKE '%editorial_department%' THEN 1 ELSE 0 END) AS num_editorial_department,
    SUM(CASE WHEN primaryprofession LIKE '%location_management%' THEN 1 ELSE 0 END) AS num_location_management,
    SUM(CASE WHEN primaryprofession LIKE '%transportation_department%' THEN 1 ELSE 0 END) AS num_transportation_department,
    SUM(CASE WHEN primaryprofession LIKE '%make_up_department%' THEN 1 ELSE 0 END) AS num_make_up_department,
    SUM(CASE WHEN primaryprofession LIKE '%costume_designer%' THEN 1 ELSE 0 END) AS num_costume_designers,
    SUM(CASE WHEN primaryprofession LIKE '%costume_department%' THEN 1 ELSE 0 END) AS num_costume_department,
    SUM(CASE WHEN primaryprofession LIKE '%editorial_department%' THEN 1 ELSE 0 END) AS num_editorial_department,
    SUM(CASE WHEN primaryprofession LIKE '%composer%' THEN 1 ELSE 0 END) AS num_composers,
    SUM(CASE WHEN primaryprofession LIKE '%soundtrack%' THEN 1 ELSE 0 END) AS num_soundtrack,
    SUM(CASE WHEN primaryprofession LIKE '%music_department%' THEN 1 ELSE 0 END) AS num_music_department,
    SUM(CASE WHEN primaryprofession LIKE '%sound_department%' THEN 1 ELSE 0 END) AS num_sound_department,
    SUM(CASE WHEN primaryprofession LIKE '%special_effects%' THEN 1 ELSE 0 END) AS num_special_effects,
    SUM(CASE WHEN primaryprofession LIKE '%visual_effects%' THEN 1 ELSE 0 END) AS num_visual_effects,
    SUM(CASE WHEN primaryprofession LIKE '%stunts%' THEN 1 ELSE 0 END) AS num_stunts,
    SUM(CASE WHEN primaryprofession LIKE '%animation_department%' THEN 1 ELSE 0 END) AS num_animators,
    SUM(CASE WHEN primaryprofession LIKE '%electrical_department%' THEN 1 ELSE 0 END) AS num_electrical_department
FROM name_basics;

-- Count of regional titles by region from title.akas.table
SELECT region, COUNT(*)
FROM "title.akas"
GROUP BY region;

-- Count of regional titles by language from title.akas.table
SELECT language, COUNT(*)
FROM "title.akas"
GROUP BY language;

-- only 17 original titles in table title.akas have language or region specified
SELECT COUNT(*)
FROM "title.akas"
WHERE isoriginaltitle IS true
  AND (region IS NOT NULL OR language IS NOT NULL);

-- highest number of akas (international titles) in title.akas table seems to be coming from 2019 titles
SELECT
    titleid, COUNT(*) AS num_akas
FROM "title.akas"
GROUP BY titleid
ORDER BY num_akas DESC
LIMIT 100;

-- count of titles by title type from title.basics table
SELECT titletype, COUNT(*)
FROM title_basics
GROUP BY titletype;

-- primary and original titles for TV-series episodes in title.basics table repeat a lot (e.g., Episode #1.1)
SELECT primarytitle, COUNT(*) AS title_count
FROM title_basics
GROUP BY primarytitle
ORDER BY title_count DESC
LIMIT 200;

SELECT originaltitle, COUNT(*) AS title_count
FROM title_basics
GROUP BY originaltitle
ORDER BY title_count DESC
LIMIT 200;

-- a lot of movies and tv episodes in title.basics table have the same generic names (e.g., 'Home', 'Alone', 'Broken', etc.)
-- top 200 primary and original titles by count of records in title.basics table
SELECT primarytitle, COUNT(*) AS title_count
FROM title_basics
WHERE titletype <> 'tvEpisode' -- to avoid duplicate titles such as 'Episode #1.1'
GROUP BY primarytitle
ORDER BY title_count DESC
LIMIT 200;

SELECT originaltitle, COUNT(*) AS title_count
FROM title_basics
WHERE titletype <> 'tvEpisode'
GROUP BY originaltitle
ORDER BY title_count DESC
LIMIT 200;

-- records in title.basics with primary title 'Home'
SELECT *
FROM title_basics
WHERE primarytitle='Home'
ORDER BY startyear;

-- records in title.basics with primary title 'Alone'
SELECT *
FROM title_basics
WHERE primarytitle='Alone'
ORDER BY startyear;

-- records in title.basics with primary title 'Broken'
SELECT *
FROM title_basics
WHERE primarytitle='Broken'
ORDER BY startyear;

-- count of records by start year in title.basics table
SELECT startyear, COUNT(*)
FROM title_basics
GROUP BY startyear
ORDER BY startyear;

-- 100 years - A Movie You Will Never See in title.basics table
SELECT *
FROM title_basics
WHERE startyear=2115;

-- forward thinking - 4 more Avatar movies scheduled from 2021 to 2027 in title.basics table
SELECT *
FROM title_basics
WHERE primarytitle LIKE 'Avatar%' AND startyear > 2020
ORDER BY startyear;

-- crazy long movies in title.basics - Logistics (2012) is 5-weeks long!
SELECT *
FROM title_basics
WHERE runtimeminutes > 1000 AND titletype = 'movie'
ORDER BY runtimeminutes;

-- MIN, AVG, MAX runtime by start year for movies from title.basics
SELECT
    startyear,
    COUNT(*) AS num_movies,
    COUNT(runtimeminutes) AS num_non_null_runtime,
    MIN(runtimeminutes) AS min_runtime,
    AVG(runtimeminutes) AS avg_runtime,
    MAX(runtimeminutes) AS max_runtime
FROM title_basics
WHERE titletype = 'movie'
GROUP BY startyear
ORDER BY startyear;

-- num records by genre from title.basics table
SELECT
    SUM(CASE WHEN genres LIKE '%Comedy%' THEN 1 ELSE 0 END) AS num_comedies,
    SUM(CASE WHEN genres LIKE '%Drama%' THEN 1 ELSE 0 END) AS num_drames,
    SUM(CASE WHEN genres LIKE '%News%' THEN 1 ELSE 0 END) AS num_news,
    SUM(CASE WHEN genres LIKE '%Crime%' THEN 1 ELSE 0 END) AS num_crime,
    SUM(CASE WHEN genres LIKE '%Talk-Show%' THEN 1 ELSE 0 END) AS num_talk_shows,
    SUM(CASE WHEN genres LIKE '%Action%' THEN 1 ELSE 0 END) AS num_actions,
    SUM(CASE WHEN genres LIKE '%Adult%' THEN 1 ELSE 0 END) AS num_adult,
    SUM(CASE WHEN genres LIKE '%Thriller%' THEN 1 ELSE 0 END) AS num_thrillers,
    SUM(CASE WHEN genres LIKE '%Sport%' THEN 1 ELSE 0 END) AS num_sport,
    SUM(CASE WHEN genres LIKE '%Mystery%' THEN 1 ELSE 0 END) AS num_mystery,
    SUM(CASE WHEN genres LIKE '%Romance%' THEN 1 ELSE 0 END) AS num_romance,
    SUM(CASE WHEN genres LIKE '%Sci-Fi%' THEN 1 ELSE 0 END) AS num_scifi,
    SUM(CASE WHEN genres LIKE '%Film-Noir%' THEN 1 ELSE 0 END) AS num_noir,
    SUM(CASE WHEN genres LIKE '%Reality-TV%' THEN 1 ELSE 0 END) AS num_realTV,
    SUM(CASE WHEN genres LIKE '%Biography%' THEN 1 ELSE 0 END) AS num_biography,
    SUM(CASE WHEN genres LIKE '%War%' THEN 1 ELSE 0 END) AS num_war,
    SUM(CASE WHEN genres LIKE '%Fantasy%' THEN 1 ELSE 0 END) AS num_fantasy,
    SUM(CASE WHEN genres LIKE '%Musical%' THEN 1 ELSE 0 END) AS num_musicals,
    SUM(CASE WHEN genres LIKE '%History%' THEN 1 ELSE 0 END) AS num_history,
    SUM(CASE WHEN genres LIKE '%Animation%' THEN 1 ELSE 0 END) AS num_animation,
    SUM(CASE WHEN genres LIKE '%Documentary%' THEN 1 ELSE 0 END) AS num_documentaries,
    SUM(CASE WHEN genres LIKE '%Music%' THEN 1 ELSE 0 END) AS num_music,
    SUM(CASE WHEN genres LIKE '%Family%' THEN 1 ELSE 0 END) AS num_family,
    SUM(CASE WHEN genres LIKE '%Horror%' THEN 1 ELSE 0 END) AS num_horrors,
    SUM(CASE WHEN genres LIKE '%Western%' THEN 1 ELSE 0 END) AS num_westerns,
    SUM(CASE WHEN genres LIKE '%Game-Show%' THEN 1 ELSE 0 END) AS num_game_shows,
    SUM(CASE WHEN genres LIKE '%Adventure%' THEN 1 ELSE 0 END) AS num_adventures
FROM title_basics;

-- num records by genre grouped by start year (TIME SERIES) from title.basics table
SELECT
    startyear,
    SUM(CASE WHEN genres LIKE '%Comedy%' THEN 1 ELSE 0 END) AS num_comedies,
    SUM(CASE WHEN genres LIKE '%Drama%' THEN 1 ELSE 0 END) AS num_drames,
    SUM(CASE WHEN genres LIKE '%News%' THEN 1 ELSE 0 END) AS num_news,
    SUM(CASE WHEN genres LIKE '%Crime%' THEN 1 ELSE 0 END) AS num_crime,
    SUM(CASE WHEN genres LIKE '%Talk-Show%' THEN 1 ELSE 0 END) AS num_talk_shows,
    SUM(CASE WHEN genres LIKE '%Action%' THEN 1 ELSE 0 END) AS num_actions,
    SUM(CASE WHEN genres LIKE '%Adult%' THEN 1 ELSE 0 END) AS num_adult,
    SUM(CASE WHEN genres LIKE '%Thriller%' THEN 1 ELSE 0 END) AS num_thrillers,
    SUM(CASE WHEN genres LIKE '%Sport%' THEN 1 ELSE 0 END) AS num_sport,
    SUM(CASE WHEN genres LIKE '%Mystery%' THEN 1 ELSE 0 END) AS num_mystery,
    SUM(CASE WHEN genres LIKE '%Romance%' THEN 1 ELSE 0 END) AS num_romance,
    SUM(CASE WHEN genres LIKE '%Sci-Fi%' THEN 1 ELSE 0 END) AS num_scifi,
    SUM(CASE WHEN genres LIKE '%Film-Noir%' THEN 1 ELSE 0 END) AS num_noir,
    SUM(CASE WHEN genres LIKE '%Reality-TV%' THEN 1 ELSE 0 END) AS num_realTV,
    SUM(CASE WHEN genres LIKE '%Biography%' THEN 1 ELSE 0 END) AS num_biography,
    SUM(CASE WHEN genres LIKE '%War%' THEN 1 ELSE 0 END) AS num_war,
    SUM(CASE WHEN genres LIKE '%Fantasy%' THEN 1 ELSE 0 END) AS num_fantasy,
    SUM(CASE WHEN genres LIKE '%Musical%' THEN 1 ELSE 0 END) AS num_musicals,
    SUM(CASE WHEN genres LIKE '%History%' THEN 1 ELSE 0 END) AS num_history,
    SUM(CASE WHEN genres LIKE '%Animation%' THEN 1 ELSE 0 END) AS num_animation,
    SUM(CASE WHEN genres LIKE '%Documentary%' THEN 1 ELSE 0 END) AS num_documentaries,
    SUM(CASE WHEN genres LIKE '%Music%' THEN 1 ELSE 0 END) AS num_music,
    SUM(CASE WHEN genres LIKE '%Family%' THEN 1 ELSE 0 END) AS num_family,
    SUM(CASE WHEN genres LIKE '%Horror%' THEN 1 ELSE 0 END) AS num_horrors,
    SUM(CASE WHEN genres LIKE '%Western%' THEN 1 ELSE 0 END) AS num_westerns,
    SUM(CASE WHEN genres LIKE '%Game-Show%' THEN 1 ELSE 0 END) AS num_game_shows,
    SUM(CASE WHEN genres LIKE '%Adventure%' THEN 1 ELSE 0 END) AS num_adventures
FROM title_basics
GROUP BY startyear
ORDER BY startyear;

/* ******************************* title.crew table ********************************* */
-- count of titles by director and writer id - high number of titles (~6'000 for top)
SELECT directors, COUNT(*) AS count_titles
FROM "title.crew"
GROUP BY directors
ORDER BY count_titles DESC
LIMIT 200;

SELECT writers, COUNT(*) AS count_titles
FROM "title.crew"
GROUP BY writers
ORDER BY count_titles DESC
LIMIT 200;

/* ******************************* title.episode table ********************************* */
-- count of episode by parent tconst - high number of episodes for top parent tconsts (>11'000 for top)
SELECT parenttconst, COUNT(*) AS count_epis
FROM "title.episode"
GROUP BY parenttconst
ORDER BY count_epis DESC
LIMIT 200;

-- count of episodes by season number - up to 174 (191) seasons
SELECT seasonnumber, COUNT(*) AS count_epis
FROM "title.episode"
GROUP BY seasonnumber
ORDER BY seasonnumber;

-- erratic values in season number - resemble year
SELECT seasonnumber, COUNT(*) AS count_epis
FROM "title.episode"
WHERE seasonnumber > 200
GROUP BY seasonnumber
ORDER BY seasonnumber;

/* ******************************* title.principals table ********************************* */
-- count of principals by tconst - not more than 10 principals per title
SELECT tconst, COUNT(*) AS count_principals
FROM "title.principals"
GROUP BY tconst
ORDER BY count_principals DESC
LIMIT 200;

-- count by nconst
SELECT nconst, COUNT(*) AS count_by_nconst
FROM "title.principals"
GROUP BY nconst
ORDER BY count_by_nconst DESC
LIMIT 200;

-- count of unique nconsts by category
SELECT category, COUNT(DISTINCT nconst)
FROM "title.principals"
GROUP BY category;

-- count of principals by job
SELECT job, COUNT(*) AS count_principals
FROM "title.principals"
GROUP BY job
ORDER BY count_principals DESC
LIMIT 200;

-- count of unique nconsts by job
SELECT job, COUNT(DISTINCT nconst) AS count_unq_nconst
FROM "title.principals"
GROUP BY job
ORDER BY count_unq_nconst DESC
LIMIT 200;

/* ******************************* title.ratings table ********************************* */
-- best and worst rated titles with > 3'000 votes
SELECT *
FROM "title.ratings"
WHERE numvotes > 3000
ORDER BY averagerating DESC
LIMIT 1000;

SELECT *
FROM "title.ratings"
WHERE numvotes > 3000
ORDER BY averagerating
LIMIT 1000;