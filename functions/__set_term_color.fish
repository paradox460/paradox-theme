function __set_term_color
  # Linux term can only do up to 16 colors
  if string match -q -- 'linux*' $TERM
    if test $argv[1] -lt 16
      printf "\eP%x%s" $argv
    end
    return
  end

  __set_term_custom "4;" $argv[1] ";rgb:" (__paradox_convert_hex $argv[2])
end
