KAFKA_VERSION:=3.7.1
docker:
	docker build -t docker.io/dim9/static:kafka-native-$(KAFKA_VERSION) \
		--build-arg KAFKA_VERSION=$(KAFKA_VERSION) .
push:
	docker push docker.io/dim9/static:kafka-native-$(KAFKA_VERSION)
push-latest:
	docker tag docker.io/dim9/static:kafka-native-$(KAFKA_VERSION) docker.io/dim9/static:kafka-native
	docker push docker.io/dim9/static:kafka-native
