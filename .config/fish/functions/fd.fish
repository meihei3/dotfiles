function fd
  find . -maxdepth 1 -type d | fzf --height 40% --border --reverse | read -l result; and cd "$result"
end
