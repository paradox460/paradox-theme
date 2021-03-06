function fish_prompt
  if status --is-interactive
    # Colorize the CWD depending on permissions
    switch $USER
      case root
        set -g __paradox_prompt_pwd (set_color $fish_color_cwd_root)
        set -g __paradox_prompt_character (echo -s (set_color red) "!")
      case '*'
        set -g __paradox_prompt_pwd (set_color $fish_color_cwd)
        set -g __paradox_prompt_character (echo -s (set_color normal) "\$")
    end

    function __paradox_pwd
      echo -s "$__paradox_prompt_pwd" (prompt_pwd)
    end

    echo -n -e -s (__paradox_pwd) (__fish_git_prompt) (__paradox_git_hash) (set_color normal) "\n$__paradox_prompt_character "
  end
end
