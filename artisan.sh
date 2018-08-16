_artisan()
{
    local cur prev opts base
    COMPREPLY=()
    _get_comp_words_by_ref -n : cur prev words
    
    if [[ "${#cur}" == "0" ]] || [[ "${words[1]}" != "artisan" ]]; then return 1;fi;

    # list all possible options
    opts=$(${words[0]} artisan list --raw | sed -e 's/ \+.*$//')

    if array_contains opts "${words[2]}" && ! array_contains opts "${cur}"; then
        help_text=$(artisan ${words[2]} --help --raw)
        usage_start_at=$(echo "${help_text}" | grep -xn 'Usage:' | cut -d: -f1)
        arguments_start_at=$(echo "${help_text}" | grep -xn 'Arguments:' | cut -d: -f1)
        options_start_at=$(echo "${help_text}" | grep -xn 'Options:' | cut -d: -f1)
        help_start_at=$(echo "${help_text}" | grep -xn 'Help:' | cut -d: -f1)
        
        opts=$(echo "${help_text}" | sed -n -e "$((${options_start_at} + 1)),$((${help_start_at} - 1))p"  | sed -e 's/^ \+//' -e 's/ --/\n--/g' -e 's/ \+.*$//' -e 's/,//' -e 's/--env\[=ENV\]/--env/' -e 's/|/ -/g')
    fi

    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
    __ltrim_colon_completions $cur
    return 0
}
array_contains () {
    local array="$1[@]"
    local seeking=$2
    local in=1
    for element in ${!array}; do
        if [[ "$element" == "$seeking" ]]; then
            in=0
            break
        fi
    done
    return $in
}
complete -o default -F _artisan php
