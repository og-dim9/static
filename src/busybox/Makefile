VERSION := 1.35.0

docker:
	docker build -t docker.io/dim9/static:busybox-${VERSION} \
		--build-arg VERSION=${VERSION} \
		.
push:
	docker push docker.io/dim9/static:busybox-${VERSION}


push-latest:
	docker tag docker.io/dim9/static:busybox-${VERSION} docker.io/dim9/static:busybox
	docker push docker.io/dim9/static:busybox

shell:
	docker build -t bb-menuconfig:${VERSION} -f Dockerfile.shell \
		--build-arg VERSION=${VERSION} .
	docker run --rm -it -v ${PWD}/busybox.config:/src/busybox-${VERSION}/.config2 \
		bb-menuconfig:${VERSION}
	docker rmi bb-menuconfig:${VERSION}
