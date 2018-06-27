_artisan()
{
    local cur prev opts base
    COMPREPLY=()
    #cur="${COMP_WORDS[COMP_CWORD]}"
    #prev="${COMP_WORDS[COMP_CWORD-1]}"
    #_get_comp_words_by_ref -n : cur
    _get_comp_words_by_ref -n : cur prev words
    #echo "${cur}";
    #echo "${prev}";
    #echo "${words[1]}";

    if [[ "${#cur}" == "0" ]]; then return 1;fi;

    # list all possible options
    #opts=$(artisan | grep -E -v "(^\s+\w+$|command)" | grep -E "^ " | sed -e 's/^ \+//' -e 's/ --/\n--/g' -e 's/ \+.*$//' -e 's/,//' | sort -u)
    opts=$(artisan list --raw | sed -e 's/ --/\n--/g' -e 's/ \+.*$//' -e 's/,//' | sort -u)

    #echo "word one is ${words[1]}";
    #array_contains opts "${words[1]}" && echo yes;

    # in_array && cur is void the procede to next level 
    if array_contains opts "${words[1]}" && ! array_contains opts "${cur}"; then
        #echo "${words[1]} exist!";
        #return 0;
        help_text=$(artisan ${words[1]} --help --raw)
        usage_start_at=$(echo "${help_text}" | grep -xn 'Usage:' | cut -d: -f1)
        arguments_start_at=$(echo "${help_text}" | grep -xn 'Arguments:' | cut -d: -f1)
        options_start_at=$(echo "${help_text}" | grep -xn 'Options:' | cut -d: -f1)
        help_start_at=$(echo "${help_text}" | grep -xn 'Help:' | cut -d: -f1)
        #echo "${options_start_at}"
        opts=$(echo "${help_text}" | sed -n -e "$((${options_start_at} + 1)),$((${help_start_at} - 1))p"  | sed -e 's/^ \+//' -e 's/ --/\n--/g' -e 's/ \+.*$//' -e 's/,//' -e 's/--env\[=ENV\]/--env/' | sort -u)
        #echo "${opts}";
        #echo "artisan ${words[1]} ";
        #return 0;
    fi

    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
    __ltrim_colon_completions $cur
    return 0
}
array_contains () { 
    local array="$1[@]"
    local seeking=$2
    #echo searching for $seeking
    local in=1
    for element in ${!array}; do
        #echo is $seeking == $element ?
        if [[ "$element" == "$seeking" ]]; then
            in=0
            break
        fi
    done
    return $in
}
complete -o default -F _artisan artisan
