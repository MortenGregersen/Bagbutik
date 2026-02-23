#!/bin/bash

set -euo pipefail

: "${RELEASE_TAG:?RELEASE_TAG must be set}"

XCODE_VERSION="$(xcodebuild -version | tr '\n' ' ' | sed 's/[[:space:]]\+/ /g' | sed 's/[[:space:]]$//')"
SWIFT_VERSION="$(swift --version | head -n 1)"

mkdir -p "$(dirname "output/release-body.md")"

ZIP_PATH="output/Bagbutik.xcframework.zip"
CHECKSUM="$(swift package compute-checksum "$ZIP_PATH")"

{
  printf '### XCFramework\n\n'
  printf -- '- Built with: %s (%s)\n\n' "$XCODE_VERSION" "$SWIFT_VERSION"
  printf '```swift\n'
  printf '.binaryTarget(\n'
  printf '    name: "Bagbutik",\n'
  printf '    url: "https://github.com/MortenGregersen/Bagbutik/releases/download/%s/Bagbutik.xcframework.zip",\n' "$RELEASE_TAG"
  printf '    checksum: "%s"\n' "$CHECKSUM"
  printf '),\n\n'
  printf '```\n'
} > "output/release-body.md"

echo "Generated output/release-body.md"
