# https://github.com/pure-fish/pure
# # Leader symbol for fish prompt
# set pure_symbol_prompt "\$"
# set pure_color_virtualenv "magenta"
# set pure_show_jobs true
# set pure_color_jobs "blue"

# Rewrite prompt for pyenv (overriding pure-fish/pure)
# functions -c _pure_prompt_virtualenv _old_pure_prompt_virtualenv
# function _pure_prompt_virtualenv
#     if set -q PYENV_VERSION
#         # https://github.com/pure-fish/pure/blob/master/functions/_pure_prompt_virtualenv.fish
#         echo -n -s (set_color magenta) "" (basename "$PYENV_VERSION") "" (set_color normal) ""
#     end
#     if set -q VIRTUAL_ENV
#         echo -n -s (set_color magenta) "" (basename "$VIRTUAL_ENV") "" (set_color normal) ""
#     end
# end


# starship
starship init fish | source


# Basic
set -x SHELL fish
set -x TERM screen-256color
set -x EDITOR vim
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8


# Go
set -x GOPATH $HOME/go
set -x GO111MODULE on


# $PATH environment variable
set -e fish_user_paths
set -x PYENV_ROOT $HOME/.pyenv
set -gx fish_user_paths \
    # $HOME/.pyenv/shims \
    $GOPATH/bin \
    $PYENV_ROOT/bin \
    /usr/local/sbin \
    /usr/local/bin \
    /usr/sbin \
    /usr/bin \
    /sbin \
    /bin \
    $fish_user_paths


# Config files directory.
set -x XDG_CONFIG_HOME $HOME/.config


# oo (Go version manager)
source $HOME/.oo/env.fish


# homebrew
# disable auto updates.
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x HOMEBREW_CORE_GIT_REMOTE https://mirrors.ustc.edu.cn/homebrew-core.git


# pyenv
function lpy
    status is-login; and pyenv init --path | source
    status is-interactive; and pyenv init - | source
end


# https://github.com/junegunn/fzf
set -x FZF_DEFAULT_COMMAND 'fd --type f --exclude .git'


# fish dotenv function
# Execute `dotenv` will load environment variables from file `.env`.
function dotenv --description 'Load environment variables from .env file'
    set -l envfile ".env"

    if [ (count $argv) -gt 0 ]
        set envfile $argv[1]
    end

    if test -e $envfile
        # If envfile exists, set env variables one by one.
        for line in (cat $envfile | grep -e '[^[:space:]]' | grep -v '^#')
            set -xg (echo $line | cut -d = -f 1) (echo $line | cut -d = -f 2-)
        end

        # Rewrite _pure_prompt function
        if not functions -q _old_pure_prompt
            functions -c _pure_prompt _old_pure_prompt
        end

        # Insert dotenv prefix to prompt
        function _pure_prompt  --inherit-variable envfile --argument-names exit_code
            echo -n -s (set_color green) "(" $envfile ")" (set_color normal) " "
            _old_pure_prompt $exit_code
        end
    end
end


# Rewrite function fish_user_key_bindings
if functions -q fish_user_key_bindings
    functions -c fish_user_key_bindings _old_fish_user_key_bindings
end
function fish_user_key_bindings
    if functions -q _old_fish_user_key_bindings
        _old_fish_user_key_bindings
    end
    # Ctrl-X to edit command buffer with $EDITOR
    bind \cx edit_command_buffer
end


# alias
alias sed gsed
alias ssh-monitor="ssh root@192.168.66.47"
alias pocr="pngpaste - | tesseract stdin stdout"