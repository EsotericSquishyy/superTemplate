# superTemplate

A suite of environments/macros for ease of taking notes or doing problem sets in Mathematics, Computer Science, and Physics.

Refer to the [Packages](https://github.com/typst/packages) repository for installation.

## Versioning Symlink Example

### Linux
```sh
mkdir -p ~/.local/share/typst/packages/local/superTemplate
VERSION=$(grep -oP '(?<=^version = ").*?(?=")' typst.toml)
ln -sf ~/code/superTemplate ~/.local/share/typst/packages/local/superTemplate/"$VERSION"
```

### MacOS

```sh
USER=$(whoami)
mkdir -p "/Users/$USER/Library/Application Support/typst/packages/local/superTemplate"
VERSION=$(grep '^version = ' typst.toml | sed -E 's/^version = "([^"]+)"/\1/')
ln -sf ~/Documents/Github/superTemplate "/Users/$USER/Library/Application Support/typst/packages/local/superTemplate/$VERSION"
```
