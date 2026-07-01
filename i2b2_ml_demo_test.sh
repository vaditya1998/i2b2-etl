docker rm -f $(docker ps -aq)
docker volume rm -f $(docker volume ls -q)

cd deployment/pg
docker-compose up -d i2b2-etl

docker exec -it i2b2-etl bash -c "source /usr/src/app/.venv/bin/activate && sleep 10 && python -m i2b2_cdi.job.jobWatcher"
