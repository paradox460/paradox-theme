function __paradox_vcs_hash --description "Get the current commit (and change id if jj) for the current repo"
    __paradox_jj_hash $argv
    or __paradox_git_hash $argv
end
