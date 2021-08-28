# ====== Abbr ===== #
# Git
abbr -a gs "git status"
abbr -a p "git push"
abbr -a P "git pull"
abbr -a g. "git add . ; git commit"
abbr -a gc "git commit"
abbr -a gco "git checkout"
abbr -a gd "git diff"
abbr -a ga "git add"
abbr -a puo "git push -u origin HEAD"


# ====== nodebrew ===== #
set -x PATH $HOME/.nodebrew/current/bin $PATH


# ====== phpbrew ===== #
source ~/.phpbrew/phpbrew.fish


# ====== fzf  ====== #
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"


# ====== go ====== #
set -x GOPATH (go env GOPATH)
set -x PATH (go env GOPATH)"/bin" $PATH


# ===== isucon ====== #
set -x DEV 1