/* ------------------------- name.basics table ------------------------ */
-- auto-generated definition
create table name_basics
(
    nconst            varchar(10) not null
        constraint "name.basics_pk"
            primary key,
    primaryname       varchar(120),
    birthyear         integer,
    deathyear         integer,
    primaryprofession varchar(80),
    knownfortitles    varchar(100)
);

alter table name_basics
    owner to movies;

/* ------------------------- title.akas table ------------------------ */
-- auto-generated definition
create table title_akas_ri
(
    titleid         varchar(10) not null
        constraint "title.akas_ri_title.basics_tconst_fk"
            references title_basics,
    ordering        integer     not null,
    title           text,
    region          varchar(4),
    language        varchar(3),
    types           varchar(20),
    attributes      varchar(80),
    isoriginaltitle boolean,
    constraint "title.akas_ri.pk"
        primary key (titleid, ordering)
);

alter table title_akas_ri
    owner to movies;

/* ------------------------- title.basics table ------------------------ */
-- auto-generated definition
create table title_basics
(
    tconst         varchar(10) not null
        constraint "title.basics_pk"
            primary key,
    titletype      varchar(12),
    primarytitle   varchar(450),
    originaltitle  varchar(450),
    isadult        boolean,
    startyear      integer,
    endyear        integer,
    runtimeminutes integer,
    genres         varchar(40)
);

alter table title_basics
    owner to movies;

/* ------------------------- title.crew table ------------------------ */
-- auto-generated definition
create table title_crew_ri
(
    tconst    varchar(10) not null
        constraint "title.crew_ri_pk"
            primary key
        constraint "title.crew_ri_title.basics_tconst_fk"
            references title_basics,
    directors text,
    writers   text
);

alter table title_crew_ri
    owner to movies;

/* ------------------------- title.episode table ------------------------ */
-- auto-generated definition
create table title_episode_ri
(
    tconst        varchar(10) not null
        constraint "title.episode_ri_pk"
            primary key,
    parenttconst  varchar(10)
        constraint "title.episode_ri_title.basics_tconst_fk"
            references title_basics,
    seasonnumber  integer,
    episodenumber integer
);

alter table title_episode_ri
    owner to movies;


/* ------------------------- title.principals table ------------------------ */
-- auto-generated definition
create table title_principals_ri
(
    tconst     varchar(10) not null
        constraint "title.principals_ri_title.basics_tconst_fk"
            references title_basics,
    ordering   integer     not null,
    nconst     varchar(10) not null
        constraint "title.principals_ri_name.basics_nconst_fk"
            references name_basics,
    category   varchar(25),
    job        varchar(300),
    characters varchar(500),
    constraint "title.principals_ri.pk"
        primary key (tconst, ordering)
);

alter table title_principals_ri
    owner to movies;

/* ------------------------- title.ratings table ------------------------ */
-- auto-generated definition
create table title_ratings_ri
(
    tconst        varchar(10) not null
        constraint "title.ratings_ri_pk"
            primary key
        constraint "title.ratings_ri_title.basics_tconst_fk"
            references title_basics,
    averagerating numeric,
    numvotes      integer
);

comment on table title_ratings_ri is 'Ratings for movie titles';

alter table title_ratings_ri
    owner to movies;
