#!/bin/bash

set -euo pipefail

: "${RELEASE_TAG:?RELEASE_TAG must be set}"

LIBRARY="Bagbutik"

OUTPUT_PATH="${1:-output/checksums.json}"
RELEASE_BODY_PATH="${2:-output/release-body.md}"
REPOSITORY="${GITHUB_REPOSITORY:-MortenGregersen/Bagbutik}"

json_escape() {
  local value="$1"
  value="${value//\\/\\\\}"
  value="${value//\"/\\\"}"
  value="${value//$'\n'/\\n}"
  value="${value//$'\r'/\\r}"
  value="${value//$'\t'/\\t}"
  printf '%s' "$value"
}

XCODE_VERSION="$(xcodebuild -version | tr '\n' ' ' | sed 's/[[:space:]]\+/ /g' | sed 's/[[:space:]]$//')"
SWIFT_VERSION="$(swift --version | head -n 1)"
GENERATED_AT="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"

mkdir -p "$(dirname "$OUTPUT_PATH")"
mkdir -p "$(dirname "$RELEASE_BODY_PATH")"

ZIP_PATH="output/${LIBRARY}.xcframework.zip"
CHECKSUM="$(swift package compute-checksum "$ZIP_PATH")"

{
  printf '{\n'
  printf '  "tag": "%s",\n' "$(json_escape "$RELEASE_TAG")"
  printf '  "generatedAt": "%s",\n' "$(json_escape "$GENERATED_AT")"
  printf '  "xcodeVersion": "%s",\n' "$(json_escape "$XCODE_VERSION")"
  printf '  "swiftVersion": "%s",\n' "$(json_escape "$SWIFT_VERSION")"
  printf '  "checksums": {\n'
  printf '    "%s": "%s"\n' "$(json_escape "$LIBRARY")" "$(json_escape "$CHECKSUM")"
  printf '  }\n'
  printf '}\n'
} > "$OUTPUT_PATH"

{
  printf '### XCFramework\n\n'
  printf -- '- Built with: %s (%s)\n\n' "$XCODE_VERSION" "$SWIFT_VERSION"
  printf -- '- Binary import style: `import Bagbutik`\n\n'
  printf '```swift\n'
  printf '.binaryTarget(\n'
  printf '    name: "%s",\n' "$LIBRARY"
  printf '    url: "https://github.com/%s/releases/download/%s/%s.xcframework.zip",\n' "$REPOSITORY" "$RELEASE_TAG" "$LIBRARY"
  printf '    checksum: "%s"\n' "$CHECKSUM"
  printf '),\n\n'
  printf '```\n'
} > "$RELEASE_BODY_PATH"

echo "Generated $OUTPUT_PATH and $RELEASE_BODY_PATH"
