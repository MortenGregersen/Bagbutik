#!/bin/bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
BUILD_DIR="$ROOT_DIR/build/xcframework"
DIST_DIR="$ROOT_DIR/output"
INTEGRATION_DIR="$BUILD_DIR/integration"
CONFIGURATION="release"
BUILD_TARGETS=(
  "BagbutikReporting"
  "BagbutikUsers"
  "BagbutikWebhooks"
)

MODULES=(
  "BagbutikCore"
  "BagbutikModelsShared"
  "BagbutikReportingModels"
  "BagbutikReporting"
  "BagbutikUsersModels"
  "BagbutikUsers"
  "BagbutikWebhooksModels"
  "BagbutikWebhooks"
)

SDKS=(
  "iphoneos"
  "iphonesimulator"
  "macosx"
  "appletvos"
  "appletvsimulator"
  "watchos"
  "watchsimulator"
  "xros"
  "xrsimulator"
)

if [ -n "${BAGBUTIK_SDKS:-}" ]; then
  IFS=',' read -r -a SDKS <<< "$BAGBUTIK_SDKS"
fi

sdk_triples() {
  case "$1" in
    iphoneos)
      echo "arm64-apple-ios15.0"
      ;;
    iphonesimulator)
      echo "arm64-apple-ios15.0-simulator"
      echo "x86_64-apple-ios15.0-simulator"
      ;;
    macosx)
      echo "arm64-apple-macosx12.0"
      echo "x86_64-apple-macosx12.0"
      ;;
    appletvos)
      echo "arm64-apple-tvos15.0"
      ;;
    appletvsimulator)
      echo "arm64-apple-tvos15.0-simulator"
      echo "x86_64-apple-tvos15.0-simulator"
      ;;
    watchos)
      echo "arm64_32-apple-watchos9.0"
      echo "arm64-apple-watchos9.0"
      ;;
    watchsimulator)
      echo "arm64-apple-watchos9.0-simulator"
      echo "x86_64-apple-watchos9.0-simulator"
      ;;
    xros)
      echo "arm64-apple-xros1.0"
      ;;
    xrsimulator)
      echo "arm64-apple-xros1.0-simulator"
      ;;
    *)
      echo "Unknown SDK: $1" >&2
      exit 11
      ;;
  esac
}

swiftpm_triple_directory() {
  if [[ "$1" == *-apple-xros* ]]; then
    echo "$1"
    return
  fi

  echo "$1" | sed -E 's/(macosx|ios|tvos|watchos|xros)[0-9]+(\.[0-9]+)*/\1/'
}

swift_module_triple() {
  echo "$1" \
    | sed -E 's/(macosx|ios|tvos|watchos|xros)[0-9]+(\.[0-9]+)*/\1/' \
    | sed 's/apple-macosx/apple-macos/'
}

sdk_path() {
  xcrun --sdk "$1" --show-sdk-path
}

