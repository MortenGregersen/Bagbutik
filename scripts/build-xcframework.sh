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

LIBRARY="Bagbutik"

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

CONFIGURATION="Release"
DEBUG_SYMBOLS="true"
PACKAGE_MANIFEST="$(pwd)/Package.swift"
PACKAGE_MANIFEST_BACKUP=""

BUILD_DIR="$(pwd)/build"
DIST_DIR="$(pwd)/output"

restore_package_manifest() {
  if [ -n "${PACKAGE_MANIFEST_BACKUP:-}" ] && [ -f "$PACKAGE_MANIFEST_BACKUP" ]; then
    mv "$PACKAGE_MANIFEST_BACKUP" "$PACKAGE_MANIFEST"
  fi
}

set_library_products_dynamic() {
  local temp_manifest
  local awk_status

  if [ ! -f "$PACKAGE_MANIFEST" ]; then
    echo "Unable to find $PACKAGE_MANIFEST"
    exit 18
  fi

  PACKAGE_MANIFEST_BACKUP="$(mktemp "${TMPDIR:-/tmp}/Package.swift.backup.XXXXXX")"
  cp "$PACKAGE_MANIFEST" "$PACKAGE_MANIFEST_BACKUP"

  temp_manifest="$(mktemp "${TMPDIR:-/tmp}/Package.swift.modified.XXXXXX")"

  awk -v target_library="$LIBRARY" '
{
  line = $0

  if (line ~ /^[[:space:]]*products:[[:space:]]*\[/) {
    in_products = 1
  } else if (in_products && line ~ /^[[:space:]]*dependencies:[[:space:]]*\[/) {
    in_products = 0
  }

  if (in_products && line ~ /^[[:space:]]*\.library\(/) {
    in_library = 1
    matched_library = 0
    has_dynamic_type = 0
    dynamic_indent = ""
  }

  if (in_library && line ~ /^[[:space:]]*name:[[:space:]]*"/) {
    name = line
    sub(/^[^"]*"/, "", name)
    sub(/".*$/, "", name)
    if (name == target_library) {
      matched_library = 1
      match(line, /[^[:space:]]/)
      if (RSTART > 1) {
        dynamic_indent = substr(line, 1, RSTART - 1)
      } else {
        dynamic_indent = "            "
      }
    }
  }

  if (in_library && matched_library && line ~ /^[[:space:]]*type:[[:space:]]*/) {
    if (line ~ /^[[:space:]]*type:[[:space:]]*\.dynamic,/) {
      has_dynamic_type = 1
      print line
    } else {
      print dynamic_indent "type: .dynamic,"
      has_dynamic_type = 1
    }
    next
  }

  if (in_library && matched_library && !has_dynamic_type &&
      (line ~ /^[[:space:]]*targets:[[:space:]]*\[/ || line ~ /^[[:space:]]*\),?[[:space:]]*$/)) {
    print dynamic_indent "type: .dynamic,"
    has_dynamic_type = 1
  }

  print line

  if (in_library && line ~ /^[[:space:]]*\),?[[:space:]]*$/) {
    in_library = 0
  }
}
' "$PACKAGE_MANIFEST" > "$temp_manifest"
  awk_status=$?

  if [ "$awk_status" -ne 0 ]; then
    rm -f "$temp_manifest"
    echo "Failed to prepare Package.swift for dynamic framework build."
    exit 19
  fi

  mv "$temp_manifest" "$PACKAGE_MANIFEST"
}

sdk_is_available() {
  sdk=$1
  xcrun --sdk "$sdk" --show-sdk-path >/dev/null 2>&1
}

require_all_sdks() {
  missing_sdks=()

  for sdk in "${SDKS[@]}"; do
    if ! sdk_is_available "$sdk"; then
      missing_sdks+=("$sdk (SDK not installed)")
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
  framework_path="$BUILD_DIR/Build/Products/$configuration_folder/PackageFrameworks/$scheme.framework"

  if [ ! -d "$framework_path" ]; then
    echo "Missing framework output at $framework_path"
    exit 13
  fi
}

create_xcframework() {
  scheme=$1
  shift 1

  echo "*** Create $scheme.xcframework ***"
  echo "Scheme: $scheme"
  echo "SDKs: $*"
  echo

  args=()
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
echo "****** Build Monolithic XCFramework ******"
echo

trap restore_package_manifest EXIT

rm -rf "$BUILD_DIR"
rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"

require_all_sdks
set_library_products_dynamic

for sdk in "${SDKS[@]}"; do
  build_framework "$LIBRARY" "$sdk"
  echo
done

create_xcframework "$LIBRARY" "${SDKS[@]}"

pushd "$DIST_DIR"
zip -r "$LIBRARY.xcframework.zip" "$LIBRARY.xcframework"
popd

echo "Finished building monolithic XCFramework archive in $DIST_DIR"
