function __set_term_var
  if string match -q -- 'linux*' $TERM
    return
  end

  __set_term_custom $argv[1] ";rgb:" (__paradox_convert_hex $argv[2])
end
