#!/usr/bin/env zsh

_zsh_nvim_quit() {
    if ! (( $+commands[nvim] )) && ! (( $+commands[python3] )); then
        return 0
    fi
    if [[ -n "$NVIM_LISTEN_ADDRESS" ]]; then
        python3 <<< "import neovim; neovim.attach('socket', path='$NVIM_LISTEN_ADDRESS').input('<C-\\><C-n>')"
    fi
}

zle -N _zsh_nvim_quit
