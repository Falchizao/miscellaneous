#!/bin/bash

FLUTTER_PROJECT_PATH="/app/lib"
IOS_APP_BUNDLE_ID="com.falchizao.scarletgrahp"
ANDROID_APP_BUNDLE_ID="com.falchizao.scarletgrahp"

cd "$FLUTTER_PROJECT_PATH"
flutter clean
flutter build ios --release

cd build/ios
xcodebuild archive -workspace Runner.xcworkspace -scheme Runner -archivePath Runner.xcarchive

xcodebuild -exportArchive -archivePath Runner.xcarchive -exportOptionsPlist exportOptions.plist -exportPath ios_build_output

cd "$FLUTTER_PROJECT_PATH"
flutter clean
flutter build appbundle

cd build/app/outputs/bundle/release

cd "$FLUTTER_PROJECT_PATH"
rm -rf build

echo "Build and deployment process completed!"

