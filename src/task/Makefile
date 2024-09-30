TASK_VERSION=3.38.0
docker:
	docker build -t docker.io/dim9/static:task-$(TASK_VERSION) --build-arg TASK_VERSION=$(TASK_VERSION) .
push:
	docker push docker.io/dim9/static:task-$(TASK_VERSION)
push-latest:
	docker tag docker.io/dim9/static:task-$(TASK_VERSION) docker.io/dim9/static:task
	docker push docker.io/dim9/static:task-$(TASK_VERSION)
