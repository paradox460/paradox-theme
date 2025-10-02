function fish_jj_prompt
    if not command -sq jj
        return 1
    end
    # Get bookmarks
    set -l bookmarks "$(jj show 2>/dev/null --quiet --no-patch --color=never --ignore-working-copy -r 'latest((@ | @-) & bookmarks())' \
    --template '
    bookmarks.join(" ")
    ')"
    or return 1

    # Data from current change only
    jj show 2>/dev/null --quiet --no-patch --color=never --ignore-working-copy -r '@' \
        --template '
    surround("<", ">",
      separate("",
        if(conflict, "x"),
        if(empty, "e"),
        if(immutable, "i")
        )
    )
    ++ "\t" ++
    separate(" ",
        change_id.shortest(8).prefix(),
        change_id.shortest(8).rest(),
        commit_id.shortest(8).prefix(),
        commit_id.shortest(8).rest()
      )
    ++ "\t" ++
    diff.stat()
    ' | read -l -z -d\t info ids stats
    or return 1

    set -l output ""

    if test -n "$bookmarks"
        # Truncate bookmarks if too long
        if test (string length -- $bookmarks) -gt 40
            set bookmarks $bookmarks[1..40] "…"
        end
        set -a output (set_color $paradox_jj_prompt_bookmark_prefix_color) "(" (set_color normal) (set_color $paradox_jj_prompt_bookmark_color) $bookmarks (set_color normal) (set_color $paradox_jj_prompt_bookmark_suffix_color) ")" (set_color normal) " "
    end

    if test -n "$info"
        set -l color $paradox_jj_prompt_status_color
        if string match -q "*x*" $info
            set color $paradox_jj_prompt_status_error_color
        end
        set -a output (set_color $color) "$info" (set_color normal) " "
    end

    set -a output (__paradox_jj_stats $stats) (__paradox_jj_hash $ids)

    echo -n -s " " $output
end

function __paradox_jj_stats --description "Extracts change stats"
    set files_changed 0
    set insertions 0
    set deletions 0
    string match -r -q -g -- '(?<files_changed>\d+) files? changed(?:, )?(?:(?<insertions>\d+) insertions?\(\+\))?(?:, )?(?:(?<deletions>\d+) deletions?\(\-\))?' $argv
    or return 1

    test "$files_changed" -gt 0 || return 0
    echo -s (set_color $paradox_jj_prompt_change_prefix_color) "{" (set_color normal) \
        (set_color $paradox_jj_prompt_change_total_color) "$files_changed" (set_color normal) " " \
        (set_color $paradox_jj_prompt_change_insertions_color) "+$insertions" (set_color normal) \
        (set_color $paradox_jj_prompt_change_deletions_color) "-$deletions" (set_color normal) \
        (set_color $paradox_jj_prompt_change_suffix_color) "}" (set_color normal) " "
end

function __paradox_jj_hash --description "Get the current commit and change id for the current repo"
    echo $argv | read -l -d' ' jj_change_id_prefix jj_change_id_rest jj_commit_id_prefix jj_commit_id_rest
    or return 1

    echo -s \
        (set_color $paradox_jj_prompt_hash_color) \
        "[" \
        (set_color normal) \
        (set_color $paradox_jj_prompt_change_id_prefix_hash_color) \
        "$jj_change_id_prefix" \
        (set_color normal) \
        (set_color $paradox_jj_prompt_change_id_rest_hash_color) \
        "$jj_change_id_rest" \
        (set_color normal) \
        (set_color $paradox_jj_prompt_hash_color) \
        "|" \
        (set_color normal) \
        (set_color $paradox_jj_prompt_commit_id_prefix_hash_color) \
        "$jj_commit_id_prefix" \
        (set_color normal) \
        (set_color $paradox_jj_prompt_commit_id_rest_hash_color) \
        "$jj_commit_id_rest" \
        (set_color normal) \
        (set_color $paradox_jj_prompt_hash_color) \
        "]"
end
