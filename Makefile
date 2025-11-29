.PHONY: android_build icons splash runner upgrade clean

android_build:
	@echo "Building Android release..."
	@make clean
	@mkdir -p dist/android
	@fvm flutter build appbundle --release --obfuscate --split-debug-info=./build/android/debug-info
	@cp ./build/app/outputs/bundle/release/app-release.aab ./dist/android/tabnews_release.aab
	@cd ./build/app/intermediates/merged_native_libs/release/mergeReleaseNativeLibs/out/lib/ && zip -r ../../../../../../../../dist/android/tabnews_release_symbols.zip ./

icons:
	@echo "Generating launcher icons"
	@fvm dart run icons_launcher:create
	@fvm dart run flutter_launcher_icons

splash:
	@echo "Generating splash screen"
	@fvm dart run flutter_native_splash:create

runner:
	@echo "Running build-runner"
	@fvm dart run build_runner build -d

upgrade:
	@echo "Upgrading project"
	@fvm flutter clean
	@fvm flutter pub get
	@fvm flutter pub upgrade
	@fvm flutter pub upgrade --major-versions

clean:
	@echo "Cleaning project"
	@rm -rf dist/
	@fvm flutter clean
	@fvm flutter pub get
