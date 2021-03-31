FROM postgres
ENV POSTGRES_PASSWORD="Postgres2021!"
ENV POSTGRES_DB="geo"
COPY dbmodgeo-inicio.sql /docker-entrypoint-initdb.d/
EXPOSE 5432
