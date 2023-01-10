set base00 "1d1f21"
set base01 "282a2e"
set base02 "373b41"
set base03 "969896"
set base04 "b4b7b4"
set base05 "c5c8c6"
set base06 "e0e0e0"
set base07 "ffffff"
set base08 "cc6666"
set base09 "de935f"
set base0A "f0c674"
set base0B "b5bd68"
set base0C "8abeb7"
set base0D "81a2be"
set base0E "b294bb"
set base0F "a3685a"

if test -n "$BASE16_SHELL_ENABLE_VARS"
  set base00 $BASE16_COLOR_00_HEX
  set base01 $BASE16_COLOR_01_HEX
  set base02 $BASE16_COLOR_02_HEX
  set base03 $BASE16_COLOR_03_HEX
  set base04 $BASE16_COLOR_04_HEX
  set base05 $BASE16_COLOR_05_HEX
  set base06 $BASE16_COLOR_06_HEX
  set base07 $BASE16_COLOR_07_HEX
  set base08 $BASE16_COLOR_08_HEX
  set base09 $BASE16_COLOR_09_HEX
  set base0A $BASE16_COLOR_0A_HEX
  set base0B $BASE16_COLOR_0B_HEX
  set base0C $BASE16_COLOR_0C_HEX
  set base0D $BASE16_COLOR_0D_HEX
  set base0E $BASE16_COLOR_0E_HEX
  set base0F $BASE16_COLOR_0F_HEX
end


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

# If we're using iTerm2, set terminal colors here
if test -n "$ITERM_SESSION_ID"; and test -n "$BASE16_THEME"; and not contains -- "$paradox_disable_iterm_colors" yes true 1
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
  printf "\033]1337;SetColors=(string join , -- $iterm_colors)\033\\"
end
