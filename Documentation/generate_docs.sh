#!/bin/bash

# exit when any command fails
set -e

rm -rf .build
rm -rf docs
jazzy
sed -i'' -e 's/Bagbutik_Core/Bagbutik/' docs/index.html
open docs/index.html
