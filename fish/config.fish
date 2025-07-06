if status is-interactive
    # Commands to run in interactive sessions can go here
end
# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

asdf completion fish > ~/.config/fish/completions/asdf.fish

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set -x BUN_INSTALL "$HOME/.bun"
fish_add_path "$BUN_INSTALL/bin"

if test -z ~/.config/fish/functions/alfan.fish
    source ~/.config/fish/functions/alfan.fish
end

if test -f ~/.config/fish/secrets.fish
    source ~/.config/fish/secrets.fish
end

set --global hydro_multiline true

fnm env --use-on-cd --shell fish | source

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
alias claude="$HOME/.claude/local/claude"

# opencode
fish_add_path /Users/msherifs/.opencode/bin
starship init fish | source

