VERSION=5.73
docker:
	docker build -t docker.io/dim9/static:stunnel-$(VERSION) --build-arg VERSION=$(VERSION) .
push:
	docker push docker.io/dim9/static:stunnel-$(VERSION)
push-latest:
	docker tag docker.io/dim9/static:stunnel-$(VERSION) docker.io/dim9/static:stunnel
	docker push docker.io/dim9/static:stunnel
