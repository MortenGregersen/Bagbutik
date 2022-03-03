#!/bin/bash

download_newest_spec_output=$(swift run bagbutik download-newest-spec)
echo "$download_newest_spec_output"
if [ $? != 0 ]; then
    exit $?
fi

if [[ $download_newest_spec_output =~ Spec\ file\ downloaded\ to\ (.+) ]]; then
    spec_file_path=${BASH_REMATCH[1]}
else
    echo "No path to a spec file found in output from bagbutik CLI"
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
    echo "New spec is found. Will generate new endpoints and models."
    swift run bagbutik generate --spec-path $spec_file_path
fi

rm $spec_file_path


