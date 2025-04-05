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
set -x PNPM_HOME "/Users/msherifs/Library/pnpm"
fish_add_path $PNPM_HOME
# pnpm end

# bun
set -x BUN_INSTALL "$HOME/.bun"
fish_add_path "$BUN_INSTALL/bin"

if test -z ~/.config/fish/functions/alfan.fish
    source ~/.config/fish/functions/alfan.fish
end

if test -z ~/.config/fish/secrets.fish
    source ~/.config/fish/secrets.fish
end

set --global hydro_multiline true
