#!/bin/bash

set -euo pipefail

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

if [ -n "${BAGBUTIK_SDKS:-}" ]; then
  IFS=',' read -r -a SDKS <<< "$BAGBUTIK_SDKS"
fi
CONFIGURATION="Release"
BUILD_LIBRARY_FOR_DISTRIBUTION="${BAGBUTIK_BUILD_LIBRARY_FOR_DISTRIBUTION:-YES}"
CODESIGN_IDENTITY="${BAGBUTIK_CODESIGN_IDENTITY:--}"

if [ "$BUILD_LIBRARY_FOR_DISTRIBUTION" != "YES" ] && [ "$BUILD_LIBRARY_FOR_DISTRIBUTION" != "NO" ]; then
  echo "Invalid BAGBUTIK_BUILD_LIBRARY_FOR_DISTRIBUTION value: $BUILD_LIBRARY_FOR_DISTRIBUTION"
  echo "Expected YES or NO."
  exit 10
fi

should_codesign() {
  [ "$CODESIGN_IDENTITY" != "none" ]
}

codesign_framework() {
  local framework_path=$1

  if ! should_codesign; then
    return
  fi

  echo "Codesigning framework: $framework_path"
  codesign --force --sign "$CODESIGN_IDENTITY" --timestamp=none "$framework_path" || exit 22
  codesign --verify --strict "$framework_path" || exit 23
}

ROOT_DIR="$(pwd)"
BUILD_DIR="$ROOT_DIR/build"
DIST_DIR="$ROOT_DIR/output"
MONOLITHIC_PACKAGE_DIR="$BUILD_DIR/MonolithicPackage"

discover_libraries() {
  LIBRARIES=()
  while IFS= read -r library; do
    LIBRARIES+=("$library")
  done < <(
    find "$ROOT_DIR/Sources" -mindepth 1 -maxdepth 1 -type d -name 'Bagbutik-*' -print \
      | sed 's#.*/##' \
      | sort
  )

  if [ ${#LIBRARIES[@]} -eq 0 ]; then
    echo "No source libraries found in $ROOT_DIR/Sources matching Bagbutik-*"
    exit 17
  fi

  echo "Discovered libraries:"
  for library in "${LIBRARIES[@]}"; do
    echo "- $library"
  done
}

sdk_is_available() {
  local sdk=$1
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

prepare_monolithic_package() {
  echo "*** Prepare release package ***"

  rm -rf "$MONOLITHIC_PACKAGE_DIR"
  mkdir -p "$MONOLITHIC_PACKAGE_DIR/Sources/$LIBRARY"

  cat > "$MONOLITHIC_PACKAGE_DIR/Package.swift" <<PACKAGE_EOF
// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "$LIBRARY",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "$LIBRARY",
            type: .dynamic,
            targets: ["$LIBRARY"]
        )
    ],
    targets: [
        .target(name: "$LIBRARY")
    ],
    swiftLanguageVersions: [.v5, .version("6")]
)
PACKAGE_EOF

  for library in "${LIBRARIES[@]}"; do
    source_path="$ROOT_DIR/Sources/$library"
    if [ ! -d "$source_path" ]; then
      echo "Missing source directory: $source_path"
      exit 18
    fi

    target_path="$MONOLITHIC_PACKAGE_DIR/Sources/$LIBRARY/$library"
    mkdir -p "$target_path"
    cp -R "$source_path"/. "$target_path"
  done

  # In the monolithic release target all Bagbutik types live in the same module,
  # so inter-module imports must be removed.
  while IFS= read -r -d '' file; do
    perl -0pi -e 's/^import Bagbutik_[A-Za-z0-9_]+\n//mg' "$file"
  done < <(find "$MONOLITHIC_PACKAGE_DIR/Sources/$LIBRARY" -name '*.swift' -type f -print0)
}

