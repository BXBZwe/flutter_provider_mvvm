FLUTTER := flutter

.PHONY: help analyze test build

help:
	@echo "Available targets:"
	@echo "  test           Run tests"
	@echo "  build          Build APK"

all: analyze test build

analyze:
	@echo "Running flutter analyze"
	flutter analyze

test:
	@echo "Running flutter test"
	flutter test

build:
	@echo "Running flutter build"
	flutter build apk --release

# check:
# 	- flutter analyze --no-fatal-infos --no-fatal-warnings || true