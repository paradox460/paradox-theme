if status --is-interactive
  # Feel free to override these as needed, generally they respect the variable server, with some exceptions
  set -g fish_color_normal white
  set -g fish_color_command --bold green
  set -g fish_color_quote cyan
  set -g fish_color_redirection brown
  set -g fish_color_end A3685A
  set -g fish_color_error --bold --underline red
  set -g fish_color_param blue
  set -g fish_color_comment 969896
  set -g fish_color_match magenta
  set -g fish_color_search_match white --background=373B41
  set -g fish_color_operator DE935F
  set -g fish_color_escape cyan
  set -g fish_color_cwd yellow
  set -g fish_color_autosuggestion 808080
  # set -g fish_color_user
  # set -g fish_color_host
  set -g fish_pager_color_prefix cyan
  set -g fish_pager_color_completion white
  set -g fish_pager_color_description 808080
  set -g fish_pager_color_progress blue
  set -g fish_pager_color_secondary --background=282A2E

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
    set -l last_status $status
    if type -q jot
      if test $last_status -ne 0
        set __paradox_status_color (set_color red)
        set __paradox_status_string "┫ $last_status ┣"
        set __paradox_status_string_width (string length $__paradox_status_string)
        set __paradox_status_left_width (math \($COLUMNS / 2 \) - $__paradox_status_string_width)
        set __paradox_status_right_width (math $COLUMNS - \($__paradox_status_left_width + $__paradox_status_string_width\))
        echo -s $__paradox_status_color (jot -b '━' -s "" $__paradox_status_left_width ^/dev/null) $__paradox_status_string (jot -b '━' -s "" $__paradox_status_right_width ^/dev/null)
      else
        set __paradox_status_color (set_color green)
        echo -s $__paradox_status_color (jot -b '━' -s "" $COLUMNS ^/dev/null)
      end
    end
  end

  # Fix colors
  # Ensures colors are always base16
  # If you don't like, comment this section out
  if not set -q paradox_theme_colors
    set -g paradox_theme_colors tomorrow.dark
  end
  eval sh $HOME/.config/fish/fundle/paradox460/paradox-theme/base16-shell/base16-$paradox_theme_colors.sh
end
