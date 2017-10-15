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

export DJANGO_ENV=local

export PATH="/usr/local/opt/openssl/bin:./node_modules/.bin:$PATH"

. $HOME/.asdf/asdf.sh
# . $HOME/.asdf/completions/asdf.bash

export GPG_TTY=$(tty)

# export TERM="tmux-256color"

export VISUAL=nvim
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"
