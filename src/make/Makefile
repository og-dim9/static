VERSION=4.3
docker:
	docker build -t docker.io/dim9/static:make-$(VERSION) --build-arg VERSION=$(VERSION)  .
push:
	docker push docker.io/dim9/static:make-$(VERSION)
push-latest:
	docker tag docker.io/dim9/static:make-$(VERSION) docker.io/dim9/static:make
	docker push docker.io/dim9/static:make