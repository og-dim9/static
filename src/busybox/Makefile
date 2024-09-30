BUSYBOX_VERSION := 1.33.1

docker:
	docker build -t docker.io/dim9/static:busybox-${BUSYBOX_VERSION} \
		--build-arg BUSYBOX_VERSION=${BUSYBOX_VERSION} \
		.
push:
	docker push docker.io/dim9/static:busybox-${BUSYBOX_VERSION}


push-latest:
	docker tag docker.io/dim9/static:busybox-${BUSYBOX_VERSION} docker.io/dim9/static:busybox
	docker push docker.io/dim9/static:busybox

menuconfig:
	docker build -t bb-menuconfig:${BUSYBOX_VERSION} -f Dockerfile.menuconfig \
		--build-arg BUSYBOX_VERSION=${BUSYBOX_VERSION} .
	docker run --rm -it -v ${PWD}/busybox.config:/src/busybox-${BUSYBOX_VERSION}/.config2 \
		bb-menuconfig:${BUSYBOX_VERSION} #make menuconfig
	docker rmi bb-menuconfig:${BUSYBOX_VERSION}
