FLUTTER = flutter
DART = dart

.PHONY: help analyze test build-android build-ios clean

help:
	@echo "Available targets:"
	@echo "  test           Run tests"
	@echo "  analyze        Analyze code"
	@echo "  build-apk      Build APK"
	@echo "  build-ios      Build IPA"

clean:
	@echo "Cleaning..."
	$(FLUTTER) clean

analyze:
	@echo "Running flutter analyze"
	$(FLUTTER) analyze

test:
	@echo "Running flutter test"
	$(FLUTTER) test

build-android:
	@echo "Running flutter analyze..."
	@$(FLUTTER) analyze || { echo "Flutter analyze found issues. Fix them before building."; exit 1; }
	@echo "Running flutter build"
	$(FLUTTER) build apk --release

build-ios: 
	@echo "Running flutter analyze..."
	@$(FLUTTER) analyze || { echo "Flutter analyze found issues. Fix them before building."; exit 1; }	
	@echo "Running flutter build"
	$(FLUTTER) build ios --release