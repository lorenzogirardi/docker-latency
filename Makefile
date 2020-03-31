include .env

# compose command to merge production file and and dev/tools overrides
COMPOSE?=docker-compose -f docker-compose.yml

up: .env
	$(COMPOSE) up -d

dev: .env
	$(COMPOSE) up

down:
	$(COMPOSE) down

logs:
	$(COMPOSE) logs --tail 50 -f

clean:
        $(COMPOSE) down
   	rm -rf influxdb-data
	rm -rf grafana-data
	$(COMPOSE) rm --stop --force
