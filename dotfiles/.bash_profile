# ------------------------------------
# PATH stuff
# ------------------------------------
export PATH=/usr/local/bin:$PATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# ------------------------------------
# EDITOR
# ------------------------------------
export EDITOR=emacs

# ------------------------------------
# terminal config stuff
# ------------------------------------

# For adding git info to prompt
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}
PS1="\[\e[92m\]\$(parse_git_branch)\[\e[95m\]\h:\W \$ \[\e[m\]"
export PS1

# For color output with `ls`
# See http://apple.stackexchange.com/questions/33677/how-can-i-configure-mac-terminal-to-have-color-ls-output
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# For auto-completion with `pass`
source /usr/local/etc/bash_completion.d/password-store

# ------------------------------------
# custom commands
# ------------------------------------

# Command for knitr + pdflatex + bibtex + pdflatex + pdflatex from a shell
knitretal () {
Rscript -e "library(knitr); knit('"$@".Rnw')"
pdflatex "$@".tex
bibtex "$@".aux
pdflatex "$@".tex
pdflatex "$@".tex
}

# ------------------------------------
# aliases
# ------------------------------------

## Aliases for `git`
alias git='hub'
alias g='git status -sb'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gpp='git pull --rebase && git push'
alias ga='git add'
alias gc='git commit'
alias gces='git commit -eS'
alias gca='git commit --amend'
alias gcv='git commit --no-verify'
alias gdv='git diff'
alias gdc='git diff --cached'
alias gl='git log --oneline --decorate'
alias gt='git tag'
alias grc='git rebase --continue'
alias gsl='git stash list'
alias gss='git stash save'

## Aliases for `cd`-ing into git repos

# Alias for personal website
alias cdpsite='cd ~/Documents/PersonalWebsite'

# Alias for TeXnology folder
alias cdtex='cd ~/Dropbox/TeXnology'

# Alias for `lingsem` folder
alias cdlingsem='cd ~/Dropbox/TeXnology/lingsem'

# Alias for config-files
alias cdconfig='cd ~/config-files'

# Alias for CV
alias cdcv='cd ~/Dropbox/SillyCareerStuff/adamlitercv'

# Alias for linguistics stuff
alias cdling='cd ~/Dropbox/linguistics'

# Alias for undergrad thesis
alias cdugradthesis='cd ~/Dropbox/linguistics/undergrad-thesis'

# Alias for masters-thesis
alias cdmastersthesis='cd ~/Dropbox/linguistics/masters-thesis'

# Alias for Emacs stuff
alias cdemacs='cd ~/config-files/.emacs.d'

# Alias for verbose brew update
alias bud='brew update -v'

# Alias for verbose brew upgrade
alias bug='brew upgrade --all -v'

# Alias for verbose brew cleanup
alias brc='brew cleanup -v'

# Alias for verbose brew prune
alias brp='brew prune -v'

# Alias for verbose brew update,
# verbose brew upgrade, verbose brew
# cleanup, and verbose brew prune
alias bra='bud && bug && brc && brp'

# Alias for `ssh-add` to add id_rsa
alias sshid='ssh-add ~/.ssh/id_rsa'

# Alias for koding
alias koding='ssh adamliter@uakk4b2c2319.adamliter.koding.io'

# Alias for `pass` to copy a password to clipboard
alias passcopy='pass show -c'

# Alias for `pass` to copy chess password to clipboard
alias chess='passcopy misc/chess'

# GPG alias
alias gpg='gpg2'

# GPG USB
alias gpgusb='gpg2 --home=/Volumes/adamliter1/.gnupg'

# For opening anything with TextWrangler
alias openTW='open -a "TextWrangler"'

# For opening any with Emacs
alias openE='open -a "Emacs"'

# Alias for CorpusSearch
alias CS='java -classpath ~/Applications/CS_2.003.04.jar csearch/CorpusSearch'

# Aliases for showing/revealing hidden files in Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'

alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'