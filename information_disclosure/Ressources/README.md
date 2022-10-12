# Information Disclosure

https://portswigger.net/web-security/information-disclosure/exploiting

> Many websites provide files at /robots.txt and /sitemap.xml to help crawlers navigate their site. Among other things, these files often list specific directories that the crawlers should skip, for example, because they may contain sensitive information.


On peut lire le fichier `/robots.txt`. Contenant:
```
Disallow: /whatever
Disallow: /.hidden
```

Dans `.hidden` il y a beaucoup de dossiers à explorer, contenant chacun un README
On écrit un crawler en shell qui permet de chercher si un README contient un chiffre.
Si oui on l'affiche, et c'est gagné !
