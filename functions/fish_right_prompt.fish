function fish_right_prompt
  if status --is-interactive
    set -l __paradox_date (command date +%I:%M:%S%P ^/dev/null)
    if type ruby >/dev/null ^/dev/null
      # have to use the echo inline to prevent obnoxious spaces, i.e. (💎2.3.0 )
      set __paradox_rb_version (echo -s "(💎  " (command ruby -e 'print RUBY_VERSION' ^/dev/null) ")")
    end

    # The \e[1A code below is to move the prompt up a line, so it aligns with the first line of the lprompt.
    # The \e[1B code resets to the previous line, so everything renders properly
    echo -se "\e[1A" (set_color blue) "$__paradox_rb_version" (set_color green) (__paradox_command_duration) (set_color normal) "[$__paradox_date]"  "\e[1B"
  end
end
