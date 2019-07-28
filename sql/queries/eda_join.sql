/* ******************************************************************************** */
/*                    Queries for Exploratory Data Analysis (EDA)                   */
/*                             IMDb data: joined tables                             */
/* ******************************************************************************** */

------------- comedies with at least 100 votes and at least 8.5 average rating
SELECT
    tb.startyear AS startYear,
    tb.primarytitle AS primaryTitle,
    tb.genres AS genres,
    tr.averagerating AS averageRating,
    tr.numvotes AS numVotes,
    tb.runtimeminutes AS runtimeMinutes
FROM title_basics AS tb
         RIGHT JOIN title_ratings_ri AS tr
                    ON tb.tconst = tr.tconst
WHERE tr.averagerating > 8.5 AND
        tr.numvotes > 100 AND
        tb.genres LIKE '%Comedy%' AND
        tb.titletype = 'movie'
ORDER BY tb.startyear;


----------------------------- all Johnny Depp movies
SELECT
    nb.primaryname AS name,
    tb.startyear AS startYear,
    tb.primarytitle AS title,
    tb.titletype AS titleType,
    tr.averagerating AS averageRating,
    tr.numvotes AS numVotes,
    tp.category AS job,
    tp.characters AS character
FROM title_principals_ri AS tp
         JOIN name_basics AS nb ON tp.nconst = nb.nconst
         JOIN title_basics AS tb on tp.tconst = tb.tconst
         JOIN title_ratings_ri AS tr ON tb.tconst = tr.tconst
WHERE
        nb.primaryname LIKE '%Johnny Depp%' AND
        tb.titletype = 'movie'
ORDER BY tb.startyear;

----------------------------- movies with highest average rating by each year
SELECT
    x2.startyear AS startYear,
    x2.primarytitle AS primaryTitle,
    x2.genres AS genres,
    x2.averagerating AS maxAverageRating,
    x2.numvotes AS numVotes,
    x2.runtimeminutes AS runTimeMinutes
FROM (
    -- get max average rating for movies with >10 votes for each year
         SELECT
             tb.startyear AS startYr,
             MAX(tr.averagerating) AS maxAverageRt
         FROM title_basics AS tb
         RIGHT JOIN title_ratings_ri AS tr
             ON tb.tconst = tr.tconst
         WHERE tr.numvotes > 10 AND
               tb.startyear IS NOT NULL AND
               tb.titletype = 'movie'
         GROUP BY startYr) AS x
         JOIN (
             -- get titles, genres, numvotes, and runtime minutes for highest rated movies for each year
                 SELECT
                     tb2.primarytitle,
                     tb2.startyear,
                     tb2.genres,
                     tb2.runtimeminutes,
                     tr2.averagerating,
                     tr2.numvotes
                 FROM title_basics AS tb2
                 RIGHT JOIN title_ratings_ri AS tr2
                     ON tb2.tconst = tr2.tconst
                 WHERE tr2.numvotes > 10 AND
                       tb2.startyear IS NOT NULL AND
                       tb2.titletype = 'movie') AS x2
             ON x.startYr = x2.startyear AND x.maxAverageRt = x2.averagerating
ORDER BY startYear;


----------------------------- comedies with highest average rating by each year
SELECT
    x2.startyear AS startYear,
    x2.primarytitle AS primaryTitle,
    x2.genres AS genres,
    x2.averagerating AS maxAverageRating,
    x2.numvotes AS numVotes,
    x2.runtimeminutes AS runTimeMinutes
FROM (
         -- get max average rating for movies with >10 votes for each year
         SELECT
             tb.startyear AS startYr,
             MAX(tr.averagerating) AS maxAverageRt
         FROM title_basics AS tb
                  RIGHT JOIN title_ratings_ri AS tr
                             ON tb.tconst = tr.tconst
         WHERE tr.numvotes > 10 AND
             tb.startyear IS NOT NULL AND
                 tb.titletype = 'movie'
         GROUP BY startYr) AS x
         JOIN (
    -- get titles, genres, numvotes, and runtime minutes for highest rated movies for each year
    SELECT
        tb2.primarytitle,
        tb2.startyear,
        tb2.genres,
        tb2.runtimeminutes,
        tr2.averagerating,
        tr2.numvotes
    FROM title_basics AS tb2
             RIGHT JOIN title_ratings_ri AS tr2
                        ON tb2.tconst = tr2.tconst
    WHERE tr2.numvotes > 10 AND
        tb2.startyear IS NOT NULL AND
            tb2.titletype = 'movie') AS x2
              ON x.startYr = x2.startyear AND x.maxAverageRt = x2.averagerating
ORDER BY startYear;
