rm -rf docs
mkdir docs
sourcekitten doc --spm --module-name Bagbutik > docs/mod1.json
jazzy --sourcekitten-sourcefile docs/mod1.json
open docs/index.html
