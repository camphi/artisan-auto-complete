# artisan-auto-complete
Script auto complete pour artisan

### idées :
- php artisan | grep -E -v "(^\s+\w+$|command)" | grep -E "^ " | cut -f3 -d\ | cut -f1 -d,
- ajouter un "how to use"
