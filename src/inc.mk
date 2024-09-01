
#build all images

all: bash busybox combi connectctl curl httpbeat jikkou jq kafka-native kcat make metricbeat nginx node nushell opentofu quickjs task terraform yq

#docker build

bash:
	cd src/bash && make docker

busybox:
	cd src/busybox && make docker

combi:
	cd src/combi && make docker

connectctl:
	cd src/connectctl && make docker

curl:
	cd src/curl && make docker

httpbeat:
	cd src/httpbeat && make docker

jikkou:
	cd src/jikkou && make docker

jq:
	cd src/jq && make docker

kafka-native:
	cd src/kafka-native && make docker

kcat:
	cd src/kcat && make docker

make:
	cd src/make && make docker

metricbeat:
	cd src/metricbeat && make docker

nginx:
	cd src/nginx && make docker

node:
	cd src/node && make docker

nushell:
	cd src/nushell && make docker

opentofu:
	cd src/opentofu && make docker

quickjs:
	cd src/quickjs && make docker

task:
	cd src/task && make docker

terraform:
	cd src/terraform && make docker

yq:
	cd src/yq && make docker

#docker push

push-bash:
	cd src/bash && make push

push-busybox:
	cd src/busybox && make push

push-combi:
	cd src/combi && make push

push-connectctl:
	cd src/connectctl && make push

push-curl:
	cd src/curl && make push

push-httpbeat:
	cd src/httpbeat && make push

push-jikkou:
	cd src/jikkou && make push

push-jq:
	cd src/jq && make push

push-kafka-native:
	cd src/kafka-native && make push

push-kcat:
	cd src/kcat && make push

push-make:
	cd src/make && make push

push-metricbeat:
	cd src/metricbeat && make push

push-nginx:
	cd src/nginx && make push

push-node:
	cd src/node && make push

push-nushell:
	cd src/nushell && make push

push-opentofu:
	cd src/opentofu && make push

push-quickjs:
	cd src/quickjs && make push

push-task:
	cd src/task && make push

push-terraform:
	cd src/terraform && make push

push-yq:
	cd src/yq && make push

#push all images

push: push-bash push-busybox push-combi push-connectctl push-curl push-httpbeat push-jikkou push-jq push-kafka-native push-kcat push-make push-metricbeat push-nginx push-node push-nushell push-opentofu push-quickjs push-task push-terraform push-yq
