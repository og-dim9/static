VERSION=1.7.0
docker:
	docker build -t docker.io/dim9/static:kcat-$(VERSION) --build-arg VERSION=$(VERSION) .
push:
	docker push docker.io/dim9/static:kcat-$(VERSION)
push-latest:
	docker tag docker.io/dim9/static:kcat-$(VERSION) docker.io/dim9/static:kcat
	docker push docker.io/dim9/static:kcat
