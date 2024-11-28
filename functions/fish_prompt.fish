function fish_prompt
  set -l last_status $status
  set -l last_pipestatus $pipestatus
  if status is-interactive
    set -l color_cwd $fish_color_cwd
    set -l suffix '$'
    if functions -q fish_is_root_user; and fish_is_root_user
      set -q fish_color_cwd_root; and set color_cwd $fish_color_cwd_root
      set suffix '#'
    end

    set -l status_blob

    if not set -q __paradox_command_separator; and test $last_status -ne 0
      set status_blob " " (set_color $paradox_status_color_error) "{" (string join '|' -- $last_pipestatus) "}" (set_color normal)
    end


    echo -n -e -s (set_color $color_cwd) (prompt_pwd) $status_blob (fish_vcs_prompt) (__paradox_git_hash) (set_color normal) (set_color $fish_color_normal) "\n"  "$suffix "(functions -q iterm2_prompt_end; and iterm2_prompt_end)
  end
end
