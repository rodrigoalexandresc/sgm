FROM postgres
ENV POSTGRES_PASSWORD="Postgres2021!"
ENV POSTGRES_DB="stur"
COPY dbstur.sql /docker-entrypoint-initdb.d/
EXPOSE 5432
