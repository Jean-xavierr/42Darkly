# SURVEY no secure data

- Aller dans l'onglet `SURVEY`
- Ouvrez l'inspecteur d'élément
- Aller dans la balise `form` qui envoie la requete `POST`
- Modifier la **valeur** d'une des options (contenu dans un `select`) pour y mettre un nombre plus grand que 10
- Sélectionner l'option modifiée

Le flag s'affiche :
> 03A944B434D5BAFF05F46C4BEDE5792551A2595574BCAFC9A6E25F67C382CCAA

# Why it's dangerous

Tout le monde peut entrer la valeur qu'il souhaite, ou potentiellement faire crash le serveur

# How to fix it

- Vérifier les données remises dans le backend, elle devraient toujours être en accord avec le type de données attendu.
