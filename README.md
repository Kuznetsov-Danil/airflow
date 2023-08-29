# Running Airflow with Docker

https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html

### Download docker-compose file
```bash
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.7.0/docker-compose.yaml'
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

### Running Airflow

```bash
docker compose up -d
```

To check running containers:
```bash
docker ps
```

Some of them may have status "unhealthy" - this is fine (probably?), DAGs will still work.