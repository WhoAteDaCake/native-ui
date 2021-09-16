
build: $(shell find ./src -name "*.cr")
	shards build --no-debug native-ui

run: export LD_LIBRARY_PATH=$(PWD)/LCUI/build/linux/x86_64/release
run: build
	./bin/native-ui

.PHONY: dev
dev:
	fwatcher --all-events \
	  --dir src \
	  -x \
	  execute make run