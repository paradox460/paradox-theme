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
