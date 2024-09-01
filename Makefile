

include src/inc.mk

inc.mk:
	@echo "add 'all' to src/inc.mk"
	@echo "\n#build all images" | tee src/inc.mk
	@find src -name Makefile | \
		sed 's|src/||g' | \
		sed 's|/Makefile||g' | \
		sort | \
		xargs echo -e '\nall:' | \
		tee -a src/inc.mk

	@echo "add 'docker build' to src/inc.mk"
	@echo "\n#docker build" | tee -a src/inc.mk
	@find src -name Makefile | \
		sed 's|src/||g' | \
		sed 's|/Makefile||g' | \
		sort | \
		xargs -I@ echo -e "\n@:\n\tcd src/@ && make docker" | \
		tee -a src/inc.mk

	@echo "\n#docker push" | tee -a src/inc.mk
	@find src -name Makefile | \
		sed 's|src/|push-|g' | \
		sed 's|/Makefile||g' | \
		sort | \
		xargs -I@ echo -e "\n@:\n\tcd src/@ && make push" | \
		sed 's|src/push-|src/|g' | \
		tee -a src/inc.mk

	@echo "\n#push all images" | tee -a src/inc.mk
	@find src -name Makefile | \
		sed 's|src/|push-|g' | \
		sed 's|/Makefile||g' | \
		sort | \
		xargs echo -e '\npush:' | \
		tee -a src/inc.mk