build_framework() {
  local scheme=$1
  local sdk=$2
  local dest=""
  local -a build_settings=(
    "SKIP_INSTALL=NO"
    "BUILD_LIBRARY_FOR_DISTRIBUTION=$BUILD_LIBRARY_FOR_DISTRIBUTION"
    "OTHER_SWIFT_FLAGS=-no-verify-emitted-module-interface"
  )

  if [ "$sdk" = "$IOS_DEVICE_SDK" ]; then
    dest="generic/platform=iOS"
  elif [ "$sdk" = "$IOS_SIMULATOR_SDK" ]; then
    dest="generic/platform=iOS Simulator"
  elif [ "$sdk" = "$MACOS_SDK" ]; then
    dest="generic/platform=macOS"
  elif [ "$sdk" = "$TVOS_DEVICE_SDK" ]; then
    dest="generic/platform=tvOS"
  elif [ "$sdk" = "$TVOS_SIMULATOR_SDK" ]; then
    dest="generic/platform=tvOS Simulator"
  elif [ "$sdk" = "$WATCHOS_DEVICE_SDK" ]; then
    dest="generic/platform=watchOS"
    build_settings+=("EXCLUDED_ARCHS=armv7k")
  elif [ "$sdk" = "$WATCHOS_SIMULATOR_SDK" ]; then
    dest="generic/platform=watchOS Simulator"
  elif [ "$sdk" = "$VISIONOS_DEVICE_SDK" ]; then
    dest="generic/platform=visionOS"
  elif [ "$sdk" = "$VISIONOS_SIMULATOR_SDK" ]; then
    dest="generic/platform=visionOS Simulator"
  else
    echo "Unknown SDK $sdk"
    exit 11
  fi

  echo "*** Build framework ***"
  echo "Scheme: $scheme"
  echo "Configuration: $CONFIGURATION"
  echo "SDK: $sdk"
  echo "Destination: $dest"
  if [ "$sdk" = "$WATCHOS_DEVICE_SDK" ]; then
    echo "Excluded architectures: armv7k"
  fi
  echo

  (
    cd "$MONOLITHIC_PACKAGE_DIR"
    xcodebuild \
      -scheme "$scheme" \
      -configuration "$CONFIGURATION" \
      -destination "$dest" \
      -sdk "$sdk" \
      -derivedDataPath "$BUILD_DIR" \
      "${build_settings[@]}"
  ) || exit 12

  local configuration_folder=""
  if [ "$sdk" = "$MACOS_SDK" ]; then
    configuration_folder=$CONFIGURATION
  else
    configuration_folder="$CONFIGURATION-$sdk"
  fi

  local product_path="$BUILD_DIR/Build/Products/$configuration_folder"
  local framework_path="$product_path/PackageFrameworks/$scheme.framework"
  local modules_path="$framework_path/Modules"

  if [ ! -d "$framework_path" ]; then
    echo "Missing framework output at $framework_path"
    exit 13
  fi

  mkdir -p "$modules_path"

  local modulemap_source="$BUILD_DIR/Build/Intermediates.noindex/$scheme.build/$configuration_folder/$scheme.build/$scheme.modulemap"
  if [ ! -f "$modulemap_source" ]; then
    echo "Missing module map output at $modulemap_source"
    exit 14
  fi
  cp -pv "$modulemap_source" "$modules_path" || exit 15

  local header_source=""
  header_source="$(find "$BUILD_DIR/Build/Intermediates.noindex/$scheme.build/$configuration_folder/$scheme.build/Objects-normal" -name "$scheme-Swift.h" -type f | head -n 1)"
  if [ -z "$header_source" ]; then
    echo "Missing generated Swift header for module $scheme"
    exit 16
  fi
  cp -pv "$header_source" "$modules_path" || exit 17

  local swiftmodule_source="$product_path/$scheme.swiftmodule"
  if [ ! -d "$swiftmodule_source" ]; then
    echo "Missing swiftmodule output at $swiftmodule_source"
    exit 18
  fi

  mkdir -p "$modules_path/$scheme.swiftmodule"
  cp -pv "$swiftmodule_source"/*.* "$modules_path/$scheme.swiftmodule/" || exit 19

  codesign_framework "$framework_path"
}

create_xcframework() {
  local scheme=$1
  shift 1

  echo "*** Create $scheme.xcframework ***"
  echo "Scheme: $scheme"
  echo "SDKs: $*"
  echo

  args=()
  for sdk in "$@"; do
    local configuration_folder=""
    if [ "$sdk" = "$MACOS_SDK" ]; then
      configuration_folder=$CONFIGURATION
    else
      configuration_folder="$CONFIGURATION-$sdk"
    fi

    args+=(-framework "$BUILD_DIR/Build/Products/$configuration_folder/PackageFrameworks/$scheme.framework")

    local symbol_path="$BUILD_DIR/Build/Products/$configuration_folder/$scheme.framework.dSYM"
    if [ -d "$symbol_path" ]; then
      args+=(-debug-symbols "$symbol_path")
    fi
  done

  xcodebuild -create-xcframework "${args[@]}" -output "$DIST_DIR/$scheme.xcframework" || exit 21
}

echo
echo "****** Build XCFramework ******"
echo
echo "BUILD_LIBRARY_FOR_DISTRIBUTION: $BUILD_LIBRARY_FOR_DISTRIBUTION"
echo

rm -rf "$BUILD_DIR"
rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"

require_all_sdks
discover_libraries
prepare_monolithic_package

for sdk in "${SDKS[@]}"; do
  build_framework "$LIBRARY" "$sdk"
  echo
done

create_xcframework "$LIBRARY" "${SDKS[@]}"

if should_codesign; then
  while IFS= read -r -d '' framework_path; do
    codesign_framework "$framework_path"
  done < <(find "$DIST_DIR/$LIBRARY.xcframework" -type d -name '*.framework' -print0)
fi

pushd "$DIST_DIR" >/dev/null
if [ "${BAGBUTIK_SKIP_ZIP:-false}" = "true" ]; then
  echo "Skipping zip step because BAGBUTIK_SKIP_ZIP=true"
else
  zip -r "$LIBRARY.xcframework.zip" "$LIBRARY.xcframework"
fi
popd >/dev/null

echo "Finished building XCFramework archive in $DIST_DIR"
