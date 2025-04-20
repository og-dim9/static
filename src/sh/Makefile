VERSION := 1.35.0

docker:
	docker build -t docker.io/dim9/static:sh-${VERSION} --build-arg VERSION=${VERSION} .
push:
	docker push docker.io/dim9/static:sh-${VERSION}

push-latest:
	docker tag docker.io/dim9/static:sh-${VERSION} docker.io/dim9/static:sh
	docker push docker.io/dim9/static:sh
