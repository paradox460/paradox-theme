function fish_right_prompt
  if status --is-interactive
    set -l __paradox_date (command date +%I:%M:%S%P ^/dev/null)
    if type ruby >/dev/null ^/dev/null
      # have to use the echo inline to prevent obnoxious spaces, i.e. (💎 2.3.0 )
      set __paradox_rb_version (echo -s "(💎  " (command ruby -e 'print RUBY_VERSION' ^/dev/null) ")")
    end

    echo -se (set_color blue) "$__paradox_rb_version" (set_color green) (__paradox_command_duration) (set_color normal) "[$__paradox_date]"
  end
end
