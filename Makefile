version ?= latest
IMAGE = your-path:$(version)
dockerrun = docker run --rm $(IMAGE)

release:
	git tag -a $(version) -m "Generated release "$(version)
	git push origin $(version)

image:
	docker build -t $(IMAGE) .

shell: image
	docker run -ti --rm $(IMAGE) bash

check: image
	$(dockerrun) ./hack/check.sh $(parameters)

lint: image
	$(dockerrun) ./hack/lint.sh $(parameters)

check-integration: image
	docker-compose run --rm project ./hack/check-integration.sh $(parameters)

cleanup: 
	docker-compose down

coverage: image
	docker run --rm $(IMAGE) ./hack/check.sh --coverage 

coverage-show: coverage
	xdg-open ./tests/coverage/index.html
