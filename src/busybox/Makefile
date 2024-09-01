BUSYBOX_VERSION := 1.30.0

docker:
	docker build -t docker.io/dim9/static:busybox-${BUSYBOX_VERSION} \
		--build-arg BUSYBOX_VERSION=${BUSYBOX_VERSION} \
		.
tag: docker
	docker tag docker.io/dim9/static:busybox-${BUSYBOX_VERSION} docker.io/dim9/static:busybox

push: tag
	docker push docker.io/dim9/static:busybox-${BUSYBOX_VERSION}
	docker push docker.io/dim9/static:busybox
