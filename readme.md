## Preqrequisites
```bash
# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Github CLI
brew install gh
gh auth login
```

## Install

1. Run `bin/setup.sh` to install all dependencies needed.
2. Run `bin/link-configs.sh` to symlink configs from this directory to your home diretory

## Additional setup 

### Setup Sketchy bar icons
```
git clone https://github.com/kvndrsslr/sketchybar-app-font <some-directory>
cd <some-directory>
pnpm install
pnpm run build:install
```
