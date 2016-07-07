create table if not exists test_names (
    id bigint primary key,
    name varchar(255) NULL
);
create index on test_names (name);