require_tools_and_sdks() {
  local tool
  local sdk
  local missing=()

  for tool in swift xcodebuild xcrun zip; do
    if ! command -v "$tool" >/dev/null 2>&1; then
      missing+=("$tool")
    fi
  done

  for sdk in "${SDKS[@]}"; do
    if ! xcrun --sdk "$sdk" --show-sdk-path >/dev/null 2>&1; then
      missing+=("$sdk SDK")
    fi
  done

  if [ ${#missing[@]} -gt 0 ]; then
    echo "Missing required build tools or SDKs: ${missing[*]}" >&2
    exit 12
  fi
}

prepare_directories() {
  if [ "$BUILD_DIR" != "$ROOT_DIR/build/xcframework" ] || [ "$DIST_DIR" != "$ROOT_DIR/output" ]; then
    echo "Refusing to clean unexpected build paths." >&2
    exit 13
  fi

  if [ "${BAGBUTIK_KEEP_BUILD:-false}" != "true" ]; then
    rm -rf "$BUILD_DIR"
  else
    rm -rf "$BUILD_DIR/thin"
    rm -rf "$BUILD_DIR/libraries"
    rm -rf "$INTEGRATION_DIR"
  fi
  rm -rf "$DIST_DIR"
  mkdir -p "$BUILD_DIR" "$DIST_DIR"
}

build_triple() {
  local sdk=$1
  local triple=$2
  local sdk_root
  local scratch_path="$BUILD_DIR/swiftpm/$triple"

  sdk_root="$(sdk_path "$sdk")"

  if [ "$sdk" = "xros" ] || [ "$sdk" = "xrsimulator" ]; then
    build_visionos_triple "$triple" "$sdk_root"
    return
  fi

  local build_target
  for build_target in "${BUILD_TARGETS[@]}"; do
    echo "Building $build_target for $triple"
    swift build \
      --package-path "$ROOT_DIR" \
      --scratch-path "$scratch_path" \
      --triple "$triple" \
      --sdk "$sdk_root" \
      --target "$build_target" \
      --configuration "$CONFIGURATION" \
      -Xswiftc -enable-library-evolution \
      -Xswiftc -emit-module-interface
  done
}

module_source_directory() {
  case "$1" in
    BagbutikCore)
      echo "$ROOT_DIR/Sources/Bagbutik-Core"
      ;;
    BagbutikModelsShared)
      echo "$ROOT_DIR/Sources/BagbutikModelsShared"
      ;;
    BagbutikReportingModels)
      echo "$ROOT_DIR/Sources/BagbutikReportingModels"
      ;;
    BagbutikReporting)
      echo "$ROOT_DIR/Sources/Bagbutik-Reporting"
      ;;
    BagbutikUsersModels)
      echo "$ROOT_DIR/Sources/BagbutikUsersModels"
      ;;
    BagbutikUsers)
      echo "$ROOT_DIR/Sources/Bagbutik-Users"
      ;;
    BagbutikWebhooksModels)
      echo "$ROOT_DIR/Sources/BagbutikWebhooksModels"
      ;;
    BagbutikWebhooks)
      echo "$ROOT_DIR/Sources/Bagbutik-Webhooks"
      ;;
    *)
      echo "No source directory mapping for $1" >&2
      exit 18
      ;;
  esac
}

