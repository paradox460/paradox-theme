function __paradox_command_separator -e fish_postexec
  set -l status_prefix
  # Keep the vars so any command substitutions wont clobber them
  set -l last_status $status
  set -l last_pipestatus $pipestatus
  set -l status_color

  # If nonzero, add the pipe statuses
  if test $last_status -ne 0
    set -l formatted_status (string join '|' -- $last_pipestatus)
    set status_prefix "━┫$formatted_status┣"
    set status_color (set_color $paradox_status_color_error)
  else
    set status_color (set_color $paradox_status_color_normal)
  end
  # Calculate width of rule
  set -l prefix_width (string length "$status_prefix")
  set -l width (math $COLUMNS - $prefix_width)
  echo -s \n$status_color $status_prefix (string repeat -n $width '━')
end
