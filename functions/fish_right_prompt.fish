function fish_right_prompt
  if status is-interactive
    set __paradox_date (command date +%I:%M:%S%p 2>/dev/null)
    echo -se "[$__paradox_date]"
  end
end
