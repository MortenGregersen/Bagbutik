#!/bin/bash

# exit when any command fails
set -e

download_newest_spec_output=$(swift run bagbutik-cli download-newest-spec)
echo "$download_newest_spec_output"

if [[ $download_newest_spec_output =~ Spec\ file\ downloaded\ to\ (.+) ]]; then
    spec_file_path=${BASH_REMATCH[1]}
else
    echo "No path to a spec file found in output from Bagbutik CLI"
    exit 42
fi

current_version="$(cat spec-version)"
downloaded_version="$(jq -r '.info.version' $spec_file_path)"
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

docs_ouput=$(swift run bagbutik-cli download-newest-docs --spec-path $spec_file_path)
warnings=$(grep -zo "⚠️.*" <<< "$docs_ouput")
swift run bagbutik-cli generate --spec-path $spec_file_path

rm $spec_file_path
echo $downloaded_version > spec-version

git config --local user.email "ci@bagbutik.dev"
git config --local user.name "Bagbutik CI"
git checkout -b spec-$downloaded_version
git add .
git commit -m "Update from new spec ($downloaded_version)"
git push -u origin spec-$downloaded_version
create_pr_output=$(gh pr create --fill --body "$warnings")
echo "Pull request created: $create_pr_output"
