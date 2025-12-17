#!/bin/bash

set -e

PLATFORMS=(
  "iOS:generic/platform=iOS"
  "iOS Simulator:generic/platform=iOS Simulator"
  "macOS:generic/platform=macOS"
  "tvOS:generic/platform=tvOS"
  "tvOS Simulator:generic/platform=tvOS Simulator"
  "watchOS:generic/platform=watchOS"
  "watchOS Simulator:generic/platform=watchOS Simulator"
  "visionOS:generic/platform=visionOS"
  "visionOS Simulator:generic/platform=visionOS Simulator"
)

# Detect which SDKs are actually installed
AVAILABLE_SDKS=$(xcodebuild -showsdks)
FILTERED_PLATFORMS=()
for platform_info in "${PLATFORMS[@]}"; do
  IFS=: read -r platform_name destination <<< "$platform_info"
  sdk=""
  case "$platform_name" in
    "iOS") sdk="iphoneos" ;;
    "iOS Simulator") sdk="iphonesimulator" ;;
    "macOS") sdk="macosx" ;;
    "tvOS") sdk="appletvos" ;;
    "tvOS Simulator") sdk="appletvsimulator" ;;
    "watchOS") sdk="watchos" ;;
    "watchOS Simulator") sdk="watchsimulator" ;;
    "visionOS") sdk="xros" ;;
    "visionOS Simulator") sdk="xrsimulator" ;;
  esac
  if [[ -n "$sdk" && "$AVAILABLE_SDKS" == *"$sdk"* ]]; then
    FILTERED_PLATFORMS+=("$platform_info")
  else
    echo "Skipping $platform_name (SDK $sdk not available)"
  fi
done

if [ ${#FILTERED_PLATFORMS[@]} -eq 0 ]; then
  echo "Error: No available SDKs found for any platform"
  exit 1
fi

# Output and temporary dirs
mkdir -p output
TEMP_DIR="build/temp"
rm -rf "$TEMP_DIR"
mkdir -p "$TEMP_DIR"

PRODUCT="Bagbutik"

for platform_info in "${FILTERED_PLATFORMS[@]}"; do
  IFS=: read -r platform_name destination <<< "$platform_info"
  NORM_PLATFORM_NAME="${platform_name// /_}"

  xcodebuild archive \
    -scheme "$PRODUCT" \
    -destination "$destination" \
    -archivePath "./build/$NORM_PLATFORM_NAME/${PRODUCT}.xcarchive" \
    -parallelizeTargets \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

  # SwiftPM archives static libs into Products/usr/local/lib
  ORIG_FW="./build/$NORM_PLATFORM_NAME/${PRODUCT}.xcarchive/Products/usr/local/lib/${PRODUCT}.framework"
  DEST_FW="./build/temp/$NORM_PLATFORM_NAME/${PRODUCT}.framework"

  mkdir -p "$(dirname "$DEST_FW")"
  cp -R "$ORIG_FW" "$DEST_FW"

  # Rename the binary inside if it matches the original product name
  if [ -f "$DEST_FW/$PRODUCT" ]; then
    mv "$DEST_FW/$PRODUCT" "$DEST_FW/$PRODUCT"
  fi

  # Report architectures
  ARCH_FRAMEWORK_PATH="$DEST_FW/$PRODUCT"
  if [ -f "$ARCH_FRAMEWORK_PATH" ]; then
    lipo -info "$ARCH_FRAMEWORK_PATH" || true
  else
    echo "⚠️ Warning: Could not locate built binary at $ARCH_FRAMEWORK_PATH"
  fi

  echo
done

XCFRAMEWORK_ARGS=()

# Collect renamed frameworks from temp directory
while IFS= read -r framework; do
  XCFRAMEWORK_ARGS+=(-framework "$framework")
done < <(find build/temp -path "*/${PRODUCT}.framework" 2>/dev/null)

if [ ${#XCFRAMEWORK_ARGS[@]} -gt 0 ]; then
  xcodebuild -create-xcframework \
    "${XCFRAMEWORK_ARGS[@]}" \
    -output "output/Bagbutik.xcframework"
else
  echo "❌ Error: No frameworks found — build likely failed"
  exit 1
fi

# Clean up temp
rm -rf "$TEMP_DIR"

cd output
zip -r Bagbutik.xcframework.zip Bagbutik.xcframework
cd ..

echo "✔ Created XCFramework:"
ls -lh output/Bagbutik.xcframework/
