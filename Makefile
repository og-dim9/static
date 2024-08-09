all: busybox bash task jq kcat nushell yq terraform node make

busybox:
	cd src/busybox && \
		make
bash:
	cd src/bash && \
		make
task:
	cd src/task && \
		make
jq:
	cd src/jq && \
		make
kcat:
	cd src/kcat && \
		make
nushell:
	cd src/nushell && \
		make
yq:
	cd src/yq && \
		make
terraform:
	cd src/terraform && \
		make
node:
	cd src/node && \
		make
make:
	cd src/make && \
		make
