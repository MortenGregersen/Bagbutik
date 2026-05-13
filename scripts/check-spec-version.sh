#!/bin/bash

# exit when any command fails
set -euo pipefail
MAX_CI_DISPATCH_ATTEMPTS=3
CI_DISPATCH_RETRY_DELAY_SECONDS=5
EXIT_CODE_NO_SPEC_FILE_PATH_FOUND=42
EXIT_CODE_CI_DISPATCH_FAILED=43

download_newest_spec_output=$(swift run bagbutik-cli download-newest-spec)
echo "$download_newest_spec_output"

if [[ $download_newest_spec_output =~ Spec\ file\ downloaded\ to\ (.+) ]]; then
    spec_file_path=${BASH_REMATCH[1]}
else
    echo "No path to a spec file found in output from Bagbutik CLI"
    exit "$EXIT_CODE_NO_SPEC_FILE_PATH_FOUND"
fi

current_version="$(cat spec-version)"
downloaded_version="$(jq -r '.info.version' "$spec_file_path")"
echo "Current version: $current_version"
echo "Downloaded version: $downloaded_version"

if [ "$current_version" == "$downloaded_version" ]; then
    echo "No new spec found."
    exit 0
else
    echo "New spec is found. Will generate new endpoints and models (if no pull request is found)."
fi

pr_list_output=$(gh pr list --search "$downloaded_version type:pr is:open")
if [[ $pr_list_output =~ Update\ from\ new\ spec ]]; then
    echo "A pull request for this version has already been created."
    exit 0
else
    echo "No pull requests has been created for this version."
fi

docs_output_file="$(mktemp)"
trap 'rm -f "$docs_output_file"' EXIT

swift run bagbutik-cli download-newest-docs --spec-path "$spec_file_path" 2>&1 | tee "$docs_output_file"
warnings="$(grep -a "⚠️" "$docs_output_file" || true)"

swift run bagbutik-cli generate --spec-path "$spec_file_path"

rm "$spec_file_path"
echo "$downloaded_version" > spec-version

git config --local user.email "ci@bagbutik.dev"
git config --local user.name "Bagbutik CI"
git checkout -b spec-$downloaded_version
git add .
git commit -m "Update from new spec ($downloaded_version)"
git push -u origin spec-$downloaded_version
create_pr_output=$(gh pr create --fill --body "$warnings")
echo "Pull request created: $create_pr_output"
for attempt in $(seq 1 "$MAX_CI_DISPATCH_ATTEMPTS"); do
    if gh workflow run ci.yml --ref "spec-$downloaded_version"; then
        break
    fi

    if [ "$attempt" -lt "$MAX_CI_DISPATCH_ATTEMPTS" ]; then
        echo "Attempt $attempt failed to dispatch CI workflow for branch spec-$downloaded_version. Retrying in $CI_DISPATCH_RETRY_DELAY_SECONDS seconds..."
        sleep "$CI_DISPATCH_RETRY_DELAY_SECONDS"
    else
        echo "Failed to dispatch CI workflow for branch spec-$downloaded_version"
        exit "$EXIT_CODE_CI_DISPATCH_FAILED"
    fi
done
echo "CI workflow dispatch triggered for branch spec-$downloaded_version"
