# README PaaS Repository
PaaS repository intends to build an architecture to Extract, Transform, Load and Visualize data with both batching and streaming. 

## Folder organization

├── Paas
│   ├── docker
│   │   ├── mySQL
|   |   ├── postgres
│   ├── docker-compose.yml
└────── README.md


## Implemetation
1. Build docker compose file:
    - In docker-compose.yml directory, run script using terminal:
    sudo docker compose up -d --build
2. Execution postgres container:
        sudo docker exec -it <Postgres_container_name> bash
        psql -U <UserName> -d <Schema>
        ex: psql -U thiennguyen -d dbo


3. 





### Author: Thien Nguyen
### Version: 01
### Date Updated: 25-09-2024
