# artisan-auto-complete
Script auto complete pour artisan

### Install :
- Ajouter un alias pour `artisan` dans le `~/.bashrc` ... `alias artisan='php artisan'`
- Download le script dans le `home` ... `cd && git clone https://github.com/camphi/artisan-auto-complete.git`
- Ajouter le script au `~/.bashrc` ... `. ~/artisan-auto-complete/artisan`

### idées :
- ajouter un "how to use"
- ajouter les options des commandes
- auto complete une seul commande à la fois
- __ltrim_colon_completions
- ``php artisan | grep -E -v "(^\s+\w+$|command)" | grep -E "^ " | sed -e 's/^ \+//' -e 's/ --/\n--/g' -e 's/ \+.*$//' -e 's/,//' -e 's/:.*$/:/p' | sort -u``
- ``php artisan | grep -E -v "(^\s+\w+$|command)" | grep -E "^ " | cut -f3 -d\ | grep -E ":" | cut -f1 -d: | sort -u``
- https://www.artificialworlds.net/blog/2012/10/17/bash-associative-array-examples/
