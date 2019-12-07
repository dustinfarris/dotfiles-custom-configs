alias run='./manage.py runserver 0.0.0.0:8000'
alias mkenv='mkvirtualenv --python=/usr/local/bin/python3 `basename $PWD` && setvirtualenvproject'
alias pycclean='find . -name "*.pyc" -exec rm {} \;'
alias dsh='./manage.py shell'
alias sm='./manage.py schemamigration'
alias mm='./manage.py makemigrations'
alias ipy='ipython3'
alias activate='source env/bin/activate'
alias gs='git status'
alias nv='nvim'

set --export DJANGO_ENV local

set --export PATH "/usr/local/opt/openssl/bin:./node_modules/.bin:$PATH"

# . $HOME/.asdf/asdf.sh

set --export GPG_TTY (tty)

# set --export TERM "tmux-256color"

set --export VISUAL nvim
set --export EDITOR "$VISUAL"
set --export GIT_EDITOR "$VISUAL"

# For pypi: https://stackoverflow.com/questions/32772895/python-pip-install-error-ssl-certificate-verify-failed#37688849
set --export SSL_CERT_FILE /usr/local/etc/openssl/cert.pem

# for python openssl
set --export LDFLAGS "-L/usr/local/opt/openssl@1.1/lib"
set --export CPPFLAGS "-I/usr/local/opt/openssl@1.1/include"
set --export PKG_CONFIG_PATH "/usr/local/opt/openssl@1.1/lib/pkgconfig"

# for aws-shib
set --export PATH "$HOME/go/bin:$PATH"

# for pyenv
set --export PYENV_ROOT "$HOME/.pyenv"
set --export PATH "$PYENV_ROOT/bin:$PATH"
pyenv init - | source

# remember iex history
set --export ERL_AFLAGS "-kernel shell_history enabled"

# empty greeting
set fish_greeting

# set __fish_git_prompt_show_informative_status

# set __fish_git_prompt_showupstream "auto verbose"
# set __fish_git_prompt_showstashstate
# set __fish_git_prompt_showuntrackedfiles
# set __fish_git_prompt_showcolorhints
# set __fish_git_prompt_color_branch normal --bold
# # set __fish_git_prompt_color_invalidstate normal --bold
# set __fish_git_prompt_color_dirtystate white
# set __fish_git_prompt_color_cleanstate green
# set __fish_git_prompt_color_untrackedfiles yellow
#
#
# set __fish_git_prompt_char_stateseparator ' | '
# set __fish_git_prompt_char_cleanstate '•'
# # set __fish_git_prompt_char_conflictedstate ' ⚠️  '
# set __fish_git_prompt_char_dirtystate '+'
# # set __fish_git_prompt_char_invalidstate ' 🤮  '
# # set __fish_git_prompt_char_stagedstate ' 🚥  '
# # set __fish_git_prompt_char_stashstate ' 📦  '
# # set __fish_git_prompt_char_stateseparator ' | '
# # set __fish_git_prompt_char_untrackedfiles ' 🔍  '
# set __fish_git_prompt_char_upstream_ahead ' ☝️  '
# set __fish_git_prompt_char_upstream_behind ' 👇  '
# # set __fish_git_prompt_char_upstream_diverged ' 🚧  '
# # set __fish_git_prompt_char_upstream_equal ' 💯 '
#
# function fish_prompt
#   set last_status $status
#
#   set_color $fish_color_cwd
#   printf '%s' (prompt_pwd)
#   set_color normal
#
#   printf '%s' (__fish_git_prompt)
#   echo -n "> "
#   set_color normal
# end

# name: Informative Vcs
# author: Mariusz Smykula <mariuszs at gmail.com>

function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -l last_status $status

    if not set -q __fish_git_prompt_show_informative_status
        set -g __fish_git_prompt_show_informative_status 1
    end
    if not set -q __fish_git_prompt_hide_untrackedfiles
        set -g __fish_git_prompt_hide_untrackedfiles 1
    end
    if not set -q __fish_git_prompt_color_branch
        set -g __fish_git_prompt_color_branch white --bold
    end
    if not set -q __fish_git_prompt_showupstream
        set -g __fish_git_prompt_showupstream "informative"
    end
    if not set -q __fish_git_prompt_char_upstream_ahead
        set -g __fish_git_prompt_char_upstream_ahead "↑"
    end
    if not set -q __fish_git_prompt_char_upstream_behind
        set -g __fish_git_prompt_char_upstream_behind "↓"
    end
    if not set -q __fish_git_prompt_char_upstream_prefix
        set -g __fish_git_prompt_char_upstream_prefix ""
    end
    if not set -q __fish_git_prompt_char_stagedstate
        set -g __fish_git_prompt_char_stagedstate "●"
    end
    if not set -q __fish_git_prompt_char_dirtystate
        set -g __fish_git_prompt_char_dirtystate "+"
    end
    if not set -q __fish_git_prompt_char_untrackedfiles
        set -g __fish_git_prompt_char_untrackedfiles "…"
    end
    if not set -q __fish_git_prompt_char_invalidstate
        set -g __fish_git_prompt_char_invalidstate "✖"
    end
    if not set -q __fish_git_prompt_char_cleanstate
        set -g __fish_git_prompt_char_cleanstate "●"
    end
    if not set -q __fish_git_prompt_color_dirtystate
        set -g __fish_git_prompt_color_dirtystate blue
    end
    if not set -q __fish_git_prompt_color_stagedstate
        set -g __fish_git_prompt_color_stagedstate yellow
    end
    if not set -q __fish_git_prompt_color_invalidstate
        set -g __fish_git_prompt_color_invalidstate red
    end
    if not set -q __fish_git_prompt_color_untrackedfiles
        set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
    end
    if not set -q __fish_git_prompt_color_cleanstate
        set -g __fish_git_prompt_color_cleanstate green --bold
    end

    set -l color_cwd
    set -l prefix
    set -l suffix
    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '>'
    end

    # PWD
    set_color $color_cwd
    echo -n (prompt_pwd)
    set_color normal

    printf '%s ' (fish_git_prompt)

    set -l pipestatus_string (__fish_print_pipestatus "[" "] " "|" (set_color yellow) (set_color --bold yellow) $last_pipestatus)
    echo -n "$pipestatus_string"

    if not test $last_status -eq 0
        set_color $fish_color_error
        echo -n "[$last_status] "
        set_color normal
    end

    echo -n "$suffix "
end

fish_vi_key_bindings()
