
#build all images

all: bash busybox connectoctl jq kcat make node nushell opentofu quickjs task terraform yq

#docker build

bash:
	cd src/bash && make docker

busybox:
	cd src/busybox && make docker

connectoctl:
	cd src/connectoctl && make docker

jq:
	cd src/jq && make docker

kcat:
	cd src/kcat && make docker

make:
	cd src/make && make docker

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

push-connectoctl:
	cd src/connectoctl && make push 

push-jq:
	cd src/jq && make push 

push-kcat:
	cd src/kcat && make push 

push-make:
	cd src/make && make push 

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

push: push-bash push-busybox push-connectoctl push-jq push-kcat push-make push-node push-nushell push-opentofu push-quickjs push-task push-terraform push-yq
