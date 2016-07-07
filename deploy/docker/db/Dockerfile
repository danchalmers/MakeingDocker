FROM postgres:9.5

ENV POSTGRES_PASSWORD oh.so.secret

ADD schema.sql /docker-entrypoint-initdb.d
