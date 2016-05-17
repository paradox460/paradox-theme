# The fish_mode_prompt function is prepended to the prompt
function fish_mode_prompt --description "Displays the current mode"
  # Do nothing if not in vi mode
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    echo -s -n (set_color green) '['
    switch $fish_bind_mode
      case default
        echo -s (set_color --bold red) 'N'
      case insert
        echo -s (set_color --bold green) 'I'
      case replace-one
        echo -s (set_color --bold yellow) 'R'
      case visual
        echo -s (set_color --bold blue) 'V'
    end
    set_color normal
    echo -s -n (set_color green) '] '
    set_color normal
  end
end
