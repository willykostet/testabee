include .env
export

## Local
run: ## run main.go file
	cd ./src/backend && go run ./

up:
	docker-compose up

down:
	docker-compose down

## Frontend
frontend-dep: ## install dependencies
	cd ./src/frontend && npm install

frontend-build: frontend-dep ## build frontend
	cd ./src/frontend && npm run build


## Backend
backend-dep: ## update backend dependencies
	cd ./src/backend && go mod vendor && go mod tidy

backend-build: backend-dep ## build backend
	docker build -t ${APP_NAME}:${APP_VERSION} ./src/backend \
		&& docker tag ${APP_NAME}:${APP_VERSION} ${DOCKER_REGISTRY}/${APP_NAME}:${APP_VERSION}


## Deploy
app-build: frontend-build backend-build ## build app

app-push: app-build ## push app image to registry
	docker push ${DOCKER_REGISTRY}/${APP_NAME}:${APP_VERSION}
