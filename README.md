# artisan-auto-complete
Script auto complete pour artisan

### idées :
- php artisan | grep -E -v "(^\s+\w+$|command)" | grep -E "^ " | cut -f3 -d\ | cut -f1 -d,
- ajouter un "how to use"
- php artisan | grep -E -v "(^\s+\w+$|command)" | grep -E "^ " | cut -f3 -d\ | cut -f1 -d, | cut -f1 -d: | sort -u
- php artisan | grep -E -v "(^\s+\w+$|command)" | grep -E "^ " | cut -f3 -d\ | grep -E ":" | cut -f1 -d: | sort -u
- https://www.artificialworlds.net/blog/2012/10/17/bash-associative-array-examples/
