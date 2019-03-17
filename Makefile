build-image:
	# check that TAG env variable is set
	test -n "$(TAG)"  # You must define TAG variable: TAG=1.3 make-build-image

	@echo "\033[92mBuilding docker image version '$(TAG)'\033[0m"

	docker build -f Dockerfile . -t akhmetov/tdlib:$(TAG)
