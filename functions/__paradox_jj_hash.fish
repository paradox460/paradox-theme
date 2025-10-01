function __paradox_jj_hash --description "Get the current commit and change id for the current repo"
  if not command -sq jj
    return 1
  end
  jj show 2>/dev/null --quiet --no-patch --color=never --ignore-working-copy \
    --template '
      separate("\t",
        change_id.shortest(8).prefix(),
        change_id.shortest(8).rest(),
        commit_id.shortest(8).prefix(),
        commit_id.shortest(8).rest()
      )
    ' \
  | read -l -d\t jj_change_id_prefix jj_change_id_rest jj_commit_id_prefix jj_commit_id_rest
  or return 1


  echo -s \
    " " \
    (set_color $paradox_jj_prompt_color_hash) \
    "[" \
    (set_color normal) \
    (set_color $paradox_jj_prompt_change_id_prefix_color_hash) \
    "$jj_change_id_prefix" \
    (set_color normal) \
    (set_color $paradox_jj_prompt_change_id_rest_color_hash) \
    "$jj_change_id_rest" \
    (set_color normal) \
    (set_color $paradox_jj_prompt_color_hash) \
    "|" \
    (set_color normal) \
    (set_color $paradox_jj_prompt_commit_id_prefix_color_hash) \
    "$jj_commit_id_prefix" \
    (set_color normal) \
    (set_color $paradox_jj_prompt_commit_id_rest_color_hash) \
    "$jj_commit_id_rest" \
    (set_color normal) \
    (set_color $paradox_jj_prompt_color_hash) \
    "]"
end
