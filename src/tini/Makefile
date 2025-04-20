VERSION := 0.19.0

docker:
	docker build -t docker.io/dim9/static:tini-${VERSION} --build-arg VERSION=${VERSION} .
push:
	docker push docker.io/dim9/static:tini-${VERSION}

push-latest:
	docker tag docker.io/dim9/static:tini-${VERSION} docker.io/dim9/static:tini
	docker push docker.io/dim9/static:tini
