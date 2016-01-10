function fish_prompt
  if status --is-interactive
    # Colorize the CWD depending on permissions
    switch $USER
      case root
        set -g paradox_prompt_pwd (set_color $fish_color_cwd_root)
        set -g paradox_prompt_character (echo -s (set_color red) "!")
      case '*'
        set -g paradox_prompt_pwd (set_color $fish_color_cwd)
        set -g paradox_prompt_character (echo -s (set_color normal) "\$")
    end

    function __paradox_pwd
      echo -s "$paradox_prompt_pwd" (prompt_pwd)
    end

    function __paradox_status
      if test $status -ne 0
        echo -s (set_color $fish_color_status) "[$last_status]"
      end
    end


    echo -e -s (__paradox_pwd) (set_color normal) (set_color yellow) (__fish_git_prompt) (__paradox_git_hash) (__paradox_status) (set_color normal) "\n$paradox_prompt_character "
  end
end
