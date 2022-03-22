#!/bin/bash

# exit when any command fails
set -e

rm -rf .build
jazzy
open docs/index.html
