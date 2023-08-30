# Running Airflow with Docker

https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html

### Download docker-compose file and airflow config
```bash
curl -LfO 'https://raw.githubusercontent.com/Kuznetsov-Danil/airflow/main/docker-compose.yaml'
#curl -LfO 'https://raw.githubusercontent.com/Kuznetsov-Danil/airflow/main/airflow.cfg'
```

### Make directories

```bash
mkdir -p ./dags ./logs ./plugins ./config
echo -e "AIRFLOW_UID=$(id -u)" > .env
```

Important - 
* **./dags** - you can put your DAG files here.
* **./logs** - contains logs from task execution and scheduler.

### Init

```bash
docker compose up airflow-init
```

May take several minutes to pull images.

### Running Airflow

```bash
docker compose up -d
```

To check running containers:
```bash
docker ps
```

Some of them may have status "unhealthy" - this is fine (probably?), DAGs will still work.

### Clean-up

In the same directory: 
* delete all running containers
* and all created files and folders
```bash
docker compose down --volumes --remove-orphans
rm -rf ./*
```


### Start everything if you are lazy

Make sure you are in the directory for Airflow files!  
You can create **/airflow** directory with `mkdir /airflow` and then go there: `cd /airflow`

```bash
curl -LfO 'https://raw.githubusercontent.com/Kuznetsov-Danil/airflow/main/docker-compose.yaml'
#curl -LfO 'https://raw.githubusercontent.com/Kuznetsov-Danil/airflow/main/airflow.cfg'

mkdir -p ./dags ./logs ./plugins ./config
echo -e "AIRFLOW_UID=$(id -u)" > .env

docker compose up airflow-init

docker compose up -d

docker ps
```

### Check if everything is working

[http://localhost:8080](http://localhost:8080) or your host at port 8080.  
User: airflowadm  
Password: airflowadm

---

# Building Docker image for Airflow

```bash
docker build . -t dskuznetsov/airflow
docker push dskuznetsov/airflow
```