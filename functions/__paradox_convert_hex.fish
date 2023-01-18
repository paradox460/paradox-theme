# Anyone who implements OSC color code support _should_ just follow XParseColor
# supported syntaxes, but they don't.
# There's some funkiness about the leading # #, cases, and so forth
# However, they ALL support slash-separated triplets # COMPLETE with hex values
function __paradox_convert_hex --description "Convert a hex color code to an rgb triplet" -a hex
  set -l rr
  set -l gg
  set -l bb
  if test (string length $hex) -eq 3
    string match -q -r '(?<rr>[[:xdigit:]])(?<gg>[[:xdigit:]])(?<bb>[[:xdigit:]])' $hex
    set rr (string repeat -n 2 $rr)
    set gg (string repeat -n 2 $gg)
    set bb (string repeat -n 2 $bb)
  else
    string match -q -r '(?<rr>[[:xdigit:]]{2})(?<gg>[[:xdigit:]]{2})(?<bb>[[:xdigit:]]{2})' $hex
  end

  printf "%s/%s/%s" $rr $gg $bb
end
