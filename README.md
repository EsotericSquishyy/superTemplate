# superTemplate

A suite of environments/macros for ease of taking notes or doing problem sets in Mathematics, Computer Science, and Physics.

Refer to the [Packages](https://github.com/typst/packages) repository for installation.

## Versioning Symlink Example

# Linux
```sh
mkdir -p ~/.local/share/typst/packages/local/superTemplate
VERSION=$(grep -oP '(?<=^version = ").*?(?=")' typst.toml)
ln -s ~/code/superTemplate ~/.local/share/typst/packages/local/superTemplate/"$VERSION"
```

# MacOS

```sh
mkdir -p /Users/Nate/Library/Application Support/typst/packages/local/superTemplate
VERSION=$(grep -oP '(?<=^version = ").*?(?=")' typst.toml)
ln -s ~/Documents/Github/superTemplate ""/Users/Nate/Library/Application Support/typst/packages/local/superTemplate/"$VERSION""
```
