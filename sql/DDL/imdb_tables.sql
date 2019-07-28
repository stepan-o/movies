/* ------------------------- name.basics table ------------------------ */
-- auto-generated definition
create table "name.basics"
(
    nconst            varchar(10) not null,
    primaryname       varchar(120),
    birthyear         integer,
    deathyear         integer,
    primaryprofession varchar(80),
    knownfortitles    varchar(100)
);

alter table "name.basics"
    owner to movies;

create unique index "name.basics_nconst_uindex"
    on "name.basics" (nconst);

/* ------------------------- title.akas table ------------------------ */
-- auto-generated definition
create table "title.akas"
(
    titleid         varchar(10) not null,
    ordering        integer     not null,
    title           text,
    region          varchar(4),
    language        varchar(3),
    types           varchar(20),
    attributes      varchar(80),
    isoriginaltitle boolean
);

alter table "title.akas"
    owner to movies;

/* ------------------------- title.basics table ------------------------ */
-- auto-generated definition
create table "title.basics"
(
    tconst         varchar(10) not null,
    titletype      varchar(12),
    primarytitle   varchar(450),
    originaltitle  varchar(450),
    isadult        boolean,
    startyear      integer,
    endyear        integer,
    runtimeminutes integer,
    genres         varchar(40)
);

alter table "title.basics"
    owner to movies;

create unique index "title.basics_tconst_uindex"
    on "title.basics" (tconst);

/* ------------------------- title.crew table ------------------------ */
-- auto-generated definition
create table "title.crew"
(
    tconst    varchar(10) not null,
    directors text,
    writers   text
);

alter table "title.crew"
    owner to movies;

create unique index "title.crew_tconst_uindex"
    on "title.crew" (tconst);

/* ------------------------- title.episode table ------------------------ */
-- auto-generated definition
create table "title.episode"
(
    tconst        varchar(10) not null,
    parenttconst  varchar(10),
    seasonnumber  integer,
    episodenumber integer
);

alter table "title.episode"
    owner to movies;

create unique index "title.episode_tconst_uindex"
    on "title.episode" (tconst);

/* ------------------------- title.principals table ------------------------ */
-- auto-generated definition
create table "title.principals"
(
    tconst     varchar(10) not null,
    ordering   integer     not null,
    nconst     varchar(10),
    category   varchar(25),
    job        varchar(300),
    characters varchar(500)
);

alter table "title.principals"
    owner to movies;

/* ------------------------- title.ratings table ------------------------ */
-- auto-generated definition
create table "title.ratings"
(
    tconst        varchar(10) not null,
    averagerating numeric,
    numvotes      integer
);

alter table "title.ratings"
    owner to movies;

create unique index "title.ratings_tconst_uindex"
    on "title.ratings" (tconst);

