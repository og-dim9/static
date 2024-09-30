CURL_VERSION:=8.7.1

docker:
	docker build -t docker.io/dim9/static:curl-$(CURL_VERSION) --build-arg CURL_VERSION=$(CURL_VERSION) .
push:
	docker push docker.io/dim9/static:curl-$(CURL_VERSION)
push-latest:
	docker tag docker.io/dim9/static:curl-$(CURL_VERSION) docker.io/dim9/static
	docker push docker.io/dim9/static:curl