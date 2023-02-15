function paradox_set_colors
  # Set fish color variables
  set -g fish_color_normal $base05
  set -g fish_color_command --bold $base0B
  set -g fish_color_keyword --bold --italics $base0E
  set -g fish_color_quote $base0C
  set -g fish_color_redirection $base0F
  set -g fish_color_end $base0F
  set -g fish_color_error --bold --underline $base08
  set -g fish_color_param $base0D
  set -g fish_color_valid_path $base0A
  set -g fish_color_option --italics $base0D
  set -g fish_color_comment $base03
  set -g fish_color_selection $base07 --bold --background=$base02
  set -g fish_color_operator $base09
  set -g fish_color_escape  $base0C
  set -g fish_color_autosuggestion $base03
  set -g fish_color_cwd $base0A
  set -g fish_color_cwd_root $base08
  set -g fish_color_user $base0B
  set -g fish_color_host $base0D
  set -g fish_color_host_remote $base0C
  set -g fish_color_status $base08
  set -g fish_color_cancel $base04
  set -g fish_color_search_match $base07

  # Fish pager variables
  set -g fish_pager_color_progress $base04 --background=$base02
  set -g fish_pager_color_prefix --underline $base03
  set -g fish_pager_color_completion $fish_color_normal
  set -g fish_pager_color_description --dim --italics $base0A
  set -g fish_pager_color_selected_background --background=$base02
  set -g fish_pager_color_selected_completion $base07
  set -g fish_pager_color_secondary_background --background=$base01

  # Git stuff
  set -g __fish_git_prompt_color_suffix $base0A
  set -g __fish_git_prompt_color_upstream_ahead $base08
  set -g __fish_git_prompt_color_upstream_behind $base0E
  set -g __fish_git_prompt_color_cleanstate --bold $base0B
  set -g paradox_git_prompt_color_hash $base0D --italics

  # Status line colors
  set -g paradox_status_color_normal $base0B
  set -g paradox_status_color_error $base08

  # Check to see if we're not interactive, or if base16 theme is already set, or if the user has disabled colors, if so then bail
  if not status is-interactive; or test -n "$BASE16_THEME"; or contains -- "$paradox_disable_custom_colors" yes true 1
    return
  end

  # 16 colors
  __set_term_color 0 $base00
  __set_term_color 1 $base08
  __set_term_color 2 $base0B
  __set_term_color 3 $base0A
  __set_term_color 4 $base0D
  __set_term_color 5 $base0E
  __set_term_color 6 $base0C
  __set_term_color 7 $base05
  __set_term_color 8 $base03
  __set_term_color 9 $base08
  __set_term_color 10 $base0B
  __set_term_color 11 $base0A
  __set_term_color 12 $base0D
  __set_term_color 13 $base0E
  __set_term_color 14 $base0C
  __set_term_color 15 $base07

  # 256 colors
  __set_term_color 16 $base09
  __set_term_color 17 $base0F
  __set_term_color 18 $base01
  __set_term_color 19 $base02
  __set_term_color 20 $base04
  __set_term_color 21 $base06

  # Background, foreground, and cursor
  __set_term_var 10 $base05 # fg
  __set_term_var 11 $base00 # bg
  if string match -q -- "rxvt*" $TERM
    __set_term_var 708 $base00 # rxvt's internal border
  end

  # __set_term_custom 12 ";7" # reverse video cursor

  # If we're using iTerm2, set terminal colors here
  if test -n "$ITERM_SESSION_ID"
    set -l iterm_colors \
      "fg=$base05"      \
      "bg=$base00"      \
      "bold=$base05"    \
      "link=$base0D"    \
      "selbg=$base02"   \
      "selfg=$base05"   \
      "curbg=$base05"   \
      "curfg=$base00"   \
      "black=$base00"   \
      "red=$base08"     \
      "green=$base0B"   \
      "yellow=$base0A"  \
      "blue=$base0D"    \
      "magenta=$base0E" \
      "cyan=$base0C"    \
      "white=$base07"
    printf "\033]1337;SetColors=%s\033\\" (string join , -- $iterm_colors)
  end
end
