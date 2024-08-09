
docker:
	docker build -t docker.io/dim9/static:combi .
push:
	docker push docker.io/dim9/static:combi

generate:
	@find .. -name Dockerfile | \
		grep -v combi | \
		grep -v busybox | \
		sort | \
		sed 's|/Dockerfile||g' | \
		sed 's|../||g'  | \
		xargs -I@ echo "FROM docker.io/dim9/static:@ AS @" |\
		tee Dockerfile
	@echo "FROM docker.io/dim9/static:busybox AS final" | tee -a Dockerfile
	@find .. -name Dockerfile | \
		grep -v combi | \
		grep -v busybox | \
		sort | \
		sed 's|/Dockerfile||g' | \
		sed 's|../||g'  | \
		xargs -I@ echo "COPY --from=@ /bin/@ /bin/" |\
		tee -a Dockerfile
	@echo "CMD [\"/bin/bash\"]" | tee -a Dockerfile