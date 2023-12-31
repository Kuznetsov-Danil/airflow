# https://grafana.com/docs/grafana/latest/setup-grafana/installation/docker/
docker run -d -p 3000:3000 --name=grafana grafana/grafana-enterprise

# https://hub.docker.com/_/mongo
docker run -d -p 27017:27017 --name mongo -e MONGO_INITDB_ROOT_USERNAME=mongoadm -e MONGO_INITDB_ROOT_PASSWORD=mongoadm mongo:4.4.24

# https://hub.docker.com/_/postgres
docker run -d -p 5432:5432 --name postgres -e POSTGRES_USER=postgresadm -e POSTGRES_PASSWORD=postgresadm postgres