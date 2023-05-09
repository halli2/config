### Misc functions used by aliases

_cheat() {
    if [ -z "${1}" ]; then
        curl -fLm 7 "https://cheat.sh" | bat
    else
        curl -fLm 7 "https://cheat.sh/${@}" | bat
    fi
}

## Cd up dirs
## Usage: cd.. 10 or cd.. dir_name
cd_up() {
    case $1 in
        *[!(0-9)]*) # If not a number, find folder matching string
            cd $( pwd | sed -r "s|(.*/$1[^/]*/).*|\1|" ) # cd
            ;; # if folder not found, don't cd
        *)
            cd $(printf "%0.0s../" $(seq 1 $1)); # If a number, cd x folders  upwards
            ;;
    esac
}

_update_zsh() {
    rm "$ZDOTDIR/completions/_rustup"
    rm "$ZDOTDIR/completions/_cargo"
    rm "$ZDOTDIR/completions/_starship"
    rm "$ZDOTDIR/completions/_atuin"
    mkdir -p "$ZDOTDIR/completions"
    rustup completions zsh > "$ZDOTDIR/completions/_rustup"
    rustup completions zsh cargo > "$ZDOTDIR/completions/_cargo"
    starship completions zsh > "$ZDOTDIR/completions/_starship"
    atuin gen-completions --shell zsh > "$ZDOTDIR/completions/_atuin"
    source "$ZDOTDIR/.zshrc"
}

_update() {
    if command_exists dnf; then
        echo "Update fedora packages"
        sudo dnf update -y
    fi

    if command_exists flatpak; then
        echo "Update flatpaks"
        flatpak update -y
    fi

    if command_exists rustup; then
        echo "Update Rustup"
        rustup update
    fi

    _update_zsh
}

