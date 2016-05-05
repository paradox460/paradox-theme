if status --is-interactive
  set -g fish_color_autosuggestion 808080
  set -g fish_color_command --bold green
  set -g fish_color_cwd yellow
  set -g fish_color_cwd_root --bold red
  set -g fish_color_normal white
  set -g fish_color_param --bold blue
  set -g fish_color_quote --bold cyan
  set -g fish_color_search_match black --background=blue
  set -g fish_color_valid_path cyan --underline
  set -g fish_color_operator magenta
  set -g fish_color_redirection brown

  # Git prompt options
  set -g __fish_git_prompt_showstashstate true
  set -g __fish_git_prompt_show_informative_status true
  set -g __fish_git_prompt_showcolorhints true

  # Set some individual git colors
  set -g __fish_git_prompt_color_suffix yellow

  set -g __fish_git_prompt_color_upstream_ahead red
  set -g __fish_git_prompt_color_upstream_behind violet
  set -g __fish_git_prompt_color_cleanstate --bold green

  function __paradox_command_separator -e fish_postexec
    if type jot >/dev/null ^/dev/null
      set -l last_status $status
      if test $last_status -ne 0
        set __paradox_status_color (set_color red)
        set __paradox_status_string "┫$last_status┣"
        set __paradox_status_string_width (echo $__paradox_status_string | command wc -m ^/dev/null)
        set __paradox_status_left_width (math \($COLUMNS /2 \) - $__paradox_status_string_width)
        set __paradox_status_right_width (math $COLUMNS - \($__paradox_status_left_width + $__paradox_status_string_width - 1\))
        echo -s $__paradox_status_color (jot -b '━' -s "" $__paradox_status_left_width ^/dev/null) $__paradox_status_string (jot -b '━' -s "" $__paradox_status_right_width ^/dev/null)
      else
        set __paradox_status_color (set_color green)
        echo -s $__paradox_status_color (jot -b '━' -s "" $COLUMNS ^/dev/null)
      end
    end
  end
end
