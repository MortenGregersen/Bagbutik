#!/bin/bash

set -e

# Define platforms to build for
PLATFORMS=(
"iOS:generic/platform=iOS"
"iOS Simulator:generic/platform=iOS Simulator"
"macOS:generic/platform=macOS"
#"tvOS:generic/platform=tvOS"
#"tvOS Simulator:generic/platform=tvOS Simulator"
#"watchOS:generic/platform=watchOS"
#"watchOS Simulator:generic/platform=watchOS Simulator"
#"visionOS:generic/platform=visionOS"
#"visionOS Simulator:generic/platform=visionOS Simulator"
)

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

# Create output directory
mkdir -p output

# Define the library products to build
PRODUCTS=(
"Bagbutik-Core"
"Bagbutik-Models"
"Bagbutik-AppStore"
"Bagbutik-GameCenter"
"Bagbutik-Marketplaces"
"Bagbutik-Provisioning"
"Bagbutik-Reporting"
"Bagbutik-TestFlight"
"Bagbutik-Users"
"Bagbutik-Webhooks"
"Bagbutik-XcodeCloud"
)

for PRODUCT in "${PRODUCTS[@]}"; do
  for platform_info in "${FILTERED_PLATFORMS[@]}"; do
    IFS=: read -r platform_name destination <<< "$platform_info"
    echo "Building $PRODUCT for $platform_name..."
    xcodebuild archive \
      -scheme "$PRODUCT" \
      -destination "$destination" \
      -archivePath "./build/$platform_name/$PRODUCT.xcarchive" \
      -parallelizeTargets \
      SKIP_INSTALL=NO \
      BUILD_LIBRARY_FOR_DISTRIBUTION=YES

    ARCH_FRAMEWORK_PATH="./build/$platform_name/$PRODUCT.xcarchive/Products/Library/Frameworks/${PRODUCT}.framework/${PRODUCT}"
    if [ -f "$ARCH_FRAMEWORK_PATH" ]; then
      echo "Architectures for $PRODUCT on $platform_name:"
      lipo -info "$ARCH_FRAMEWORK_PATH" || true
    else
      echo "Warning: Could not locate built binary for $PRODUCT on $platform_name"
    fi
  done
done

# Accumulate all frameworks for all products
XCFRAMEWORK_ARGS=()

for PRODUCT in "${PRODUCTS[@]}"; do
  while IFS= read -r framework; do
    XCFRAMEWORK_ARGS+=(-framework "$framework")
  done < <(find build -path "*/Products/Library/Frameworks/${PRODUCT}.framework" 2>/dev/null)
done

if [ ${#XCFRAMEWORK_ARGS[@]} -gt 0 ]; then
  NUM_LIBS=$((${#XCFRAMEWORK_ARGS[@]} / 2))
  echo "Found $NUM_LIBS platform libraries for all products combined"
  xcodebuild -create-xcframework \
    "${XCFRAMEWORK_ARGS[@]}" \
    -output "output/Bagbutik.xcframework"
else
  echo "Error: No libraries found for any product - this may indicate a build failure"
  exit 1
fi

# Create a zip archive of the combined XCFramework
cd output
zip -r Bagbutik.xcframework.zip Bagbutik.xcframework
cd ..

# Verify what was created
echo "Created XCFramework:"
ls -lh output/Bagbutik.xcframework/
