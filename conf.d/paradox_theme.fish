# Configure git prompt

set -g __fish_git_prompt_showstashstate true
set -g __fish_git_prompt_show_informative_status true
set -g __fish_git_prompt_showcolorhints true

# See the __paradox_git_hash() function for where the current hash comes from
set -g __fish_git_prompt_describe_style branch

# Set cursors
set fish_cursor_default block
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore
set fish_cursor_visual block

# Add support to change color scheme on every prompt
if contains -- $paradox_refresh_scheme_on_prompt yes true 1
  function paradox_refresh_scheme_on_prompt --on-event fish_prompt
    echo "refreshing color scheme on prompt"
    paradox_change_color_scheme
  end
end
