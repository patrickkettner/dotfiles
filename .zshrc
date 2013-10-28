#enable plugins via oh-my-zsh
plugins=(
  bower
  brew
  cloudapp
  cp
  dircycle
  extract
  gem
  git
  git-extras
  git-remote-branch
  github
  history-substring-search
  jake-node
  node
  npm
  nvm
  osx
  pip
  terminalapp
  tmux
  vundle
  web-search
)

# add additional zsh completions, if they exist
[ -f /usr/local/share/zsh-completions ] && fpath=(/usr/local/share/zsh-completions $fpath)
[ -f /usr/local/etc/bash_completion.d ] && fpath=(/usr/local/etc/bash_completion.d $fpath)

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
ZSH_TMUX_AUTOSTART=true

# Set term to screen or screen-256color based on current terminal support
ZSH_TMUX_FIXTERM=true

#report cpu-/system-/user-time of commands running longer than 5 seconds
REPORTTIME=6

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{extra,exports,aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
setopt nocaseglob
