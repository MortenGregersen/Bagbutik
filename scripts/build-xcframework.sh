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

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/libraries.sh"

SDKS=(
  "$IOS_DEVICE_SDK"
  "$IOS_SIMULATOR_SDK"
  "$MACOS_SDK"
  "$TVOS_DEVICE_SDK"
  "$TVOS_SIMULATOR_SDK"
  "$WATCHOS_DEVICE_SDK"
  "$WATCHOS_SIMULATOR_SDK"
  "$VISIONOS_DEVICE_SDK"
  "$VISIONOS_SIMULATOR_SDK"
)

PACKAGE="Bagbutik"
CONFIGURATION="Release"
DEBUG_SYMBOLS="true"

BUILD_DIR="$(pwd)/build"
DIST_DIR="$(pwd)/output"

sdk_is_available() {
  sdk=$1
  xcrun --sdk "$sdk" --show-sdk-path >/dev/null 2>&1
}

platform_for_sdk() {
  case "$1" in
    "$IOS_DEVICE_SDK") echo "iOS" ;;
    "$IOS_SIMULATOR_SDK") echo "iOS Simulator" ;;
    "$MACOS_SDK") echo "macOS" ;;
    "$TVOS_DEVICE_SDK") echo "tvOS" ;;
    "$TVOS_SIMULATOR_SDK") echo "tvOS Simulator" ;;
    "$WATCHOS_DEVICE_SDK") echo "watchOS" ;;
    "$WATCHOS_SIMULATOR_SDK") echo "watchOS Simulator" ;;
    "$VISIONOS_DEVICE_SDK") echo "visionOS" ;;
    "$VISIONOS_SIMULATOR_SDK") echo "visionOS Simulator" ;;
    *)
      echo "Unknown SDK $1"
      exit 17
      ;;
  esac
}

get_available_platforms() {
  local destination_output
  destination_output="$(xcodebuild -scheme "${LIBRARIES[0]}" -showdestinations 2>/dev/null || true)"
  echo "$destination_output" \
    | awk '/Ineligible destinations/{exit} {print}' \
    | sed -n 's/.*platform:\([^,}]*\).*/\1/p' \
    | sort -u
}

platform_is_available() {
  local platform=$1
  printf '%s\n' "${AVAILABLE_PLATFORMS[@]}" | grep -Fxq "$platform"
}

require_all_sdks() {
  missing_sdks=()
  AVAILABLE_PLATFORMS=()
  while IFS= read -r platform; do
    [ -n "$platform" ] && AVAILABLE_PLATFORMS+=("$platform")
  done < <(get_available_platforms)

  for sdk in "${SDKS[@]}"; do
    if ! sdk_is_available "$sdk"; then
      missing_sdks+=("$sdk (SDK not installed)")
      continue
    fi

    required_platform="$(platform_for_sdk "$sdk")"
    if ! platform_is_available "$required_platform"; then
      missing_sdks+=("$sdk ($required_platform destination unavailable)")
    fi
  done

  if [ ${#missing_sdks[@]} -gt 0 ]; then
    echo "Missing required SDKs: ${missing_sdks[*]}"
    echo "Install the missing platforms in Xcode before building release artifacts."
    exit 16
  fi
}

run_xcodebuild() {
  if command -v xcpretty >/dev/null 2>&1; then
    xcodebuild "$@" | xcpretty
  else
    xcodebuild "$@"
  fi
}

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

  echo "*** Build framework ***"
  echo "Scheme: $scheme"
  echo "Configuration: $CONFIGURATION"
  echo "SDK: $sdk"
  echo "Destination: $dest"
  echo

  (run_xcodebuild \
    -scheme "$scheme" \
    -configuration "$CONFIGURATION" \
    -destination "$dest" \
    -sdk "$sdk" \
    -derivedDataPath "$BUILD_DIR" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
    OTHER_SWIFT_FLAGS="-no-verify-emitted-module-interface") || exit 12

  if [ "$sdk" = "$MACOS_SDK" ]; then
    configuration_folder=$CONFIGURATION
  else
    configuration_folder="$CONFIGURATION-$sdk"
  fi
  product_path="$BUILD_DIR/Build/Products/$configuration_folder"
  framework_path="$product_path/PackageFrameworks/$scheme.framework"

  # Copy Modules
  modules_path="$framework_path/Modules"
  mkdir -p "$modules_path"
  cp -pv \
    "$BUILD_DIR/Build/Intermediates.noindex/$PACKAGE.build/$configuration_folder/$scheme.build/$scheme.modulemap" \
    "$modules_path" || exit 13
  underscored_scheme="${scheme//-/_}"
  mkdir -p "$modules_path/$underscored_scheme.swiftmodule"
  cp -pv "$product_path/$underscored_scheme.swiftmodule"/*.* "$modules_path/$underscored_scheme.swiftmodule/" || exit 14

  # Copy Bundle
  bundle_dir="$product_path/${PACKAGE}_$scheme.bundle"
  if [ -d "$bundle_dir" ]; then
    cp -prv "$bundle_dir"/* "$framework_path/" || exit 15
  fi
}

create_xcframework() {
  scheme=$1

  echo "*** Create $scheme.xcframework ***"
  echo "Scheme: $scheme"
  echo "SDKs: $@"
  echo

  args=()
  shift 1
  for p in "$@"; do
    if [ "$p" = "$MACOS_SDK" ]; then
      configuration_folder=$CONFIGURATION
    else
      configuration_folder="$CONFIGURATION-$p"
    fi
    args+=(-framework "$BUILD_DIR/Build/Products/$configuration_folder/PackageFrameworks/$scheme.framework")
    symbol_path="$BUILD_DIR/Build/Products/$configuration_folder/$scheme.framework.dSYM"
    if [ "$DEBUG_SYMBOLS" = "true" ] && [ -d "$symbol_path" ]; then
      args+=(-debug-symbols "$symbol_path")
    fi
  done

  xcodebuild -create-xcframework "${args[@]}" -output "$DIST_DIR/$scheme.xcframework" || exit 21
}

echo
echo "****** Build Modular XCFrameworks ******"
echo

rm -rf "$BUILD_DIR"
rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"

require_all_sdks

for library in "${LIBRARIES[@]}"; do
  for sdk in "${SDKS[@]}"; do
    build_framework "$library" "$sdk"
    echo
  done

  create_xcframework "$library" "${SDKS[@]}"
  pushd "$DIST_DIR"
  zip -r "$library.xcframework.zip" "$library.xcframework"
  popd
  echo
done

echo "Finished building modular XCFramework archives in $DIST_DIR"
