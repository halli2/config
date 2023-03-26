setopt \
    auto_cd \
    auto_pushd \
    chase_links \
    complete_aliases \
    extended_glob \
    extended_history \
    hist_ignore_all_dups \
    hist_ignore_dups \
    hist_ignore_space \
    hist_reduce_blanks \
    hist_save_no_dups \
    hist_verify \
    ignore_eof \
    inc_append_history \
    list_types \
    mark_dirs \
    noclobber \
    noflowcontrol \
    path_dirs \
    prompt_percent \
    prompt_subst \
    share_history
export_paths=(
    $HOME/.cargo/bin \
    $HOME/go/bin \
    $HOME/.local/bin
)

export PATH="${(j|:|)extra_paths}:$PATH"

HISTFILE=$HOME/.zsh_history
HISTFILESIZE=65536
HISTSIZE=4096
SAVEHIST=4096

# Output time stats if program runs longer than a minute
REPORTTIME=60

