#!/bin/bash

set -euo pipefail

# Inspired by https://waynestalk.com/en/build-swift-package-as-xcframework-en/

IOS_DEVICE_SDK="iphoneos"
IOS_SIMULATOR_SDK="iphonesimulator"
MACOS_SDK="macosx"
TVOS_DEVICE_SDK="appletvos"
TVOS_SIMULATOR_SDK="appletvsimulator"
WATCHOS_DEVICE_SDK="watchos"
WATCHOS_SIMULATOR_SDK="watchsimulator"
VISIONOS_DEVICE_SDK="xros"
VISIONOS_SIMULATOR_SDK="xrsimulator"

SDKS=(
    $IOS_DEVICE_SDK
    $IOS_SIMULATOR_SDK
    $MACOS_SDK
    $TVOS_DEVICE_SDK
    $TVOS_SIMULATOR_SDK
    $WATCHOS_DEVICE_SDK
    $WATCHOS_SIMULATOR_SDK
    $VISIONOS_DEVICE_SDK
    $VISIONOS_SIMULATOR_SDK
)

PACKAGE="Bagbutik"
CONFIGURATION="Release"
DEBUG_SYMBOLS="true"

BUILD_DIR="$(pwd)/build"
DIST_DIR="$(pwd)/dist"

build_framework() {
  scheme=$1
  sdk=$2
  if [ "$2" = "$IOS_DEVICE_SDK" ]; then
    dest="generic/platform=iOS"
  elif [ "$2" = "$IOS_SIMULATOR_SDK" ]; then
    dest="generic/platform=iOS Simulator"
  elif [ "$2" = "$MACOS_SDK" ]; then
  dest="generic/platform=macOS"
  elif [ "$2" = "$TVOS_DEVICE_SDK" ]; then
  dest="generic/platform=tvOS"
  elif [ "$2" = "$TVOS_SIMULATOR_SDK" ]; then
  dest="generic/platform=tvOS Simulator"
  elif [ "$2" = "$WATCHOS_DEVICE_SDK" ]; then
  dest="generic/platform=watchOS"
  elif [ "$2" = "$WATCHOS_SIMULATOR_SDK" ]; then
  dest="generic/platform=watchOS Simulator"
  elif [ "$2" = "$VISIONOS_DEVICE_SDK" ]; then
  dest="generic/platform=visionOS"
  elif [ "$2" = "$VISIONOS_SIMULATOR_SDK" ]; then
  dest="generic/platform=visionOS Simulator"
  else
    echo "Unknown SDK $2"
    exit 11
  fi

  echo "Build framework"
  echo "Scheme: $scheme"
  echo "Configuration: $CONFIGURATION"
  echo "SDK: $sdk"
  echo "Destination: $dest"
  echo

  (xcodebuild \
    -scheme "$scheme" \
    -configuration "$CONFIGURATION" \
    -destination "$dest" \
    -sdk "$sdk" \
    -derivedDataPath "$BUILD_DIR" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    OTHER_SWIFT_FLAGS="-no-verify-emitted-module-interface") || exit 12

  product_path="$BUILD_DIR/Build/Products/$CONFIGURATION-$sdk"
  framework_path="$product_path/PackageFrameworks/$scheme.framework"

  # Copy Headers
  swift_header=$(find "$BUILD_DIR/Build/Intermediates.noindex" \
    -path "*$scheme.build*" \
    -name "$scheme-Swift.h" \
    -print -quit)
  if [ -z "$swift_header" ]; then
    echo "Error: Swift header not found for $scheme ($sdk)"
    exit 13
  fi
  cp -pv "$swift_header" "$headers_path/" || exit 13

  # Copy other headers from Sources/
  while IFS= read -r h; do
    cp -pv "$h" "$headers_path" || exit 14
  done < <(find "$PACKAGE/$scheme" -name "*.h")

  # Copy Modules
  modules_path="$framework_path/Modules"
  mkdir -p "$modules_path"
  cp -pv \
    "$BUILD_DIR/Build/Intermediates.noindex/$PACKAGE.build/$CONFIGURATION-$sdk/$scheme.build/$scheme.modulemap" \
    "$modules_path" || exit 15
  mkdir -p "$modules_path/$scheme.swiftmodule"
  cp -pv "$product_path/$scheme.swiftmodule"/*.* "$modules_path/$scheme.swiftmodule/" || exit 16

  # Copy Bundle
  bundle_dir="$product_path/${PACKAGE}_$scheme.bundle"
  if [ -d "$bundle_dir" ]; then
    cp -prv "$bundle_dir"/* "$framework_path/" || exit 17
  fi
}

create_xcframework() {
  scheme=$1

  echo "Create $scheme.xcframework"

  args=()
  shift 1
  for p in "$@"; do
    args+=(-framework "$BUILD_DIR/Build/Products/$CONFIGURATION-$p/PackageFrameworks/$scheme.framework")
    if [ "$DEBUG_SYMBOLS" = "true" ]; then
      args+=(-debug-symbols "$BUILD_DIR/Build/Products/$CONFIGURATION-$p/$scheme.framework.dSYM")
    fi
  done

  xcodebuild -create-xcframework "${args[@]}" -output "$DIST_DIR/$scheme.xcframework" || exit 21
}

reset_package_type() {
  sed -i '' -E 's/^([[:space:]]*)type:[[:space:]]*\.dynamic,/\1\/\/ type: .dynamic,/' Package.swift || exit
}

set_package_type_as_dynamic() {
  sed -i '' -E 's/^([[:space:]]*)\/\/[[:space:]]*type:[[:space:]]*\.dynamic,/\1type: .dynamic,/' Package.swift || exit
}

echo "**********************************"
echo "******* Build XCFrameworks *******"
echo "**********************************"
echo

rm -rf "$BUILD_DIR"
rm -rf "$DIST_DIR"

reset_package_type

set_package_type_as_dynamic

for sdk in "${SDKS[@]}"; do
  build_framework "Bagbutik" "$sdk"
done
create_xcframework "Bagbutik" "${FILTERED_SDKS[@]}"

reset_package_type
