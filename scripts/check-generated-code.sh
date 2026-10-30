#!/bin/bash
set -euo pipefail

cd "$(dirname "$0")/.."

swift run --package-path Tools bagbutik-cli generate \
    --spec-path Specs/app-store-connect.json \
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
