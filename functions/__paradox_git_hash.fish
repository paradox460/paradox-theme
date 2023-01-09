function __paradox_git_hash --description "Get the current commit hash, if we're in a git working tree"
  set git_command 'git rev-parse --short HEAD 2>/dev/null'

  if type -q gtimeout
    set -p git_command 'timeout 1'
  end

  set git_head (eval $git_command)
  if test -n "$git_head"
    echo -s (set_color $paradox_git_prompt_color_hash) "[$git_head]"
  end
end
