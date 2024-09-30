NU_VERSION:=0.96.1
docker:
	docker build -t docker.io/dim9/static:nushell-$(NU_VERSION) \
		--build-arg NU_VERSION=$(NU_VERSION) .
push:
	docker push docker.io/dim9/static:nushell-$(NU_VERSION)
push-latest:
	docker tag docker.io/dim9/static:nushell-$(NU_VERSION) docker.io/dim9/static:nushell
	docker push docker.io/dim9/static:nushell
