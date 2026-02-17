#!/bin/bash

set -euo pipefail

: "${RELEASE_TAG:?RELEASE_TAG must be set}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/libraries.sh"

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

CHECKSUMS=()
for lib in "${LIBRARIES[@]}"; do
  zip_path="output/${lib}.xcframework.zip"
  CHECKSUMS+=("$(swift package compute-checksum "$zip_path")")
done

{
  printf '{\n'
  printf '  "tag": "%s",\n' "$(json_escape "$RELEASE_TAG")"
  printf '  "generatedAt": "%s",\n' "$(json_escape "$GENERATED_AT")"
  printf '  "xcodeVersion": "%s",\n' "$(json_escape "$XCODE_VERSION")"
  printf '  "swiftVersion": "%s",\n' "$(json_escape "$SWIFT_VERSION")"
  printf '  "checksums": {\n'

  first=1
  for i in "${!LIBRARIES[@]}"; do
    lib="${LIBRARIES[$i]}"
    checksum="${CHECKSUMS[$i]}"
    if [ $first -eq 0 ]; then
      printf ',\n'
    fi

    printf '    "%s": "%s"' "$(json_escape "$lib")" "$(json_escape "$checksum")"
    first=0
  done

  printf '\n  }\n'
  printf '}\n'
} > "$OUTPUT_PATH"

{
  printf '### XCFramework\n\n'
  printf -- '- Built with: %s (%s)\n\n' "$XCODE_VERSION" "$SWIFT_VERSION"
  printf '```swift\n'
  for i in "${!LIBRARIES[@]}"; do
    lib="${LIBRARIES[$i]}"
    checksum="${CHECKSUMS[$i]}"
    printf '.binaryTarget(\n'
    printf '    name: "%s",\n' "$lib"
    printf '    url: "https://github.com/%s/releases/download/%s/%s.xcframework.zip",\n' "$REPOSITORY" "$RELEASE_TAG" "$lib"
    printf '    checksum: "%s"\n' "$checksum"
    printf '),\n\n'
  done
  printf '```\n'
} > "$RELEASE_BODY_PATH"

echo "Generated $OUTPUT_PATH and $RELEASE_BODY_PATH"
