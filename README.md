# artisan-auto-complete
Script auto complete pour artisan

### Install :
- Ajouter un alias pour `artisan` dans le `~/.bashrc` ... `alias artisan='php artisan'`

### idées :
- ajouter un "how to use"
- __ltrim_colon_completions
- ``php artisan | grep -E -v "(^\s+\w+$|command)" | grep -E "^ " | sed -e 's/^ \+//' -e 's/ --/\n--/g' -e 's/ \+.*$//' -e 's/,//' -e 's/:.*$/:/p' | sort -u``
- ``php artisan | grep -E -v "(^\s+\w+$|command)" | grep -E "^ " | cut -f3 -d\ | grep -E ":" | cut -f1 -d: | sort -u``
- https://www.artificialworlds.net/blog/2012/10/17/bash-associative-array-examples/
