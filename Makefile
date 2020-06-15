run:
		flutter run

emu:
		flutter emulators --launch Nexus_5X_API_29_x86

fmt:
		flutter format lib

mods:
		flutter packages run build_runner build --delete-conflicting-outputs

apk:
		flutter build apk --target-platform android-arm,android-arm64,android-x64 --split-per-abi

aab:
		flutter build appbundle --target-platform android-arm,android-arm64,android-x64
		## After the aab command has run successfully \
		open a terminal in build -> app -> outputs -> bundle -> release \
		to get the locaton of the aab file and proceed to extract the apk \
		Run: java -jar "PATH_TO_BUNDLETOOL" build-apks --bundle app-release.aab --output=app.apks --mode=universal --ks="PATH_TO_KEY" --ks-pass=pass:KEYSTORE_PASS --ks-key-alias=key \

icon:
		flutter pub run flutter_launcher_icons:main
rx:
		flutter pub global run rxdart_codemod:22_to_23