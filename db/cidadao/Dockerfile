FROM postgres
ENV POSTGRES_PASSWORD="Postgres2021!"
ENV POSTGRES_DB="cidadao"
COPY db-modcidadao.sql /docker-entrypoint-initdb.d/
EXPOSE 5432