build_visionos_triple() {
  local triple=$1
  local sdk_root=$2
  local product_directory="$BUILD_DIR/direct/$triple"
  local modules_directory="$product_directory/Modules"
  local module
  local source_directory
  local module_build_directory
  local sources=()

  echo "Building runtime modules directly for $triple"
  mkdir -p "$modules_directory" "$product_directory/ModuleCache"

  for module in "${MODULES[@]}"; do
    source_directory="$(module_source_directory "$module")"
    module_build_directory="$product_directory/$module.build"
    sources=()

    while IFS= read -r source; do
      sources+=("$source")
    done < <(find "$source_directory" -type f -name '*.swift' -print | sort)

    if [ ${#sources[@]} -eq 0 ]; then
      echo "No Swift sources found for $module at $source_directory" >&2
      exit 19
    fi

    mkdir -p "$module_build_directory"
    swiftc "${sources[@]}" \
      -parse-as-library \
      -O \
      -whole-module-optimization \
      -swift-version 6 \
      -target "$triple" \
      -sdk "$sdk_root" \
      -module-cache-path "$product_directory/ModuleCache" \
      -I "$modules_directory" \
      -module-name "$module" \
      -enable-library-evolution \
      -emit-module \
      -emit-module-path "$modules_directory/$module.swiftmodule" \
      -emit-module-interface-path "$module_build_directory/$module.swiftinterface" \
      -emit-object \
      -o "$module_build_directory/$module.o"
  done
}

archive_thin_module() {
  local sdk=$1
  local triple=$2
  local module=$3
  local triple_directory
  local product_directory
  local module_build_directory
  local thin_directory="$BUILD_DIR/thin/$triple"
  local objects=()

  if [ "$sdk" = "xros" ] || [ "$sdk" = "xrsimulator" ]; then
    product_directory="$BUILD_DIR/direct/$triple"
  else
    triple_directory="$(swiftpm_triple_directory "$triple")"
    product_directory="$BUILD_DIR/swiftpm/$triple/$triple_directory/$CONFIGURATION"
  fi
  module_build_directory="$product_directory/$module.build"

  if [ ! -f "$module_build_directory/$module.swiftinterface" ]; then
    echo "Missing public module interface for $module at $module_build_directory" >&2
    exit 14
  fi

  while IFS= read -r object; do
    objects+=("$object")
  done < <(find "$module_build_directory" -maxdepth 1 -type f -name '*.o' -print | sort)

  if [ ${#objects[@]} -eq 0 ]; then
    echo "No object files found for $module at $module_build_directory" >&2
    exit 15
  fi

  mkdir -p "$thin_directory"
  xcrun libtool -static -o "$thin_directory/lib$module.a" "${objects[@]}"

  local interface_directory="$BUILD_DIR/libraries/$sdk/$module/Headers/$module.swiftmodule"
  mkdir -p "$interface_directory"
  cp "$module_build_directory/$module.swiftinterface" "$interface_directory/$(swift_module_triple "$triple").swiftinterface"
}

combine_sdk_module() {
  local sdk=$1
  local module=$2
  local libraries=()
  local triple
  local output_directory="$BUILD_DIR/libraries/$sdk/$module"

  while IFS= read -r triple; do
    libraries+=("$BUILD_DIR/thin/$triple/lib$module.a")
  done < <(sdk_triples "$sdk")

  mkdir -p "$output_directory"
  xcrun lipo -create "${libraries[@]}" -output "$output_directory/lib$module.a"
  xcrun strip -S "$output_directory/lib$module.a"
}

create_module_xcframework() {
  local module=$1
  local args=()
  local sdk

  for sdk in "${SDKS[@]}"; do
    args+=(
      -library "$BUILD_DIR/libraries/$sdk/$module/lib$module.a"
      -headers "$BUILD_DIR/libraries/$sdk/$module/Headers"
    )
  done

  echo "Creating $module.xcframework"
  xcodebuild -create-xcframework "${args[@]}" -output "$DIST_DIR/$module.xcframework"

  if find "$DIST_DIR/$module.xcframework" -type f -name '*.swiftinterface' -print -quit | grep -q .; then
    return
  fi

  echo "No public Swift module interfaces found in $module.xcframework" >&2
  exit 16
}

zip_module_xcframework() {
  local module=$1

  if [ "${BAGBUTIK_SKIP_ZIP:-false}" = "true" ]; then
    return
  fi

  (
    cd "$DIST_DIR"
    zip -qry "$module.xcframework.zip" "$module.xcframework"
  )
}

prepare_binary_integration_fixture() {
  mkdir -p "$INTEGRATION_DIR/BagbutikBinaryPackage/Artifacts"
  mkdir -p "$INTEGRATION_DIR/BagbutikReportingBinaryClient/Sources/BagbutikReportingBinaryClient"
  mkdir -p "$INTEGRATION_DIR/BagbutikUsersBinaryClient/Sources/BagbutikUsersBinaryClient"
  mkdir -p "$INTEGRATION_DIR/BagbutikWebhooksBinaryClient/Sources/BagbutikWebhooksBinaryClient"

  cat > "$INTEGRATION_DIR/BagbutikBinaryPackage/Package.swift" <<'PACKAGE_EOF'
// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "Bagbutik",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v9),
        .visionOS(.v1),
    ],
    products: [
        .library(
            name: "BagbutikReporting",
            targets: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikReportingModels",
                "BagbutikReporting",
            ]
        ),
        .library(
            name: "BagbutikUsers",
            targets: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikUsersModels",
                "BagbutikUsers",
            ]
        ),
        .library(
            name: "BagbutikWebhooks",
            targets: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikWebhooksModels",
                "BagbutikWebhooks",
            ]
        ),
    ],
    targets: [
        .binaryTarget(name: "BagbutikCore", path: "Artifacts/BagbutikCore.xcframework"),
        .binaryTarget(name: "BagbutikModelsShared", path: "Artifacts/BagbutikModelsShared.xcframework"),
        .binaryTarget(name: "BagbutikReportingModels", path: "Artifacts/BagbutikReportingModels.xcframework"),
        .binaryTarget(name: "BagbutikReporting", path: "Artifacts/BagbutikReporting.xcframework"),
        .binaryTarget(name: "BagbutikUsersModels", path: "Artifacts/BagbutikUsersModels.xcframework"),
        .binaryTarget(name: "BagbutikUsers", path: "Artifacts/BagbutikUsers.xcframework"),
        .binaryTarget(name: "BagbutikWebhooksModels", path: "Artifacts/BagbutikWebhooksModels.xcframework"),
        .binaryTarget(name: "BagbutikWebhooks", path: "Artifacts/BagbutikWebhooks.xcframework"),
    ]
)
PACKAGE_EOF

  cat > "$INTEGRATION_DIR/BagbutikReportingBinaryClient/Package.swift" <<'PACKAGE_EOF'
// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "BagbutikReportingBinaryClient",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v9),
        .visionOS(.v1),
    ],
    dependencies: [
        .package(name: "Bagbutik", path: "../BagbutikBinaryPackage"),
    ],
    targets: [
        .executableTarget(
            name: "BagbutikReportingBinaryClient",
            dependencies: [
                .product(name: "BagbutikReporting", package: "Bagbutik"),
            ]
        ),
    ]
)
PACKAGE_EOF

  cat > "$INTEGRATION_DIR/BagbutikReportingBinaryClient/Sources/BagbutikReportingBinaryClient/main.swift" <<'SOURCE_EOF'
import BagbutikCore
import BagbutikModelsShared
import BagbutikReporting
import BagbutikReportingModels

let request = Request<Gzip, ErrorResponse>.getSalesReportsV1(filters: [
    .vendorNumber(["12345678"]),
    .reportType([.sales]),
    .reportSubType([.summary]),
    .frequency([.daily]),
])

print(request.path)
SOURCE_EOF

  cat > "$INTEGRATION_DIR/BagbutikUsersBinaryClient/Package.swift" <<'PACKAGE_EOF'
// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "BagbutikUsersBinaryClient",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v9),
        .visionOS(.v1),
    ],
    dependencies: [
        .package(name: "Bagbutik", path: "../BagbutikBinaryPackage"),
    ],
    targets: [
        .executableTarget(
            name: "BagbutikUsersBinaryClient",
            dependencies: [
                .product(name: "BagbutikUsers", package: "Bagbutik"),
            ]
        ),
    ]
)
PACKAGE_EOF

  cat > "$INTEGRATION_DIR/BagbutikUsersBinaryClient/Sources/BagbutikUsersBinaryClient/main.swift" <<'SOURCE_EOF'
import BagbutikCore
import BagbutikModelsShared
import BagbutikUsers
import BagbutikUsersModels

let request = Request<UsersResponse, ErrorResponse>.listUsersV1(
    filters: [.roles([.admin])],
    includes: [.visibleApps],
    limits: [.limit(20)]
)

print(request.path)
SOURCE_EOF

  cat > "$INTEGRATION_DIR/BagbutikWebhooksBinaryClient/Package.swift" <<'PACKAGE_EOF'
// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "BagbutikWebhooksBinaryClient",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v9),
        .visionOS(.v1),
    ],
    dependencies: [
        .package(name: "Bagbutik", path: "../BagbutikBinaryPackage"),
    ],
    targets: [
        .executableTarget(
            name: "BagbutikWebhooksBinaryClient",
            dependencies: [
                .product(name: "BagbutikWebhooks", package: "Bagbutik"),
            ]
        ),
    ]
)
PACKAGE_EOF

  cat > "$INTEGRATION_DIR/BagbutikWebhooksBinaryClient/Sources/BagbutikWebhooksBinaryClient/main.swift" <<'SOURCE_EOF'
import BagbutikCore
import BagbutikModelsShared
import BagbutikWebhooks
import BagbutikWebhooksModels

let request = Request<WebhookResponse, ErrorResponse>.getWebhookV1(
    id: "webhook-1",
    includes: [.app]
)

print(request.path)
SOURCE_EOF

  local module
  for module in "${MODULES[@]}"; do
    cp -R "$DIST_DIR/$module.xcframework" "$INTEGRATION_DIR/BagbutikBinaryPackage/Artifacts/"
  done
}

verify_binary_integration() {
  local client
  local sdk
  local triple
  local sdk_root

  if [ "${BAGBUTIK_SKIP_VERIFY:-false}" = "true" ]; then
    return
  fi

  prepare_binary_integration_fixture

  for sdk in "${SDKS[@]}"; do
    sdk_root="$(sdk_path "$sdk")"
    while IFS= read -r triple; do
      for client in "${BUILD_TARGETS[@]}"; do
        if [ "$sdk" = "xros" ] || [ "$sdk" = "xrsimulator" ]; then
          verify_visionos_binary_integration "$sdk" "$triple" "$sdk_root" "$client"
          continue
        fi

        echo "Verifying $client binary package consumer for $triple"
        swift build \
          --package-path "$INTEGRATION_DIR/${client}BinaryClient" \
          --scratch-path "$INTEGRATION_DIR/build/$client/$triple" \
          --triple "$triple" \
          --sdk "$sdk_root" \
          --configuration "$CONFIGURATION"
      done
    done < <(sdk_triples "$sdk")
  done
}

