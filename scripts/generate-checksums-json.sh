#!/bin/bash

set -euo pipefail

: "${RELEASE_TAG:?RELEASE_TAG must be set}"

LIBRARY="Bagbutik"

if [ "$#" -ge 2 ]; then
  RELEASE_BODY_PATH="$2"
else
  RELEASE_BODY_PATH="${1:-output/release-body.md}"
fi
REPOSITORY="${GITHUB_REPOSITORY:-MortenGregersen/Bagbutik}"

XCODE_VERSION="$(xcodebuild -version | tr '\n' ' ' | sed 's/[[:space:]]\+/ /g' | sed 's/[[:space:]]$//')"
SWIFT_VERSION="$(swift --version | head -n 1)"

mkdir -p "$(dirname "$RELEASE_BODY_PATH")"

ZIP_PATH="output/${LIBRARY}.xcframework.zip"
CHECKSUM="$(swift package compute-checksum "$ZIP_PATH")"

{
  printf '### XCFramework\n\n'
  printf -- '- Built with: %s (%s)\n\n' "$XCODE_VERSION" "$SWIFT_VERSION"
  printf '```swift\n'
  printf '.binaryTarget(\n'
  printf '    name: "%s",\n' "$LIBRARY"
  printf '    url: "https://github.com/%s/releases/download/%s/%s.xcframework.zip",\n' "$REPOSITORY" "$RELEASE_TAG" "$LIBRARY"
  printf '    checksum: "%s"\n' "$CHECKSUM"
  printf '),\n\n'
  printf '```\n'
} > "$RELEASE_BODY_PATH"

echo "Generated $RELEASE_BODY_PATH"
