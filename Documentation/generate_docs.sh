#!/bin/bash

# exit when any command fails
set -e

rm -rf .build
rm -rf docs
bundle install
bundle exec jazzy
sed -i'' -e 's/Bagbutik_Core Reference/Bagbutik Reference/' docs/index.html
sed -i'' -e 's/Bagbutik_Core  Reference/Bagbutik  Reference/' docs/index.html
open docs/index.html
