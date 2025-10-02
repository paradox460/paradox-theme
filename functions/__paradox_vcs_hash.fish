function __paradox_vcs_hash --description "Get the current commit for git. jj is handled separately, in overridden fish_jj_prompt"
  begin
    command -sq jj; and jj root --quiet &>/dev/null; or return 1
  end
  or __paradox_git_hash $argv
end
