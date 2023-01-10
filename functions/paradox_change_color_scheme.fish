function paradox_change_color_scheme --description "Changes the color scheme, depending on the current system color scheme (macos) or what the $paradox_color_scheme variable is set to. Defaults to 'dark' if all else fails" --on-variable paradox_color_scheme --on-event paradox_change_color_scheme
  if test -n "$BASE16_SHELL_ENABLE_VARS"; or contains -- "$paradox_disable_scheme_changes" true yes 1
    # We're using base16 or have disabled scheme changes don't change any color vars; call set colors once
    paradox_set_colors
    return
  end

  if set -q paradox_color_scheme
    set -s paradox_color_scheme
    if not contains -- $paradox_color_scheme light dark
      echo "Only 'light' and 'dark' color schemes are supported. Please fix your $paradox_color_scheme variable"
      set -s paradox_color_scheme
    else
      set scheme $paradox_color_scheme
    end
  else if command -q defaults
    # macOS is strange, it only spits out a value if we're not in light mode
    set scheme (defaults read -g AppleInterfaceStyle 2>/dev/null | string lower; or printf 'light')
  end

  if test $scheme = "light"
    set -g base00 $light_base00
    set -g base01 $light_base01
    set -g base02 $light_base02
    set -g base03 $light_base03
    set -g base04 $light_base04
    set -g base05 $light_base05
    set -g base06 $light_base06
    set -g base07 $light_base07
    set -g base08 $light_base08
    set -g base09 $light_base09
    set -g base0A $light_base0A
    set -g base0B $light_base0B
    set -g base0C $light_base0C
    set -g base0D $light_base0D
    set -g base0E $light_base0E
    set -g base0F $light_base0F
  else
    set -g base00 $dark_base00
    set -g base01 $dark_base01
    set -g base02 $dark_base02
    set -g base03 $dark_base03
    set -g base04 $dark_base04
    set -g base05 $dark_base05
    set -g base06 $dark_base06
    set -g base07 $dark_base07
    set -g base08 $dark_base08
    set -g base09 $dark_base09
    set -g base0A $dark_base0A
    set -g base0B $dark_base0B
    set -g base0C $dark_base0C
    set -g base0D $dark_base0D
    set -g base0E $dark_base0E
    set -g base0F $dark_base0F
  end
  paradox_set_colors
end
