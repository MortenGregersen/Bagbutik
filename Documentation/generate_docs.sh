#!/usr/bin/env bash

# Generate a static DocC site for the handwritten runtime API. The generated API
# modules and the nested Tools package are intentionally not included.
set -euo pipefail

rm -rf docs
swift package --allow-writing-to-directory docs generate-documentation \
    --target BagbutikCore \
    --output-path docs \
    --transform-for-static-hosting \
    --hosting-base-path / \
    --symbol-graph-minimum-access-level private \
    --source-service github \
    --source-service-base-url https://github.com/MortenGregersen/Bagbutik/blob/main \
    --checkout-path "$(pwd)"

cp Documentation/index.html docs/index.html
mkdir -p docs/assets
cp Assets/Bagbutik-logo.png docs/assets/Bagbutik-logo.png
