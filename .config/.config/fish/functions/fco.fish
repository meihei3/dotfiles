function fco -d "Fuzzy-find and checkout a branch"
  git branch | grep -v HEAD | string trim | fzf --height 40% --reverse --border --preview "_fco_branch_config {}" | read -l result; and git checkout "$result"
end

