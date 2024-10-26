# Use the latest PostgreSQL image
FROM postgres:latest

# install vim
RUN apt-get update && apt-get install -y vim

# Copy the initialization script into the container
COPY ./setup_tables/create_tables.sql /docker-entrypoint-initdb.d/create_tables.sql 

# Make the script executable
RUN chmod +x /docker-entrypoint-initdb.d/create_tables.sql 

# Expose the PostgreSQL port
EXPOSE 5432