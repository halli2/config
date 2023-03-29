export_paths=(
    $HOME/go/bin \
    $HOME/.local/bin
)

export PATH="${(j|:|)extra_paths}:$PATH"
