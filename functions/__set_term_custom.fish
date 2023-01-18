function __set_term_custom --description "Set a terminal param"
  set -l pre
  set -l post
  if test -n "$TMUX"
    set pre "\ePtmux;\e\e]"
    set post "\e\e\\\\\e\\"
  else if string match -q -- '*screen*' $TERM
    set pre "\eP\e]"
    set post "\a\e\\"
  # Linux term doesn't support most codes other than color
  else if string match -q -- "linux*" $TERM
    return
  else
    set pre "\e]"
    set post "\e\\"
  end

  echo -n -s -e $pre $argv $post
end
