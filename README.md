# codexpathchecker

`codexpathchecker` adds a confirmation guard in Zsh before any `codex` command runs.

## Problem

I keep running `codex` in the wrong path.

## Solution

Install `codexpathchecker`, then let it hook into your `~/.zshrc`.

## What It Does

- Intercepts every `codex` invocation, including `codex`, `codex --yolo`, and any other arguments.
- Detects the current working directory before execution.
- Shows a highly visible warning with the full path.
- Prompts for `yes` or `no`.
- Runs the original `codex` command only after confirmation.

## Install With Homebrew

```zsh
brew tap adamzafir/codexpathchecker https://github.com/adamzafir/codexpathchecker
brew install adamzafir/codexpathchecker/codexpathchecker
codexpathchecker install
source ~/.zshrc
```

## If Homebrew Does Not Work

```zsh
git clone https://github.com/adamzafir/codexpathchecker.git
cd codexpathchecker
./bin/codexpathchecker install
source ~/.zshrc
```

## Commands

```zsh
codexpathchecker install
codexpathchecker status
codexpathchecker uninstall
```

## Notes

The installer appends a marked block to `~/.zshrc` and always writes a blank line before it so it does not break the previous line in your shell config.
