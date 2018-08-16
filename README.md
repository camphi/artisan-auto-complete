# artisan-auto-complete
Script auto complete pour artisan

### Install :
- Download le script dans le `home` ... `cd && git clone https://github.com/camphi/artisan-auto-complete.git`
- Ajouter le script au `~/.bashrc` ... `. ~/artisan-auto-complete/artisan.sh`

### Adaptation au client :
- Ajouter à la fin du fichier `artisan.sh` vos version de PHP ex:
```
...
complete -o default -F _artisan php
complete -o default -F _artisan php7.1
complete -o default -F _artisan php7.2
```

### Notes :
- ajouter des couleurs
- https://github.com/scop/bash-completion/blob/583562b9e56207bd428497ceb96df4e1f1f53158/bash_completion
- https://www.artificialworlds.net/blog/2012/10/17/bash-associative-array-examples/
