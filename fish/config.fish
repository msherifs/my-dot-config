if status is-interactive
    # Commands to run in interactive sessions can go here
end

# oh-my-posh --init --shell fish --config ~/the-unamed.omp.json | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/msherif/Sources/google-cloud-sdk/path.fish.inc' ]; . '/Users/msherif/Sources/google-cloud-sdk/path.fish.inc'; end

pyenv init - | source
