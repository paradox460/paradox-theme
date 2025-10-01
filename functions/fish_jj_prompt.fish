function fish_jj_prompt
    if not command -sq jj
        return 1
    end
    set -l info "$(
      jj show 2>/dev/null --quiet --no-patch --color=never --ignore-working-copy \
      --template '
      surround("(", ")",
        separate("",
          if(conflict, "x"),
          if(empty, "e"),
          if(immutable, "i")
          )
      )'
    )"
    or return 1
    if test -n "$info"
      set -l color $paradox_jj_prompt_color_status
      if string match -q "*x*" $info
        set color $paradox_jj_prompt_color_status_error
      end
      echo -n -s " " (set_color $color) "$info" (set_color normal)
    end
end
