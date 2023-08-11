function fish_prompt
  if status is-interactive
    set -l color_cwd $fish_color_cwd
    set -l suffix '$'
    if functions -q fish_is_root_user; and fish_is_root_user
      set -q fish_color_cwd_root; and set color_cwd $fish_color_cwd_root
      set suffix '#'
    end

    echo -n -e -s (set_color $color_cwd) (prompt_pwd) (fish_vcs_prompt) (__paradox_git_hash) (set_color normal) (set_color $fish_color_normal) "\n" (functions -q iterm2_prompt_mark; and iterm2_prompt_mark) "$suffix "
  end
end
