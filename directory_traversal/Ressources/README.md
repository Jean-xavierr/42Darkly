# Directory Traversal

Sur le lien : http://IP/index.php?page=upload#

Il est possible de remonter jusqu'au fichier `/etc/passwd` via le lien : http://IP/index.php?page=../../../../../../../etc/passwd

> **Congratulaton!! The flag is** : b12c4b2cb8094750ae121a676269aa9e2872d07c06e429d25a63196ec1c8c1d0

### Ressource

https://portswigger.net/web-security/file-path-traversal

La traversée de répertoire (également connue sous le nom de traversée de chemin de fichier) est une vulnérabilité de sécurité Web qui permet à un attaquant de lire des fichiers arbitraires sur le serveur qui exécute une application. Cela peut inclure le code et les données d'application, les informations d'identification pour les systèmes principaux et les fichiers sensibles du système d'exploitation. Dans certains cas, un attaquant peut être en mesure d'écrire dans des fichiers arbitraires sur le serveur, leur permettant de modifier les données ou le comportement de l'application, et finalement de prendre le contrôle total du serveur.


# Why it's dangerous

Tout le monde peut accéder à n'importe quel fichier de la machine.

Dont des fichiers confidentiels comme les mots de passe etc...

# How to fix it

On voit que c'est un script php qui prend en paramètre `page`. \
Il faudrait soit faire une protection dans ce fichier là soit avoir différents fichiers pour chaque page directement.
