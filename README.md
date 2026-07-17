# Dotfiles (Chezmoi + Homebrew + iTerm2)

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/), focused on macOS developer setup.

## What this repo configures

- Homebrew bootstrap on macOS (`run_once_before_00-install-homebrew.sh.tmpl`)
- Package installation from Brewfile (`run_once_after_10-install-homebrew-packages.sh.tmpl`)
- iTerm2 default profile setup (`run_once_after_20-configure-iterm2-profile.sh.tmpl`)
- Shell config (`dot_zshrc`)
- Git config and aliases (`dot_gitconfig`)
- Starship prompt config (`dot_config/starship.toml`)
- iTerm2 dynamic profile (`Library/Application Support/iTerm2/DynamicProfiles/chezmoi-default.json`)

## Platform support

The automation scripts are guarded with `{{ if eq .chezmoi.os "darwin" -}}`, so they only run on macOS.

## Quick start

1. Install chezmoi (if needed):

```bash
brew install chezmoi
```

2. Initialize and apply this repo:

```bash
chezmoi init --apply <YOUR_GITHUB_USERNAME>
```

If you are developing locally from a checked-out copy:

```bash
cd /path/to/this/repo
chezmoi init --apply --source="$PWD"
```

## How first apply works

On first `chezmoi apply` on macOS, scripts run in order:

1. `run_once_before_00-install-homebrew.sh.tmpl`
- Detects `brew` from Apple Silicon (`/opt/homebrew`) or Intel (`/usr/local`).
- Installs Homebrew if missing.

2. `run_once_after_10-install-homebrew-packages.sh.tmpl`
- Uses `$HOME/.Brewfile` (rendered from `dot_Brewfile`) with `brew bundle install`.
- Tries `brew trust` for taps when available.
- If cask installation blocks (permissions/system prompts), retries non-cask packages so apply can complete.

3. `run_once_after_20-configure-iterm2-profile.sh.tmpl`
- Sets iTerm2 default profile GUID to `Chezmoi Default`.
- Skips safely if iTerm2 is not installed.

## Brewfile contents (high level)

- CLI tooling: `git`, `gh`, `ripgrep`, `fd`, `jq`, `yq`, `tmux`, `neovim`, `fzf`, `zoxide`, etc.
- Dev/runtime tools: `node`, `go`, `pyenv`, `pipx`, `asdf`, `terraform`, `docker`, `colima`, Kubernetes tools.
- Apps/casks: `iterm2`, `visual-studio-code`, `docker-desktop`, fonts, and others.
- VS Code extensions and npm global packages declared through Brew Bundle.

## Personalization checklist

Before using on another machine/account, review:

- `dot_gitconfig`
- `[user]` name/email values
- Any company-specific or certificate-related environment variables in `dot_zshrc`
- `dot_Brewfile` packages/casks you do or do not want

## Useful commands

Apply latest changes:

```bash
chezmoi apply
```

Preview changes before applying:

```bash
chezmoi diff
```

Edit a managed file:

```bash
chezmoi edit ~/.zshrc
```

Update external changes into source state:

```bash
chezmoi re-add
```

## Notes

- `run_once_*` scripts are intended to execute once per machine unless their state is reset.
- Some casks may require manual install/permissions depending on macOS security prompts.
- Restart iTerm2 after apply to pick up default profile changes.
