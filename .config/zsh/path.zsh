export_paths=(
    $HOME/.cargo/bin \
    $HOME/go/bin \
    $HOME/.local/bin
)

export PATH="${(j|:|)extra_paths}:$PATH"
