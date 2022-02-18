/*create table like_table
(
    id            bigint       not null auto_increment,
    like_owner_id bigint,
    primary key (id)
) engine = InnoDB;
*/
create table comment
(
    id                bigint       not null auto_increment,
    local_date_time   datetime,
    description       varchar(255) not null,
    related_post_id   bigint,
    comment_owner_id  bigint,
    primary key (id)
) engine = InnoDB;

create table post
(
    id                bigint       not null auto_increment,
    local_date_time   datetime,
    title             varchar(255) not null,
    description       varchar(255) not null,
    post_owner_id     bigint,
    primary key (id)
) engine = InnoDB;

create table user
(
    id         bigint       not null auto_increment,
    active     bit          not null,
    email      varchar(255) not null,
    username   varchar(255) not null,
    first_name varchar(255) not null,
    last_name  varchar(255) not null,
    password   varchar(255) not null,
    role       varchar(255),
    primary key (id)
) engine = InnoDB;
