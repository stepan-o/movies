/* ************************************************************************ */
/*        Queries to obtain meta-data from a PostgreSQL database            */
/* ************************************************************************ */

-------------------- table data from different schemas
-- schema 'public'
SELECT *
FROM information_schema.tables
WHERE table_schema = 'public';

-- schema 'pg_catalog'
SELECT *
FROM information_schema.tables
WHERE table_schema = 'pg_catalog';

-- schema 'information_schema'
SELECT *
FROM information_schema.tables
WHERE table_schema = 'information_schema';

-------------------- column info from a table
SELECT *
FROM information_schema.columns
WHERE table_name = 'title.basics' AND table_schema = 'public';
