#!/bin/zsh
if [[ ! -f "typst.toml" ]]; then
  echo "Error: This script must be run from the root directory of the project."
  exit 1
fi

mkdir -p ~/.local/share/typst/packages/local/superTemplate
VERSION=$(grep -oP '(?<=^version = ").*?(?=")' typst.toml)
ln -sf . ~/.local/share/typst/packages/local/superTemplate/"$VERSION"
