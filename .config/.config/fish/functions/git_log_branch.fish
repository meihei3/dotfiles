function git_log_branch -d ""
  set -l branch (git branch --contains=HEAD | string match -r '^\*[\s\S]+$' | string replace '* ' '')
  set -l issue_num (echo "$branch" | string match -r '\#\d+')

  set -l base (test (count $argv) -gt 0; and echo $argv[1]; or echo 'develop')

  echo "git log --oneline $branch...$base"
  for i in (git log --oneline $branch...$base)[-1..1]
    echo '-' (string replace "$issue_num " '' $i)
  end
end
