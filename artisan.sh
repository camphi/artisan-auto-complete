_artisan()
{
    local cur prev opts base
    COMPREPLY=()
    _get_comp_words_by_ref -n : cur prev words
    
    if [[ "${#cur}" == "0" ]] || [[ "${words[1]}" != "artisan" ]]; then return 1;fi;

    opts=$(${words[0]} artisan list --raw | sed -e 's/ \+.*$//')

    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
    __ltrim_colon_completions $cur
    return 0
}
complete -o default -F _artisan php
complete -o default -F _artisan php5.6
complete -o default -F _artisan php7.0
complete -o default -F _artisan php7.1
complete -o default -F _artisan php7.2
