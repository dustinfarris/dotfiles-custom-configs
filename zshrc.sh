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
alias l='ledger -f'

export HISTCONTROL=ignorespace

export DJANGO_ENV=local

# export PATH="/Users/dustinfarris/anaconda3/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:./node_modules/.bin:$PATH"

. $HOME/.asdf/asdf.sh
# . $HOME/.asdf/completions/asdf.bash

export GPG_TTY=$(tty)

# export TERM="tmux-256color"

export VISUAL=nvim
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"

# For pypi: https://stackoverflow.com/questions/32772895/python-pip-install-error-ssl-certificate-verify-failed#37688849
export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem

# added by Anaconda3 5.0.1 installer
# export PATH="/Users/dustin/anaconda3/bin:$PATH"

# for python openssl
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

# for aws-shib
export PATH="$HOME/go/bin:$PATH"

# remember iex history
export ERL_AFLAGS="-kernel shell_history enabled"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dustinfarris/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dustinfarris/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dustinfarris/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dustinfarris/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$GOPATH/bin:$PATH"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/lib/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/lib/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/lib/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/lib/google-cloud-sdk/completion.zsh.inc'; fi