client_link_modules() {
  case "$1" in
    BagbutikReporting)
      echo "BagbutikReporting"
      echo "BagbutikReportingModels"
      ;;
    BagbutikUsers)
      echo "BagbutikUsers"
      echo "BagbutikUsersModels"
      ;;
    BagbutikWebhooks)
      echo "BagbutikWebhooks"
      echo "BagbutikWebhooksModels"
      ;;
    *)
      echo "Unknown binary integration client: $1" >&2
      exit 20
      ;;
  esac

  echo "BagbutikModelsShared"
  echo "BagbutikCore"
}

verify_visionos_binary_integration() {
  local sdk=$1
  local triple=$2
  local sdk_root=$3
  local client=$4
  local library_identifier
  local module
  local import_arguments=()
  local libraries=()
  local output_directory="$INTEGRATION_DIR/build/$client/$triple"

  if [ "$sdk" = "xros" ]; then
    library_identifier="xros-arm64"
  else
    library_identifier="xros-arm64-simulator"
  fi

  while IFS= read -r module; do
    import_arguments+=(
      -I "$DIST_DIR/$module.xcframework/$library_identifier/Headers"
    )
    libraries+=(
      "$DIST_DIR/$module.xcframework/$library_identifier/lib$module.a"
    )
  done < <(client_link_modules "$client")

  echo "Verifying $client binary package modules directly for $triple"
  mkdir -p "$output_directory/ModuleCache"
  swiftc \
    -O \
    -target "$triple" \
    -sdk "$sdk_root" \
    -module-cache-path "$output_directory/ModuleCache" \
    "${import_arguments[@]}" \
    "$INTEGRATION_DIR/${client}BinaryClient/Sources/${client}BinaryClient/main.swift" \
    "${libraries[@]}" \
    -lz \
    -Xlinker -dead_strip \
    -o "$output_directory/${client}BinaryClient"
}

report_watch_sample_size() {
  local arm64_32_binary
  local arm64_binary
  local client
  local size
  local universal_binary

  for client in "${BUILD_TARGETS[@]}"; do
    arm64_32_binary="$INTEGRATION_DIR/build/$client/arm64_32-apple-watchos9.0/arm64_32-apple-watchos/$CONFIGURATION/${client}BinaryClient"
    arm64_binary="$INTEGRATION_DIR/build/$client/arm64-apple-watchos9.0/arm64-apple-watchos/$CONFIGURATION/${client}BinaryClient"
    universal_binary="$DIST_DIR/${client}WatchSample"

    if [ ! -f "$arm64_32_binary" ] || [ ! -f "$arm64_binary" ]; then
      continue
    fi

    xcrun lipo -create "$arm64_32_binary" "$arm64_binary" -output "$universal_binary"
    xcrun strip -x "$universal_binary"

    size="$(stat -f '%z' "$universal_binary")"
    echo "Stripped two architecture $client watch sample executable: $size bytes"

    if [ "$size" -gt 50000000 ]; then
      echo "$client watch sample executable exceeds the 50 MB release gate." >&2
      exit 17
    elif [ "$size" -gt 45000000 ]; then
      echo "$client watch sample executable exceeds the 45 MB warning threshold." >&2
    fi
  done
}

echo "Building static Bagbutik XCFrameworks"
echo "Modules: ${MODULES[*]}"
echo "SDKs: ${SDKS[*]}"

require_tools_and_sdks
prepare_directories

for sdk in "${SDKS[@]}"; do
  while IFS= read -r triple; do
    build_triple "$sdk" "$triple"
    for module in "${MODULES[@]}"; do
      archive_thin_module "$sdk" "$triple" "$module"
    done
  done < <(sdk_triples "$sdk")

  for module in "${MODULES[@]}"; do
    combine_sdk_module "$sdk" "$module"
  done
done

for module in "${MODULES[@]}"; do
  create_module_xcframework "$module"
  zip_module_xcframework "$module"
done

verify_binary_integration
report_watch_sample_size

echo "Finished building static XCFramework archives in $DIST_DIR"
