NGINX_VERSION:=1.29.3
PCRE_VERSION:=8.45
ZLIB_VERSION:=1.3.1
OPENSSL_VERSION:=3.5.4
docker:
	docker build -t docker.io/dim9/static:nginx-$(NGINX_VERSION) \
		--build-arg NGINX_VERSION=$(NGINX_VERSION) \
		--build-arg PCRE_VERSION=$(PCRE_VERSION) \
		--build-arg ZLIB_VERSION=$(ZLIB_VERSION) \
		--build-arg OPENSSL_VERSION=$(OPENSSL_VERSION) \
		.

push:
	docker push docker.io/dim9/static:nginx-$(NGINX_VERSION)
push-latest:
	docker tag docker.io/dim9/static:nginx-$(NGINX_VERSION) docker.io/dim9/static:nginx
	docker push docker.io/dim9/static:nginx
