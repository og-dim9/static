VERSION=1.0.0-early-access

docker:
	docker build -t docker.io/dim9/static:kcctl-$(VERSION) --build-arg VERSION=$(VERSION) .
push:
	docker push docker.io/dim9/static:kcctl-$(VERSION)
push-latest:
	docker tag docker.io/dim9/static:kcctl-$(VERSION) docker.io/dim9/static:kcctl
	docker push docker.io/dim9/static:kcctl-$(VERSION)
run:
	docker run -it --rm docker.io/dim9/static:kcctl-$(VERSION) 