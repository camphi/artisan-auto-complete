# artisan-auto-complete
Script auto complete pour artisan

### Install :
- Ajouter un alias pour `artisan` dans le `~/.bashrc` ... `alias artisan='php artisan'`
- Download le script dans le `home` ... `cd && git clone https://github.com/camphi/artisan-auto-complete.git`
- Ajouter le script au `~/.bashrc` ... `. ~/artisan-auto-complete/artisan.sh`

### Notes :
- ajouter une version pour mac ou rendre le script compatible pour mac.
- ajouter les options des commandes
- ajouter des couleurs
- auto complete une seul commande à la fois
- __ltrim_colon_completions
- if prev = command and cur = \ ;then show prev command help
- https://github.com/scop/bash-completion/blob/583562b9e56207bd428497ceb96df4e1f1f53158/bash_completion
- https://www.artificialworlds.net/blog/2012/10/17/bash-associative-array-examples/
