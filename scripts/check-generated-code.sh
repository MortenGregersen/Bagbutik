#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")/.."

download_output="$(swift run --package-path Tools bagbutik-cli download-newest-spec)"
echo "$download_output"
if [[ $download_output =~ Spec\ file\ downloaded\ to\ (.+) ]]; then
    spec_file_path="${BASH_REMATCH[1]}"
else
    echo "Could not find the downloaded spec path."
    exit 1
fi

current_version="$(cat spec-version)"
downloaded_version="$(jq -er '.info.version | select(type == "string" and length > 0)' "$spec_file_path")"
if [[ "$current_version" != "$downloaded_version" ]]; then
    echo "Spec version mismatch: repository has $current_version, but Apple provides $downloaded_version."
    echo "Merge the spec update PR for $downloaded_version, then rerun this check."
    exit 1
fi

swift run --package-path Tools bagbutik-cli generate \
    --spec-path "$spec_file_path" \
    --documentation-path Documentation \
    --output-path Sources

# Include untracked files as well as modified and deleted tracked files.
changes="$(git status --porcelain --untracked-files=all -- Sources)"
if [[ -n "$changes" ]]; then
    echo "Generated code differs from the committed sources."
    echo "Change the generator or its inputs, run generate, and commit the resulting sources."
    echo "$changes"
    git diff -- Sources
    exit 1
fi
