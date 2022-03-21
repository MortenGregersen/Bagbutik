#!/bin/bash

# exit when any command fails
set -e

jazzy --clean --module Bagbutik --exclude=Sources/Bagbutik/Endpoints/*,Sources/Bagbutik/Models/* --source-host-url=https://github.com/MortenGregersen/Bagbutik
open docs/index.html
