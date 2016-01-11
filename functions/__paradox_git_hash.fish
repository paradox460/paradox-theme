function __paradox_git_hash --description "Get the current git commit hash, if we're in a git working tree"
  set -l git_command 'git rev-parse --is-inside-work-tree --short HEAD ^/dev/null'

  if type gtimeout >/dev/null ^/dev/null
    set  -l git_command 'timeout 1' git_command
  end

  set -l git_info (eval $git_command)
  if test (count $git_info) -gt 1
    set -l inside_worktree $git_info[1]
    set -l git_head $git_info[2]
    if test "true" = "$inside_worktree"
      echo -s (set_color blue) "[$git_head]"
    end
  end
end
